//
//  ContentView.swift
//  it
//
//  Created by hashimo ryoya on 2023/09/16.
//

import SwiftUI
import AVFoundation

struct ViewPositionKey: PreferenceKey {
    static var defaultValue: [CGRect] = []
    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}

struct ContentView: View {
    @ObservedObject var authManager = AuthManager.shared
    @State private var userName: String = ""
    @State private var avatar: [[String: Any]] = []
    @State private var userMoney: Int = 0
    @State private var userHp: Int = 100
    @State private var userCsFlag: Int = 0
    @State private var userAttack: Int = 20
    @State private var tutorialNum: Int = 0
    @State private var isButtonEnabled: Bool = true
    @State private var lastClickedDate: Date?
    @State private var isPresentingQuizBeginnerList: Bool = false
    @State private var isPresentingSettingList: Bool = false
    @State private var isPresentingQuizList: Bool = false
    @State private var isIntermediateQuizActive: Bool = false
    @State private var isPresentingStoryView: Bool = false
    @State private var isPresentingGachaView: Bool = false
    @State private var isPresentingAvatarList: Bool = false
    @State private var isPresentingSettingView: Bool = false
    @State private var isPresentingTimeAttakView: Bool = false
    @State private var isPresentingTittleView: Bool = false
    @State private var isPresentingIllustratedView: Bool = false
    @State private var isPresentingPentagonView: Bool = false
    @State private var isPresentingRankingView: Bool = false
    @State private var audioPlayerKettei: AVAudioPlayer?
    @ObservedObject var audioManager = AudioManager.shared
    @State private var showTutorial = true
    @State private var buttonRect: CGRect = .zero
    @State private var bubbleHeight: CGFloat = 0.0
    @State private var isSoundOn: Bool = true
    @State private var isLoading: Bool = true
    @State private var isShowingLoginBonus = false
    @State private var showLoginModal: Bool = false
//    @ObservedObject var interstitial = Interstitial()
    @ObservedObject var reward = Reward()
    @State private var rewardFlag: Int = 0
    @State private var customerFlag: Bool = false
    @Environment(\.requestReview) var requestReview
    @State private var userPreFlag: Int = 0
    @State private var preFlag: Bool = false
    @State private var startFlag: Bool = true
    @State private var isFlag: Bool = false
    @State private var showCreateButton: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
                if isLoading {
                    Text("")
                        .frame(maxWidth:.infinity,maxHeight:.infinity)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        if userPreFlag != 1 {
//                            BannerView()
//                                .frame(height: 60)
                        }
                        HStack{
                            
                            Image(systemName: "person.circle")
                                .foregroundColor(Color("fontGray"))
                            Text("\(userName)")
                                .foregroundColor(Color("fontGray"))
                            ZStack {
                                Image("コインバー")
                                    .resizable()
                                    .frame(width:80,height:30)
                                Text(" \(userMoney)")
                                    .foregroundColor(Color("fontGray"))
                                    .padding(.leading,25)
                                    .padding(.top,3)
                            }
                            Spacer()
                            Button(action: {
                                isPresentingSettingView = true
                            }) {
                                Image("お問い合わせバー")
                                    .resizable()
                                    .frame(width:140,height:50)
                                    .shadow(radius: 1)
                            }
                        }
                        .padding(.horizontal)
                        VStack{
                            HStack {
                                ZStack{
                                    if authManager.rewardFlag == 2 {
                                        Image("フレーム倍")
                                            .resizable()
                                            .frame(width:180,height:200)
                                            .opacity(1.0)
                                    } else {
                                        Image("フレーム")
                                            .resizable()
                                            .frame(width:180,height:200)
                                            .opacity(1.0)
                                    }
                                    Image(avatar.isEmpty ? "defaultIcon" : (avatar.first?["name"] as? String) ?? "")
                                        .resizable()
                                        .frame(width: 100,height:100)
                                }
                                
                                .font(.system(size: 24))
                                Spacer()
                                    .frame(width: 30)
                                VStack{
                                        ZStack {
                                            Image("レベルバー")
                                                .resizable()
                                                .frame(width:90,height:30)
                                            Text("\(authManager.level)")
                                                .foregroundColor(Color("fontGray"))
                                                .padding(.leading,25)
                                                .padding(.top,7)
                                        }
                                        HStack(alignment: .top){
                                            VStack(spacing: 0){
                                                ZStack {
                                                    Image("ハートバー")
                                                        .resizable()
                                                        .frame(width:90,height:30)
                                                    Text("\(userHp + (avatar.first?["health"] as? Int ?? 0))")
                                                        .multilineTextAlignment(.leading)
                                                        .foregroundColor(Color("fontGray"))
                                                        .padding(.leading,45)
                                                        .padding(.top,8)
                                                }
                                                HStack(spacing:3){
                                                    Image("上昇バー１")
                                                        .resizable()
                                                        .frame(width:25,height:25)
                                                    Text("＋\(avatar.first?["health"] as? Int ?? 0)")
                                                        .padding(.leading,-5)
                                                        .padding(.top,8)
                                                    Image(avatar.isEmpty ? "defaultIcon" : (avatar.first?["name"] as? String) ?? "")
                                                        .resizable()
                                                        .frame(width: 30,height:30)
                                                        .padding(.top,8)
                                                }.foregroundColor(Color("fontGray"))
                                                //                                                .padding(.leading)
                                            }
                                        }
                                        HStack(alignment: .top){
                                            VStack(spacing: 0) {
                                                ZStack {
                                                    Image("攻撃バー")
                                                        .resizable()
                                                        .frame(width:90,height:30)
                                                    Text("\(userAttack + (avatar.first?["attack"] as? Int ?? 0))").foregroundColor(Color("fontGray"))
                                                        .multilineTextAlignment(.leading)
                                                        .padding(.leading,45)
                                                        .padding(.top,7)
                                                }
                                                HStack(spacing:3){
                                                    Image("上昇バー２")
                                                        .resizable()
                                                        .frame(width:25,height:25)
                                                    Text("＋\(avatar.first?["attack"] as? Int ?? 0)")
                                                        .padding(.leading,-5)
                                                        .padding(.top,8)
                                                    Image(avatar.isEmpty ? "defaultIcon" : (avatar.first?["name"] as? String) ?? "")
                                                        .resizable()
                                                        .frame(width: 30,height:30)
                                                        .padding(.top,8)
                                                }
                                                .padding(.leading,3)
                                                .foregroundColor(Color("fontGray"))
                                            }
                                        }
                                }
                            }
                            HStack{
                                Text("経験値").foregroundColor(Color("fontGray"))
                                ProgressBar(value: Float(authManager.experience) / Float(authManager.level * 100))
                                    .frame(height: 20)
                                Text("\(authManager.experience) / \(authManager.level * 100)")
                                    .foregroundColor(Color("fontGray"))
                            }
                            .padding(.horizontal)
                            VStack(spacing:-5){
                                HStack{
                                    VStack{
                                        Button(action: {
                                            // 画面遷移のトリガーをオンにする
                                            self.isPresentingGachaView = true
                                            audioManager.playSound()
                                        }) {
                                            Image("ガチャボタン1")
                                                .resizable()
//                                                .frame(width:180,height:65)
                                                .frame(width: isSmallDevice() ? 160 : 160, height: isSmallDevice() ? 50 : 55)
                                        }.padding(.bottom)
                                        Button(action: {
                                            // 画面遷移のトリガーをオンにする
                                            self.isPresentingRankingView = true
                                            audioManager.playSound()
                                        }) {
                                            Image("ランキングボタン1")
                                                .resizable()
    //                                                .frame(width:180,height:65)
                                                .frame(width: isSmallDevice() ? 160 : 160, height: isSmallDevice() ? 50 : 55)
                                        }
                                    }
                                    Spacer()
                                        .frame(width:20)
                                    VStack{
                                        Button(action: {
                                            audioManager.playSound()
                                            // 画面遷移のトリガーをオンにする
                                            self.isPresentingQuizList = true
                                        }) {
                                            Image("ダンジョンボタン1")
                                                .resizable()
                                            //                                            .frame(width:130,height:130)
                                                .frame(width: isSmallDevice() ? 135 : 135, height: isSmallDevice() ? 130 : 135)
                                        }
                                        .padding(.top)
                                        .background(GeometryReader { geometry in
                                            Color.clear.preference(key: ViewPositionKey.self, value: [geometry.frame(in: .global)])
                                        })
                                    }
                                }
                                HStack{
                                    Button(action: {
                                        // 画面遷移のトリガーをオンにする
                                        self.isPresentingIllustratedView = true
                                        audioManager.playSound()
                                    }) {
                                        Image("おとも図鑑ボタン1")
                                            .resizable()
                                            .frame(width: isSmallDevice() ? 160 : 160, height: isSmallDevice() ? 50 : 55)
                                    }
                                    .padding(.top)
                                    Spacer()
                                        .frame(width:15)
                                    Button(action: {
                                        // 画面遷移のトリガーをオンにする
                                        self.isPresentingTittleView = true
                                        audioManager.playSound()
                                    }) {
                                        Image("称号ボタン1")
                                            .resizable()
//                                                .frame(width:180,height:65)
                                            .frame(width: isSmallDevice() ? 160 : 160, height: isSmallDevice() ? 50 : 55)
                                    }.padding(.top)
                                    
                                }
                            }
                            .shadow(radius: 3)
                            VStack{
                                Group{
                                    NavigationLink("", destination: ManagerTabView().navigationBarBackButtonHidden(true), isActive: $isPresentingQuizList)
//
                                NavigationLink("", destination: GachaView(), isActive: $isPresentingGachaView)
//                                
                                NavigationLink("", destination: IllustratedView(isPresenting: .constant(false)).navigationBarBackButtonHidden(true), isActive: $isPresentingIllustratedView)
                                }
                                    NavigationLink("", destination: TittlesView(isPresenting: .constant(false)).navigationBarBackButtonHidden(true), isActive: $isPresentingTittleView)
                                NavigationLink("", destination: RankingView(audioManager: audioManager).navigationBarBackButtonHidden(true), isActive: $isPresentingRankingView)
//                                NavigationLink("", destination: Test(isPresenting: .constant(false), viewModel: QuizBeginnerStoryViewModel()).navigationBarBackButtonHidden(true), isActive: $isPresentingStoryView)
//                                
//                                NavigationLink("", destination: ContactView(audioManager: AudioManager()).navigationBarBackButtonHidden(true), isActive: $isPresentingSettingView)
                                    //                                    NavigationLink("", destination:  PentagonView(authManager: authManager).navigationBarBackButtonHidden(true), isActive: $isPresentingPentagonView)
                                    //                                }
                                
                            }
                            //                            .padding(.horizontal,5)
                        }
                    }
                    }
                    .onPreferenceChange(ViewPositionKey.self) { positions in
                        self.buttonRect = positions.first ?? .zero
                    }
                }
                
                if startFlag {
                    TutorialModalView(isPresented: $startFlag, isFlag: $isFlag, showAlert: $startFlag)
                }
                
                if isFlag {
                    ChangeNameView(isPresented: $isFlag)
                }
                
                if tutorialNum == 1 {
                    GeometryReader { geometry in
                        Color.black.opacity(0.5)
                            .overlay(
//                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                Circle()
                                
                                    .frame(width: buttonRect.width, height: buttonRect.height)
                                    .position(x: buttonRect.midX, y: buttonRect.midY+8)
                                    .blendMode(.destinationOut)
                            )
                            .ignoresSafeArea()
                            .compositingGroup()
                            .background(.clear)
                    }
                    VStack {
                        Spacer()
                            .frame(height: buttonRect.minY - bubbleHeight)
                        VStack(alignment: .trailing, spacing: .zero) {
                            Text("「ダンジョン」をクリックしてください。")
                                .font(.callout)
                                .padding(5)
                                .font(.system(size: 24.0))
                                .padding(.all, 16.0)
                                .background(Color("Color2"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray, lineWidth: 15)
                                )
                                .cornerRadius(20)
                                .padding(.horizontal, 16)
                                .foregroundColor(Color("fontGray"))
                                .shadow(radius: 10)
                        }
                        .background(GeometryReader { geometry in
                            Path { _ in
                                DispatchQueue.main.async {
                                    self.bubbleHeight = geometry.size.height + 16
                                }
                            }
                        })
                        Spacer()
                    }
                    .ignoresSafeArea()
                    VStack{
                        HStack{
                            Button(action: {
                                tutorialNum = 0 // タップでチュートリアルを終了
                                authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 0) { success in
                                       // データベースのアップデートが成功したかどうかをハンドリング
                                   }
                            }) {
                                Image("スキップ")
                                    .resizable()
                                    .frame(width:200,height:60)
                                    .padding(.top,20)
                            }
                            Spacer()
                        }
                        .padding(.leading)
                        Spacer()
                    }
                }
            }
            .onTapGesture {
                if tutorialNum == 1 {
                    audioManager.playSound()
                    tutorialNum = 0 // タップでチュートリアルを終了
                    authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 2) { success in
                        // データベースのアップデートが成功したかどうかをハンドリング
                    }
                }
            }
                        .background(Color("Color2"))
            }
        .navigationViewStyle(StackNavigationViewStyle())
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .onAppear {
            let userDefaults = UserDefaults.standard
            if !userDefaults.bool(forKey: "hasLaunchedBeforeOnappear") {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    startFlag = true
                    showCreateButton = true
                }
            }
            userDefaults.set(true, forKey: "hasLaunchedBeforeOnappear")
            userDefaults.synchronize()
            authManager.fetchPreFlag()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                userPreFlag = authManager.userPreFlag
                if userPreFlag != 1 {
                    executeProcessEveryFortyTimes()
                }
            }
            executeProcessEveryTwentyTimes()
            authManager.fetchUserCsFlag()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if authManager.userCsFlag == 0 {
                    executeProcessEveryThreeTimes()
                }
            }
            authManager.fetchUserRewardFlag()
            reward.checkRewardReset()
            authManager.fetchLastClickedDate(userId: authManager.currentUserId ?? "") { lastDate in
                if let lastDate = lastDate {
                    // 2. 現在の日時との差を計算
                    let currentDate = Date()
                    let timeInterval = currentDate.timeIntervalSince(lastDate)
                    
                    // 3. 24時間以上経過しているか確認
                    if timeInterval >= 86400 {  // 86400秒 = 24時間
                        isButtonEnabled = true
                    } else {
                        isButtonEnabled = false
                    }
                } else {
                    isButtonEnabled = true
                }
            }
            authManager.fetchUserInfo { (name, avatar, money, hp, attack, tutorialNum) in
                self.userName = name ?? ""
                self.avatar = avatar ?? [[String: Any]]()
                self.userMoney = money ?? 0
                self.userHp = hp ?? 100
                self.userAttack = attack ?? 20
                self.tutorialNum = tutorialNum ?? 0
                self.isLoading = false
            }
            authManager.fetchAvatars {
                self.avatar = authManager.avatars.map { avatar in
                    return ["name": avatar.name]
                }
            }
            authManager.fetchUserExperienceAndLevel()
        }
        .sheet(isPresented: $preFlag) {
            PreView(audioManager: audioManager)
        }
        .onChange(of: showLoginModal) { userMoney in
            authManager.getUserMoney { userMoney in
                self.userMoney = userMoney
            }
        }
            .onChange(of: isPresentingQuizList) { isPresenting in
                fetchUserInfoIfNeeded(isPresenting: isPresenting)
                authManager.fetchUserExperienceAndLevel()
                authManager.fetchUserRewardFlag()
            }
            .onChange(of: isPresentingAvatarList) { isPresenting in
                fetchUserInfoIfNeeded(isPresenting: isPresenting)
                authManager.fetchUserExperienceAndLevel()
                authManager.fetchUserRewardFlag()
            }

            .background(Color("purple2").opacity(0.6))  // ここで背景色を設定
            .edgesIgnoringSafeArea(.all)  // 画面の端まで背景色を伸ばす
            }
    private func fetchUserInfoIfNeeded(isPresenting: Bool) {
        if !isPresenting {
            authManager.fetchUserInfo { (name, avatar, money, hp, attack, tutorialNum) in
                self.userName = name ?? ""
                self.avatar = avatar ?? [[String: Any]]()
                self.userMoney = money ?? 0
                self.userHp = hp ?? 100
                self.userAttack = attack ?? 20
                self.tutorialNum = tutorialNum ?? 0
            }
        }
    }
    
    func executeProcessEveryTwentyTimes() {
        // UserDefaultsからカウンターを取得
        let count = UserDefaults.standard.integer(forKey: "TwentyLaunchCount") + 1
        
        // カウンターを更新
        UserDefaults.standard.set(count, forKey: "TwentyLaunchCount")
        
        // 10回に1回の割合で処理を実行
        if count % 20 == 0 {
            requestReview()
        }
    }
    
    func isSmallDevice() -> Bool {
        return UIScreen.main.bounds.width < 390
    }
    
    func saveLastLoginDate() {
        let defaults = UserDefaults.standard
        defaults.set(Date(), forKey: "lastLoginDate")
    }
    
    func saveLoginBonusReceivedDate() {
        let defaults = UserDefaults.standard
        defaults.set(Date(), forKey: "lastLoginBonusReceivedDate")
    }
    
    func executeProcessEveryThreeTimes() {
        // UserDefaultsからカウンターを取得
        let count = UserDefaults.standard.integer(forKey: "launchCount") + 1
        
        // カウンターを更新
        UserDefaults.standard.set(count, forKey: "launchCount")
        
        // 3回に1回の割合で処理を実行
        if count % 5 == 0 {
            customerFlag = true
        }
    }
    
    func executeProcessEveryFortyTimes() {
        // UserDefaultsからカウンターを取得
        let count = UserDefaults.standard.integer(forKey: "launchPreCount") + 1
        
        // カウンターを更新
        UserDefaults.standard.set(count, forKey: "launchPreCount")
        
        // 3回に1回の割合で処理を実行
        if count % 30 == 0 {
            preFlag = true
        }
    }

    func checkForLoginBonus() -> Bool {
        let defaults = UserDefaults.standard
        let lastLoginDate = defaults.object(forKey: "lastLoginDate") as? Date ?? Date.distantPast
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: lastLoginDate, to: Date())
        
        if let days = components.day, days > 0 {
            // 1日以上経過している場合はボーナスを付与
            return true
        } else {
            // 1日経過していない場合はボーナスを付与しない
            return false
        }
    }
}

struct ProgressBar: View {
    var value: Float

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: CGFloat(self.value) * geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemTeal))
//                    .animation(.linear)
            }
        }.cornerRadius(45.0)
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
//        ContentView()
        TopView()
    }
}
