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

struct ModernUserNameBar: View {
    let userName: String
    let onTapRegister: () -> Void
    
    var body: some View {
        HStack(spacing: 8) {
            // ユーザーアイコン
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 32, height: 32)
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                )
            
            if userName.isEmpty {
                Button(action: onTapRegister) {
                    HStack(spacing: 4) {
                        Text("名前を登録")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                        Image(systemName: "pencil.circle.fill")
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        LinearGradient(
                            colors: [Color.orange, Color.red.opacity(0.8)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(16)
                }
            } else {
                Text(userName)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color("fontGray"))
                    .lineLimit(1)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}

struct ModernCoinBar: View {
    let coins: Int
    @State private var isAnimating = false
    
    var body: some View {
        HStack(spacing: 6) {
            // コインアイコン
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.yellow, Color.orange],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 24, height: 24)
                    .shadow(color: .orange.opacity(0.5), radius: 3, x: 0, y: 2)
                
                Text("¢")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
            .scaleEffect(isAnimating ? 1.1 : 1.0)
            
            Text("\(coins)")
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundColor(Color("fontGray"))
                .contentTransition(.numericText())
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay(
                    Capsule()
                        .strokeBorder(
                            LinearGradient(
                                colors: [Color.yellow.opacity(0.5), Color.orange.opacity(0.3)],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 1.5
                        )
                )
                .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
        )
        .onChange(of: coins) { _ in
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isAnimating = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isAnimating = false
            }
        }
    }
}

struct ModernHelpButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: "questionmark.circle.fill")
                    .font(.system(size: 16, weight: .semibold))
                Text("ヘルプ")
                    .font(.system(size: 13, weight: .semibold))
            }
            .foregroundColor(.white)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(
                LinearGradient(
                    colors: [Color.blue, Color.cyan],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(20)
            .shadow(color: .blue.opacity(0.3), radius: 4, x: 0, y: 2)
        }
    }
}

struct ModernLevelBar: View {
    let level: Int
    let experience: Int
    let maxExperience: Int
    
    private var progress: CGFloat {
        guard maxExperience > 0 else { return 0 }
        return CGFloat(experience) / CGFloat(maxExperience)
    }
    
