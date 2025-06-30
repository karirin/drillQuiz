//
//  ITManagerListView.swift
//  it
//
//  Created by Apple on 2024/03/09.
//

import SwiftUI
import AVFoundation
import Firebase

struct KokugoListView: View {
    @State private var isIntermediateQuizActive: Bool = false
    @State private var isPresentingQuizBeginnerList: Bool = false
    @ObservedObject var authManager = AuthManager.shared
    @State private var isButtonEnabled: Bool = true
    @State private var lastClickedDate: Date = Date()
    @State private var audioPlayerKettei: AVAudioPlayer?
    @State private var isPresentingQuizBeginner: Bool = false
    @State private var isPresentingQuizIntermediate: Bool = false
    @State private var isPresentingQuizAdvanced: Bool = false
    @State private var isPresentingQuizNetwork: Bool = false
    @State private var isPresentingQuizSecurity: Bool = false
    @State private var isPresentingQuizDatabase: Bool = false
    @State private var isPresentingQuizGod: Bool = false
    @State private var isPresentingQuizIncorrectAnswer: Bool = false
    @State private var isSoundOn: Bool = true
    @ObservedObject var audioManager = AudioManager.shared
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresenting: Bool
    @State private var tutorialNum: Int = 0
    @State private var buttonRect: CGRect = .zero
    @State private var bubbleHeight: CGFloat = 0.0
    @State private var isIncorrectAnswersEmpty: Bool = true
//    @ObservedObject var reward = Reward()
    @StateObject var reward = Reward()
    @State private var showLoginModal: Bool = false
    @State private var isButtonClickable: Bool = false
    @State private var showAlert: Bool = false
    @State private var preFlag: Bool = false
    @State private var userPreFlag: Int = 0
    @State private var isLoading: Bool = true
    
    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
        _lastClickedDate = State(initialValue: Date())
    }


    var body: some View {
//        NavigationView{
            ZStack{
                    ScrollView{
                        VStack {
                            HStack {
                                Text(" ")
                                    .frame(width:isIPad() ? 10 : 5,height: isIPad() ? 40 : 15)
                                    .background(.gray)
                                Text("不正解した問題だけを解くことができます")
                                    .font(.system(size: isIPad() ? 40 : 15))
                                    .foregroundColor(Color("fontGray"))
                                Spacer()
                            }
                            .padding(.leading,30)
                            .padding(.bottom)
                            .padding(.top)
                            Button(action: {
                                generateHapticFeedback()
                                audioManager.playKetteiSound()
                                // 画面遷移のトリガーをオンにする
                                if userPreFlag != 1 {
                                    preFlag = true
                                } else {
                                    if !isIncorrectAnswersEmpty {
                                        self.isPresentingQuizIncorrectAnswer = true
                                    }
                                }
                            }) {
                                if isLoading {
                                    ZStack{
                                        Image("国語復習問題白黒")
                                            .resizable()
                                            .frame(height: isIPad() ? 200 : 70)
                                        ProgressView()
                                            .scaleEffect(2)
                                    }
                                } else {
                                    ZStack {
                                        if isIncorrectAnswersEmpty == true {
                                            Image("国語復習問題白黒")
                                                .resizable()
                                                .frame(height: isIPad() ? 200 : 70)
                                        }else{
                                            Image("国語復習問題")
                                                .resizable()
                                                .frame(height: isIPad() ? 200 : 70)
                                        }
                                        if userPreFlag != 1 {
                                            
                                            ZStack{
                                                Color.black.opacity(0.45)
                                                    .cornerRadius(30)
                                                Text("プレミアムプランを登録すると\n復習機能が開放されます")
                                                    .font(.system(size: isIPad() ? 50 : 20))
                                                    .foregroundStyle(.white)
                                                    .bold()
                                                    .multilineTextAlignment(.center)
                                            }
                                        }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .shadow(radius: 3)
                            .fullScreenCover(isPresented: $isPresentingQuizIncorrectAnswer) {
                                IncorrectKokugoListView(isPresenting: $isPresentingQuizIncorrectAnswer)
                                        }
                            .onChange(of: isPresentingQuizBeginner) { isPresenting in
                                    fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { count in
                                }
                            }
                            .onChange(of: isPresentingQuizIncorrectAnswer) { isPresenting in
                                    fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { count in
                                }
                            }
                            .onChange(of: isPresentingQuizIntermediate) { isPresenting in
                                    fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { count in
                                }
                            }
                            .onChange(of: isPresentingQuizAdvanced) { isPresenting in
                                    fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { count in
                                }
                            }
                            .onChange(of: isPresentingQuizGod) { isPresenting in
                                    fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { count in
                                }
                            }
                            .onChange(of: isPresentingQuizNetwork) { isPresenting in
                                    fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { count in
                                }
                            }
                            .onChange(of: isPresentingQuizSecurity) { isPresenting in
                                    fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { count in
                                }
                            }
                            .onChange(of: isPresentingQuizDatabase) { isPresenting in
                                    fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { count in
                                }
                            }
                        
                            HStack {
                                Text(" ")
                                    .frame(width:isIPad() ? 10 : 5,height: isIPad() ? 40 : 15)
                                    .background(.gray)
                                Text("問題の種類を選ぶことができます")
                                    .font(.system(size: isIPad() ? 40 : 16))
                                    .foregroundColor(Color("fontGray"))
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                            .padding(.leading,15)
                                Button(action: {
                                generateHapticFeedback()
                                    audioManager.playKetteiSound()
                                    // 画面遷移のトリガーをオンにする
                                    self.isPresentingQuizBeginner = true
                                }) {
                                    //                        Image("IT基礎知識の問題の初級")
                                    Image("国語１")
                                        .resizable()
                                        .frame(height: isIPad() ? 200 : 70)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                            
                            .background(GeometryReader { geometry in
                                Color.clear.preference(key: ViewPositionKey.self, value: [geometry.frame(in: .global)])
                            })
                                .padding(.bottom)
                                .shadow(radius: 3)
                                .fullScreenCover(isPresented: $isPresentingQuizBeginner) {
                                                Kokugo1ListView(isPresenting: $isPresentingQuizBeginner)
                                            }
                            
                            Button(action: {
                                generateHapticFeedback()
                                audioManager.playKetteiSound()
                                self.isPresentingQuizIntermediate = true
                            }) {
                                //                    Image("IT基礎知識の問題の中級")
                                Image("国語２")
                                    .resizable()
                                    .frame(height: isIPad() ? 200 : 70)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .shadow(radius: 3)
                            .fullScreenCover(isPresented: $isPresentingQuizIntermediate) {
                                Kokugo2ListView(isPresenting: $isPresentingQuizIntermediate)
                                        }
                            
                            Button(action: {
                                generateHapticFeedback()
                                audioManager.playKetteiSound()
                                self.isPresentingQuizGod = true
                            }) {
                                //                    Image("データベース系の問題")
                                Image("国語３")
                                    .resizable()
                                    .frame(height: isIPad() ? 200 : 70)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .shadow(radius: 3)
                            .fullScreenCover(isPresented: $isPresentingQuizGod) {
                                Kokugo3ListView(isPresenting: $isPresentingQuizGod)
                                        }
                            Button(action: {
                                generateHapticFeedback()
                                audioManager.playKetteiSound()
                                self.isPresentingQuizAdvanced = true
                            }) {
                                //                    Image("IT基礎知識の問題の上級")
                                Image("国語４")
                                    .resizable()
                                    .frame(height: isIPad() ? 200 : 70)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .shadow(radius: 3)
                            .fullScreenCover(isPresented: $isPresentingQuizAdvanced) {
                                Kokugo4ListView(isPresenting: $isPresentingQuizAdvanced)
                                        }
                            Button(action: {
                                generateHapticFeedback()
                                audioManager.playKetteiSound()
                                self.isPresentingQuizNetwork = true
                            }) {
                                //                    Image("IT基礎知識の問題の上級")
                                Image("国語５")
                                    .resizable()
                                    .frame(height: isIPad() ? 200 : 70)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .shadow(radius: 3)
                            .fullScreenCover(isPresented: $isPresentingQuizNetwork) {
                                Kokugo5ListView(isPresenting: $isPresentingQuizNetwork)
                                        }
                            Button(action: {
                                generateHapticFeedback()
                                audioManager.playKetteiSound()
                                self.isPresentingQuizSecurity = true
                            }) {
                                //                    Image("IT基礎知識の問題の上級")
                                Image("国語６")
                                    .resizable()
                                    .frame(height: isIPad() ? 200 : 70)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .shadow(radius: 3)
                            .fullScreenCover(isPresented: $isPresentingQuizSecurity) {
                                Kokugo6ListView(isPresenting: $isPresentingQuizSecurity)
                                        }
                            .padding(.bottom,130)
                        }
                    }
//                    .overlay(
//                        ZStack {
//                            Spacer()
//                            HStack {
//                                Spacer()
//                                VStack{
//                                    Spacer()
//                                    HStack {
//                                        Button(action: {
//                                generateHapticFeedback()
//                                            reward.ExAndMoReward()
//                                        }, label: {
//                                            if reward.rewardLoaded{
//                                                Image("倍ボタン")
//                                                    .resizable()
//                                                    .frame(width: 110, height: 110)
//                                            }else{
//                                                Image("倍ボタン白黒")
//                                                    .resizable()
//                                                    .frame(width: 110, height: 110)
//                                            }
//                                        })
//                                            .shadow(radius: 5)
//                                            .disabled(!reward.rewardLoaded)
//                                            .onChange(of: reward.rewardEarned) { rewardEarned in
//                                                showAlert = rewardEarned
//                                                print("onchange reward.rewardEarned:\(showAlert)")
//                                            }
//                                            .alert(isPresented: $showAlert) {
//                                                Alert(
//                                                    title: Text("報酬獲得！"),
//                                                    message: Text("1時間だけ獲得した経験値とコインが2倍"),
//                                                    dismissButton: .default(Text("OK"), action: {
//                                                        showAlert = false
//                                                        reward.rewardEarned = false
//                                                    })
//                                                )
//                                            }
//                                            .padding(.bottom)
////                                                .fullScreenCover(isPresented: $showAnotherView_post, content: {
////                                                    RewardRegistrationView()
////                                                })
//
//                                            Spacer()
//                                    }
//                                }
//                            }
//                        }
//                    )
                .onPreferenceChange(ViewPositionKey.self) { positions in
                    self.buttonRect = positions.first ?? .zero
                }
                    
            }
            
            .onTapGesture {
                if tutorialNum == 3 {
                        audioManager.playSound()
                    tutorialNum = 0
                    authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 4) { success in
                        // データベースのアップデートが成功したかどうかをハンドリング
                    }
                }
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(Color("Color2"))
            .onAppear {
                reward.LoadReward()
                fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { count in
                    authManager.fetchPreFlag()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        userPreFlag = authManager.userPreFlag
                        isLoading = false
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // 1秒後に
                    self.isButtonClickable = true // ボタンをクリック可能に設定
                    
                }
                authManager.fetchUserInfo { (name, avatar, money, hp, attack, tutorialNum) in
                    if let fetchedTutorialNum = tutorialNum {
                        self.tutorialNum = fetchedTutorialNum
                    }
                }
                if let userId = authManager.currentUserId {
                    authManager.fetchLastClickedDate(userId: userId) { date in
                        if let unwrappedDate = date {
                            lastClickedDate = unwrappedDate
                            let calendar = Calendar.current
                            if calendar.isDateInToday(unwrappedDate) {
                                isButtonEnabled = false
                            }
                        } else {
                            print("lastClickedDate is nil")
                        }
                    }
                }
                isIntermediateQuizActive = authManager.level >= 10
                if let soundURL = Bundle.main.url(forResource: "soundKettei", withExtension: "mp3") {
                    do {
                        audioPlayerKettei = try AVAudioPlayer(contentsOf: soundURL)
                    } catch {
                        print("Failed to initialize audio player: \(error)")
                    }
                }
                if audioManager.isMuted {
                    audioPlayerKettei?.volume = 0
                } else {
                    audioPlayerKettei?.volume = 1.0
                }
            }
            .sheet(isPresented: $preFlag) {
                PreView(audioManager: audioManager)
            }
            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading: Button(action: {
//                                generateHapticFeedback()
//                self.presentationMode.wrappedValue.dismiss()
//                audioManager.playCancelSound()
//            }) {
//                Image(systemName: "chevron.left")
//                    .foregroundColor(Color("fontGray"))
//                Text("戻る")
//                    .foregroundColor(Color("fontGray"))
//            }.padding(.top))
//            .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        Text("ダンジョン一覧")
//                            .font(.system(size: 20)) // ここでフォントサイズを指定
//                            .foregroundStyle(Color("fontGray"))
//                    }
//                }
//            }
        .navigationViewStyle(StackNavigationViewStyle())

        }
    func isIPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    func fetchNumberOfIncorrectAnswers(userId: String, completion: @escaping (Int) -> Void) {
    let ref = Database.database().reference().child("IncorrectKokugoAnswers").child(userId)
    ref.observeSingleEvent(of: .value) { snapshot in
        
    let count = snapshot.childrenCount // 子ノードの数を取得
    completion(Int(count))
        print("count:\(count)")
        self.isIncorrectAnswersEmpty = (count == 0)
    }
    }
    func isSmallDevice() -> Bool {
        return UIScreen.main.bounds.width < 390
    }
    }

#Preview {
    KokugoListView(isPresenting: .constant(false))
//    ManagerListView(isPresenting: .constant(false))
//    TopView()
}
