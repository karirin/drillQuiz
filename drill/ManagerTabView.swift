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
    let list: [String] = ["算数","国語","社会","理科"]
    
    var body: some View {
        NavigationView {
            VStack{
                TopTabView(list: list, selectedTab: $selectedTab)
               
                TabView(selection: $selectedTab,
                                    content: {
                    SansuListView(isPresenting: .constant(false))
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
            .background(Color("Color2"))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            audioManager.playCancelSound()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.gray)
            Text("戻る")
                .foregroundColor(Color("fontGray"))
        })
//        .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("ランキング")
//                        .font(.system(size: 20)) // ここでフォントサイズを指定
//                        .foregroundColor(Color("fontGray"))
//                }
//            }
    }
}

#Preview {
    ManagerTabView()
}