    var body: some View {
        HStack(spacing: 10) {
            // レベルバッジ
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.purple, Color.blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 40, height: 40)
                    .shadow(color: .purple.opacity(0.4), radius: 4, x: 0, y: 2)
                
                VStack(spacing: -2) {
                    Text("Lv")
                        .font(.system(size: 9, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                    Text("\(level)")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
            }
            
            // 経験値バー
            ProgressExpBar(level: level, experience: experience)
//            VStack(alignment: .leading, spacing: 4) {
//                HStack {
//                    Text("経験値")
//                        .font(.system(size: 11, weight: .medium))
//                        .foregroundColor(.secondary)
//                    Spacer()
//                    Text("\(experience) / \(maxExperience)")
//                        .font(.system(size: 11, weight: .semibold, design: .rounded))
//                        .foregroundColor(Color("fontGray"))
//                }
//
//                GeometryReader { geometry in
//                    ZStack(alignment: .leading) {
//                        // 背景
//                        RoundedRectangle(cornerRadius: 6)
//                            .fill(Color.gray.opacity(0.2))
//
//                        // プログレス
//                        RoundedRectangle(cornerRadius: 6)
//                            .fill(
//                                LinearGradient(
//                                    colors: [Color.blue, Color.purple],
//                                    startPoint: .leading,
//                                    endPoint: .trailing
//                                )
//                            )
//                            .frame(width: geometry.size.width * progress)
//                            .animation(.spring(response: 0.5, dampingFraction: 0.8), value: progress)
//
//                        // シャイン効果
//                        RoundedRectangle(cornerRadius: 6)
//                            .fill(
//                                LinearGradient(
//                                    colors: [.white.opacity(0.3), .clear],
//                                    startPoint: .top,
//                                    endPoint: .center
//                                )
//                            )
//                            .frame(width: geometry.size.width * progress)
//                    }
//                }
//                .frame(height: 12)
//            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
        )
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
    @State private var startFlag: Bool = false
    @State private var isFlag: Bool = false
    @State private var showCreateButton: Bool = false
    @State private var selectedAvatar: Avatar?
    @State private var isUserExists: Bool? = nil
    @State private var csFlag: Bool = false
    @State private var helpFlag: Bool = false
    @State private var showLoginBonus: Bool = false
    @State private var currentBonus: Int = 0 // 追加: 現在のボーナス額を保持
    @State private var loginCount: Int = 0
    @State private var showCoinAlert: Bool = false
    @State private var isSignUpFlag: Bool = true
    @State private var isPresentingTraining: Bool = false
    @State private var updateNameFlag: Bool = false
    
    private var maxExperience: Int {
        return 100 // または authManager から取得
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                if isLoading {
                    VStack{
                        ActivityIndicator()
                    }
                        .frame(maxWidth:.infinity,maxHeight:.infinity)
                } else {
                    VStack {
                        if userPreFlag != 1 {
                            BannerAdView()
                                .frame(height: 60)
                                .padding(.bottom, -10)
                        }
                        ZStack{
                            Image("背景IT")
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing:10) {
                                    HStack{
                                            ModernUserNameBar(
                                                userName: userName,
                                                onTapRegister: {
                                                    updateNameFlag = true
                                                }
                                            )
                                            .onChange(of: updateNameFlag) { _ in
                                                authManager.fetchUserInfo { (name, avatar, money, hp, attack, tutorialNum) in
                                                    self.userName = name ?? ""
                                                    self.avatar = avatar ?? [[String: Any]]()
                                                    self.userMoney = money ?? 0
                                                    self.userHp = hp ?? 100
                                                    self.userAttack = attack ?? 20
                                                    self.tutorialNum = tutorialNum ?? 0
                                                    self.isLoading = false
                                                }
                                            }
                                        
                                        Spacer()
                                        ModernCoinBar(coins: userMoney)
                                        
                                        ModernHelpButton {
                                            generateHapticFeedback()
                                            helpFlag = true
                                        }
                                    }
                                    ModernLevelBar(
                                        level: authManager.level,
                                        experience: authManager.experience,
                                        maxExperience: maxExperience
                                    )
                                }
                                .padding(.horizontal)
                                VStack(spacing: 10) {
                                    ZStack{
                                        HStack(spacing: isSmallDevice() ? 0 : -20) {
                                            ZStack{
                                                Image(avatar.isEmpty ? "defaultIcon" : (avatar.first?["name"] as? String) ?? "")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: isSmallDevice() ? 150 : 200)
                                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: 0)
                                            }
                                            .padding(.top, isSmallDevice() ? 20 : 30)
                                            .padding(.trailing, isSmallDevice() ? 0 : 0)
                                            HStack{
                                                VStack{
                                                    VStack(spacing:0){
                                                        ZStack {
                                                            Image("ハートバー")
                                                                .resizable()
                                                                .scaledToFit()
                                                                .frame(height: isSmallDevice() ? 40 : 40)
                                                            Text("\(userHp + (avatar.first?["health"] as? Int ?? 0))")
                                                                .multilineTextAlignment(.leading)
                                                                .font(.system(size: 20))
                                                                .padding(.leading,45)
                                                                .padding(.top,10)
                                                        }
                                                        HStack(spacing:3){
                                                            ZStack{
                                                                Image("上昇バー１")
                                                                    .resizable()
                                                                    .scaledToFit()
                                                                    .frame(height: isSmallDevice() ? 30 : 30)
                                                                HStack(spacing: 0){
                                                                    Text("＋\(avatar.first?["health"] as? Int ?? 0)")
                                                                        .padding(.top,3)
                                                                        .font(.system(size: 18))
                                                                    Image(avatar.isEmpty ? "defaultIcon" : (avatar.first?["name"] as? String) ?? "")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(height:isSmallDevice() ? 30 : 40)
                                                                        .padding(.top,8)
                                                                }
                                                                .padding(.leading,40)
                                                            }.padding(.leading,40)
                                                        }
                                                    }
                                                    VStack(spacing:0){
                                                        ZStack {
                                                            Image("攻撃バー")
                                                                .resizable()
                                                                .scaledToFit()
                                                                .frame(height:isSmallDevice() ? 40 : 40)
                                                            Text("\(userAttack + (avatar.first?["attack"] as? Int ?? 0))")
                                                                .multilineTextAlignment(.leading)
                                                                .padding(.leading,45)
                                                                .padding(.top,8)
                                                                .font(.system(size: 20))
                                                        }
                                                        HStack(spacing:3){
                                                            ZStack{
                                                                Image("上昇バー２")
                                                                    .resizable()
                                                                    .scaledToFit()
                                                                    .frame(height:isSmallDevice() ? 30 : 30)
                                                                HStack(spacing: 0){
                                                                    Text("＋\(avatar.first?["attack"] as? Int ?? 0)")
                                                                        .padding(.top,3)
                                                                        .font(.system(size:18))
                                                                    Image(avatar.isEmpty ? "defaultIcon" : (avatar.first?["name"] as? String) ?? "")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(height:isSmallDevice() ? 30 : 40)
                                                                        .padding(.top,8)
                                                                }
                                                                .padding(.leading,40)
                                                            }.padding(.leading,40)
                                                        }
                                                    }
                                                }
                                            }
                                            .padding(.top, isSmallDevice() ? 10 : 0)
                                        }
                                    }
                                    VStack(spacing:-5){
                                        HStack{
                                            VStack{
                                                HStack{
                                                    Spacer()
                                                    ZStack{
                                                        Button(action: {
                                generateHapticFeedback()
                                                            self.isPresentingTraining = true
                                                            audioManager.playSound()
                                                        }) {
                                                            Image("ダンジョンボタン")
                                                                .resizable()
                                                                .scaledToFit()
                                                                .frame(width:isSmallDevice() ? 150 : 160)
                                                            
                                                        }.shadow(radius:10)
                                                            .padding(.leading ,10)
                                                    }
                                                    Button(action: {
                                generateHapticFeedback()
                                                        self.isPresentingQuizList = true
                                                        audioManager.playSound()
                                                    }) {
                                                        Image("トレーニングボタン")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width:isSmallDevice() ? 150 : 160)
                                                            .background(GeometryReader { geometry in
                                                                Color.clear.preference(key: ViewPositionKey.self, value: [geometry.frame(in: .global)])
                                                            })
                                                            .padding(.leading ,10)
                                                    }
                                                    .shadow(radius:10)
                                                    .padding(.trailing)
                                                    Spacer()
                                                }
                                                HStack{
                                                    Button(action: {
                                generateHapticFeedback()
                                                        self.isPresentingGachaView = true
                                                        audioManager.playSound()
                                                    }) {
                                                        Image("ガチャボタン")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: isSmallDevice() ? 160 : 160)
                                                    }
                                                    .shadow(radius:10)
                                                    Button(action: {
                                generateHapticFeedback()
                                                        self.isPresentingRankingView = true
                                                        audioManager.playSound()
                                                    }) {
                                                        Image("ランキングボタン")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: isSmallDevice() ? 180 : 170)
                                                    }.shadow(radius:10).padding(.bottom, -5)
                                                }
                                                HStack{
                                                    Button(action: {
                                generateHapticFeedback()
                                                        // 画面遷移のトリガーをオンにする
                                                        self.isPresentingIllustratedView = true
                                                        audioManager.playSound()
                                                    }) {
                                                        Image("おとも図鑑ボタン")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: isSmallDevice() ? 160 : 160)
                                                    }.shadow(radius:10)
                                                    
                                                    Button(action: {
                                generateHapticFeedback()
                                                        self.isPresentingTittleView = true
                                                        audioManager.playSound()
                                                    }) {
                                                        Image("称号ボタン")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: isSmallDevice() ? 160 : 160)
                                                    }.shadow(radius:10).padding(.bottom, -5)
                                                }.padding(.leading,-10)
                                            }
                                        }
                                    }
                                    VStack{
                                        Group{
                                            NavigationLink("", destination: ManagerView().navigationBarBackButtonHidden(true), isActive: $isPresentingQuizList)
                                            //
                                            NavigationLink("", destination: GachaView()
                                                .navigationBarBackButtonHidden(true), isActive: $isPresentingGachaView)
                                            //
                                            NavigationLink("", destination: IllustratedView(isPresenting: .constant(false)).navigationBarBackButtonHidden(true), isActive: $isPresentingIllustratedView)
                                        }
                                        NavigationLink("", destination: TittlesView(isPresenting: .constant(false)).navigationBarBackButtonHidden(true), isActive: $isPresentingTittleView)
                                        NavigationLink("", destination: RankingView(audioManager: audioManager).navigationBarBackButtonHidden(true), isActive: $isPresentingRankingView)
                                        //                                NavigationLink("", destination: Test(isPresenting: .constant(false), viewModel: QuizBeginnerStoryViewModel()).navigationBarBackButtonHidden(true), isActive: $isPresentingStoryView)
                                        //
                                        NavigationLink("", destination: ContactView(audioManager: AudioManager()).navigationBarBackButtonHidden(true), isActive: $isPresentingSettingView)
                                        NavigationLink("", destination: StoryView(isReturnActive: .constant(true), isPresented: $isPresentingTraining).navigationBarBackButtonHidden(true), isActive: $isPresentingTraining)
                                        //                                    NavigationLink("", destination:  PentagonView(authManager: authManager).navigationBarBackButtonHidden(true), isActive: $isPresentingPentagonView)
                                        //                                }
                                        
                                    }
                                    //                            .padding(.horizontal,5)
                                }
                                .padding(.top, -15)
                            }
                        }
                    }
                    .onPreferenceChange(ViewPositionKey.self) { positions in
                        self.buttonRect = positions.first ?? .zero
                    }
                }
                if showLoginBonus {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showLoginBonus = false
                            showCoinAlert = true
                        }
                    StampAnimationView(loginCount: $loginCount)
                        .onTapGesture {
                            showLoginBonus = false
                            showCoinAlert = true
                        }
                }
                if csFlag {
                    ReviewView(audioManager: audioManager, isPresented: $csFlag, helpFlag: $helpFlag)
                }
                
                if helpFlag {
                    HelpModalView(audioManager: AudioManager(), isPresented: $helpFlag)
                }
                
                if startFlag {
                    TutorialModalView(isPresented: $startFlag, isFlag: $isFlag, showAlert: $startFlag)
                }
                
                if customerFlag == true {
                    HelpModalView(audioManager: AudioManager(), isPresented: $customerFlag)
                }
                
                if isFlag {
                    ChangeNameView(isPresented: $isFlag, isReturnBtn: .constant(false), tutorialNum: $tutorialNum, authManager: authManager)
                }
                
                if updateNameFlag {
                    ChangeNameView(isPresented: $updateNameFlag, isReturnBtn: .constant(true), tutorialNum: $tutorialNum, authManager: authManager)
                }
                
                if tutorialNum == 1 {
                    GeometryReader { geometry in
                        Color.black.opacity(0.5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
//                                Circle()
                                
                                    .frame(width: buttonRect.width, height: buttonRect.height)
                                    .position(x: buttonRect.midX, y: buttonRect.midY)
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
                            Text("「学習モード」をクリックしてください。")
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
                                generateHapticFeedback()
                                tutorialNum = 0 // タップでチュートリアルを終了
                                authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 0) { success in
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
        .simultaneousGesture(
            TapGesture().onEnded {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                to: nil, from: nil, for: nil)
            }
        )
        .alert(isPresented: $showCoinAlert) {
            Alert(
                title: Text("ログインボーナス！！"),
                message: Text("\(currentBonus)コイン獲得しました"),
                dismissButton: .default(Text("OK")) {
                    // アラートが閉じられた後のアクションが必要ならここに記述
                }
            )
        }
        .onAppear {
            let userDefaults = UserDefaults.standard
            if !userDefaults.bool(forKey: "hasLaunchedBeforeOnappear") {
                isSignUpFlag = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    startFlag = true
                    showCreateButton = true
                    authManager.saveUserToDatabase(userName: userName) { success in
                        if success {
                            authManager.fetchUserInfo { (name, avatar, money, hp, attack, tutorialNum) in
                                self.userName = name ?? ""
                                self.avatar = avatar ?? [[String: Any]]()
                                self.userMoney = money ?? 0
                                self.userHp = hp ?? 100
                                self.userAttack = attack ?? 20
                                self.tutorialNum = tutorialNum ?? 0
                                self.isLoading = false
                            }
                        } else {
                        }
                    }
                    }
                }
            userDefaults.set(true, forKey: "hasLaunchedBeforeOnappear")
            userDefaults.synchronize()
            if let userId = authManager.currentUserId {
                authManager.checkIfUserIdExists(userId: userId) { exists in
                    self.isUserExists = exists
                    if isUserExists != nil {
                        authManager.fetchPreFlag()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            userPreFlag = authManager.userPreFlag
                            if userPreFlag != 1 {
                                executeProcessEveryFortyTimes()
                            }
                        }
                        authManager.fetchUserCsFlag()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            if authManager.userCsFlag == 0 {
                                executeProcessEveryThreeTimes()
                                executeProcessEveryTwentyTimes()
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
                            
                            authManager.checkAndGrantLoginBonus { granted in
                                if granted {
                                    self.currentBonus = self.authManager.loginBonus
                                    self.loginCount = self.authManager.loginCount
                                    if isSignUpFlag {
                                        self.showLoginBonus = true
                                    }
                                }
                            }
                        }
                        authManager.fetchAvatars {
                            self.avatar = authManager.avatars.map { avatar in
                                return ["name": avatar.name]
                            }
                        }
                        authManager.fetchUserExperienceAndLevel()
                            }
                        }
                    }
                }
        .fullScreenCover(isPresented: $preFlag) {
            PreView(audioManager: audioManager)
        }
        .onChange(of: showCoinAlert) { userMoney in
            authManager.getUserMoney { userMoney in
                self.userMoney = userMoney
            }
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
    func fetchUserInfoIfNeeded(isPresenting: Bool) {
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
        if count % 15 == 0 {
            csFlag = true
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
        if count % 20 == 0 {
            customerFlag = true
        }
    }
    
    func executeProcessEveryFortyTimes() {
        // UserDefaultsからカウンターを取得
        let count = UserDefaults.standard.integer(forKey: "launchPreCount") + 1
        
        // カウンターを更新
        UserDefaults.standard.set(count, forKey: "launchPreCount")
        
        // 3回に1回の割合で処理を実行
        if count % 10 == 0 {
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
