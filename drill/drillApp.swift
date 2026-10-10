//
//  itApp.swift
//  it
//
//  Created by hashimo ryoya on 2023/09/16.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseMessaging
import UserNotifications
import GoogleMobileAds
import AVFoundation

/// DEBUG ビルドで使う Google 公式のテスト用広告ユニット。
/// 開発中の表示が本番の統計（表示回数・CTR・eCPM）を汚さないようにするためのもの。
enum AdTestUnitID {
    static let banner = "ca-app-pub-3940256099942544/2435281174"
    static let interstitial = "ca-app-pub-3940256099942544/4411468910"
    static let rewarded = "ca-app-pub-3940256099942544/1712485313"
}

enum AppAdConfiguration {
    /// 子ども向け（COPPA / GDPR の16歳未満）扱いにするかどうか。
    ///
    /// true の間は広告が非パーソナライズかつ G 指定のみに制限されるため eCPM は構造的に低くなる。
    /// App Store の Kids カテゴリ登録、または AdMob の「子ども向けとして扱う」設定が有効な場合は
    /// 法的に必須なので false にしてはいけない。
    /// false に変更する場合は ATT（NSUserTrackingUsageDescription + requestTrackingAuthorization）の
    /// 実装をセットで行うこと。
    static let isChildDirected = true

    static func configureForKidsCategory() {
        let requestConfiguration = MobileAds.shared.requestConfiguration

        if isChildDirected {
            requestConfiguration.maxAdContentRating = GADMaxAdContentRating.general
            requestConfiguration.tagForChildDirectedTreatment = true
            // TFCD の GDPR 側の対応。未設定だと EEA/UK 向けリクエストに同意シグナルが乗らない。
            requestConfiguration.tagForUnderAgeOfConsent = true
            requestConfiguration.setPublisherFirstPartyIDEnabled(false)
        }

#if DEBUG
        // 実機デバッグ時はここに端末の GADSimulatorID / デバイスIDを追加するとテスト広告になる。
        requestConfiguration.testDeviceIdentifiers = []
#endif
    }

    static func makeRequest() -> Request {
        Request()
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    var appState: AppState!
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        guard !SubscriptionRuntime.isTesting else { return true }
        AppAdConfiguration.configureForKidsCategory()
        MobileAds.shared.start(completionHandler: nil)
        self.appState = AppState.shared
        Messaging.messaging().delegate = self

        UNUserNotificationCenter.current().delegate = self

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in })

        application.registerForRemoteNotifications()

        Messaging.messaging().token { token, error in
            if let error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token {
                print("FCM registration token: \(token)")
            }
        }
        
        // オーディオセッションを設定
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try audioSession.setActive(true)
        } catch {
            print("Failed to set audio session category.")
        }

        let userDefaults = UserDefaults.standard
        if !userDefaults.bool(forKey: "hasLaunchedBefore") {
            let authManager = AuthManager()
//            authManager.anonymousSignIn(){
//                DispatchQueue.main.async {
//                    authManager.createUser() {
//                        DispatchQueue.main.async {
//                            print("USERID:\(authManager.currentUserId!)")
//                        }
//                    }
//                }
//            }
            userDefaults.set(true, forKey: "hasLaunchedBefore")
            userDefaults.synchronize()
        }
        return true
    }

    func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Oh no! Failed to register for remote notifications with error \(error)")
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // APNsデバイストークンを読みやすい形式に変換する処理
        var readableToken = ""
        for index in 0 ..< deviceToken.count {
            readableToken += String(format: "%02.2hhx", deviceToken[index] as CVarArg)
        }
        print("Received an APNs device token: \(readableToken)")
        
        // FirebaseにAPNsトークンを設定
        Messaging.messaging().apnsToken = deviceToken
    }
}


extension AppDelegate: MessagingDelegate {
    @objc func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase token: \(String(describing: fcmToken))")
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _: UNUserNotificationCenter,
        willPresent _: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([[.banner, .list, .sound]])
    }

    func userNotificationCenter(
        _: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        let userInfo = response.notification.request.content.userInfo
        NotificationCenter.default.post(
            name: Notification.Name("didReceiveRemoteNotification"),
            object: nil,
            userInfo: userInfo
        )
        completionHandler()
    }
}

@main
struct drillApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject var authManager: AuthManager
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var appState = AppState.shared
    
    init() {
        FirebaseApp.configure()
        authManager = AuthManager.shared
    }
    
    var body: some Scene {
        WindowGroup {
#if DEBUG
            if ProcessInfo.processInfo.arguments.contains("-StoryAdventurePreview") {
                StoryAdventurePreviewHost()
            } else if ProcessInfo.processInfo.arguments.contains("-WeaknessReviewPreview") {
                WeaknessReviewPreviewHost()
            } else {
                appContent
            }
#else
            appContent
#endif
        }
    }

    @ViewBuilder private var appContent: some View {
        if SubscriptionRuntime.isTesting {
            // Tests must not run gameplay or sync purchases to Firebase.
            Color.clear
        } else {
            RootView(authManager: authManager)
                .environmentObject(appState)
                .task(id: authManager.currentUserId) {
                    WeaknessCourseStore.shared.configure(userID: authManager.currentUserId)
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .active {
                        Task { await appState.refreshSubscriptionState() }
                    }
                }
        }
    }
}
