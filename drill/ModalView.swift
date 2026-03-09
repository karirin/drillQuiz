//
//  ModalView.swift
//  it
//
//  Created by hashimo ryoya on 2023/10/04.
//

import SwiftUI

struct ModalView: View {
    @Binding var isSoundOn: Bool
    @Binding var isPresented: Bool
    @Binding var isPresenting: Bool
    @ObservedObject var audioManager: AudioManager
    @ObservedObject var authManager = AuthManager.shared
    @Binding var showHomeModal: Bool
    @Binding var tutorialNum: Int
    @State private var isContentView: Bool = false
    @State private var isDaily: Bool = false
    var pauseTimer: () -> Void
    var resumeTimer: () -> Void
    @Binding var userFlag: Int
    @Environment(\.presentationMode) var presentationMode
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            // 背景オーバーレイ
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    closeModal()
                }
            
            // モーダルコンテンツ
            VStack(spacing: 0) {
                // ヘッダー
                HStack {
                    Text("メニュー")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Button(action: closeModal) {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.secondary)
                            .frame(width: 32, height: 32)
                            .background(Color(.systemGray5))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
                .padding(.bottom, 20)
                
                Divider()
                    .padding(.horizontal, 16)
                
                // メニューボタン
                VStack(spacing: 12) {
                    // ホームに戻る
                    MenuButton(
                        icon: "house.fill",
                        title: "ホームに戻る",
                        iconColor: .blue,
                        action: {
                            generateHapticFeedback()
                            isPresenting = false
                            audioManager.playReturnSound()
                        }
                    )
                    
                    // 解説画面表示/非表示
                    MenuButton(
                        icon: isSoundOn ? "eye.slash.fill" : "eye.fill",
                        title: isSoundOn ? "解説画面を非表示" : "解説画面を表示",
                        iconColor: .purple,
                        isToggle: true,
                        isOn: !isSoundOn,
                        action: {
                            generateHapticFeedback()
                            isSoundOn.toggle()
                            audioManager.playSound()
                            if userFlag == 0 {
                                userFlag = 1
                                authManager.updateUserFlag(userId: authManager.currentUserId!, userFlag: 1)
                            } else {
                                userFlag = 0
                                authManager.updateUserFlag(userId: authManager.currentUserId!, userFlag: 0)
                            }
                        }
                    )
                    
                    // ヘルプ
                    MenuButton(
                        icon: "questionmark.circle.fill",
                        title: "ヘルプ",
                        iconColor: .orange,
                        action: {
                            generateHapticFeedback()
                            showHomeModal = false
                            tutorialNum = 3
                            authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 3) { _ in }
                            audioManager.playSound()
                        }
                    )
                }
                .padding(20)
                
                NavigationLink("", destination: TopView(authManager: authManager).navigationBarBackButtonHidden(true), isActive: $isContentView)
            }
            .frame(maxWidth: 320)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 10)
            )
            .scaleEffect(showContent ? 1 : 0.9)
            .opacity(showContent ? 1 : 0)
        }
        .onAppear {
            pauseTimer()
            if userFlag == 0 {
                isSoundOn = true
            } else {
                isSoundOn = false
            }
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                showContent = true
            }
        }
    }
    
    private func closeModal() {
        generateHapticFeedback()
        withAnimation(.spring(response: 0.3)) {
            showContent = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isPresented = false
            resumeTimer()
            audioManager.playCancelSound()
        }
    }
}

// メニューボタンコンポーネント
struct MenuButton: View {
    let icon: String
    let title: String
    let iconColor: Color
    var isToggle: Bool = false
    var isOn: Bool = false
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // アイコン
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(iconColor.opacity(0.15))
                        .frame(width: 44, height: 44)
                    
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(iconColor)
                }
                
                // タイトル
                Text(title)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.primary)
                
                Spacer()
                
                // トグルまたは矢印
                if isToggle {
                    Toggle("", isOn: .constant(isOn))
                        .labelsHidden()
                        .scaleEffect(0.8)
                        .allowsHitTesting(false)
                } else {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(.systemGray3))
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
            )
            .scaleEffect(isPressed ? 0.98 : 1)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPressed = true
                    }
                }
                .onEnded { _ in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
        )
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.3)
            .ignoresSafeArea()
        
        ModalView(
            isSoundOn: .constant(true),
            isPresented: .constant(true),
            isPresenting: .constant(true),
            audioManager: AudioManager.shared,
            showHomeModal: .constant(false),
            tutorialNum: .constant(0),
            pauseTimer: {},
            resumeTimer: {},
            userFlag: .constant(0)
        )
    }
}
