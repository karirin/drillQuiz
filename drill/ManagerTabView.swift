//
//  ManagerTabView.swift
//  it
//
//  Created by Apple on 2024/03/22.
//

import SwiftUI

struct TopTabView: View {
    let list: [String]
    @Binding var selectedTab: Int

    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(0 ..< list.count, id: \.self) { row in
                Button(action: {
                                generateHapticFeedback()
                    withAnimation {
                        selectedTab = row
                    }
                }, label: {
                    VStack(spacing: 0) {
                        HStack {
                            Text(list[row])
                                .font(Font.system(size: 18, weight: .semibold))
                                .foregroundColor(Color("fontGray"))
                        }
                        .frame(
                            width: (UIScreen.main.bounds.width / CGFloat(list.count)),
                            height: 48 - 3
                        )
                        Rectangle()
                            .fill(selectedTab == row ? Color("loading") : Color.clear)
                            .frame(height: 3)
                    }
                    .fixedSize()
                })
            }
        }
        .frame(height: 48)
        .background(Color.white)
        .compositingGroup()
        .shadow(color: .primary.opacity(0.2), radius: 3, x: 4, y: 4)
    }
}

struct ManagerTabView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab: Int = 0
    @State private var canSwipe: Bool = false
//    @ObservedObject var viewModel: RankingViewModel
    @ObservedObject var authManager = AuthManager.shared
//    @ObservedObject var viewModel: QuizBeginnerStoryViewModel
    @ObservedObject var audioManager = AudioManager.shared
    @StateObject var reward = Reward()
    @State private var showAlert: Bool = false
    let list: [String] = ["算数","国語","社会","理科"]
    
    var body: some View {
        NavigationView {
            VStack{
                TopTabView(list: list, selectedTab: $selectedTab)
               
                TabView(selection: $selectedTab,
                                    content: {
                    SansuTabListView(isPresenting: .constant(false))
                                    .tag(0)
                    KokugoListView(isPresenting: .constant(false))
                                    .tag(1)
                    ShakaiListView(isPresenting: .constant(false))
                                    .tag(2)
                    RikaListView(isPresenting: .constant(false))
                                    .tag(3)
                            })
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .overlay(
                ZStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack{
                            Spacer()
                            HStack {
                                Button(action: {
                                generateHapticFeedback()
                                    reward.ExAndMoReward()
                                }, label: {
                                    if reward.rewardLoaded{
                                        Image("倍ボタン")
                                            .resizable()
                                            .frame(width: 110, height: 110)
                                    }else{
                                        Image("倍ボタン白黒")
                                            .resizable()
                                            .frame(width: 110, height: 110)
                                    }
                                })
                                    .shadow(radius: 5)
                                    .disabled(!reward.rewardLoaded)
                                    .onChange(of: reward.rewardEarned) { rewardEarned in
                                        showAlert = rewardEarned
                                        print("onchange reward.rewardEarned:\(showAlert)")
                                    }
                                    .alert(isPresented: $showAlert) {
                                        Alert(
                                            title: Text("報酬獲得！"),
                                            message: Text("1時間だけ獲得した経験値とコインが2倍"),
                                            dismissButton: .default(Text("OK"), action: {
                                                showAlert = false
                                                reward.rewardEarned = false
                                            })
                                        )
                                    }
                                    .padding(.bottom)
//                                    .fullScreenCover(isPresented: $showAnotherView_post, content: {
//                                        RewardRegistrationView()
//                                    })

                                    Spacer()
                            }
                        }
                    }
                }
            )
            .background(Color("Color2"))
        }
        .onAppear{
            reward.LoadReward()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
                                generateHapticFeedback()
            self.presentationMode.wrappedValue.dismiss()
            audioManager.playCancelSound()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.gray)
            Text("戻る")
                .foregroundColor(Color("fontGray"))
        })
    }
}

#Preview {
    ManagerTabView()
}
