//
//  ModalReturnView.swift
//  moneyQuiz
//
//  Created by hashimo ryoya on 2023/12/18.
//

import SwiftUI

struct ModalReturnView: View {
    @Binding var isPresented: Bool
    @State private var isContentView: Bool = false
    @State private var isDaily: Bool = false
    var pauseTimer: () -> Void
    var startTimer: () -> Void
    @State private var isButtonActive = true
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            // 背景オーバーレイ
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    // 背景タップで閉じる
                    withAnimation(.spring(response: 0.3)) {
                        isPresented = false
                        startTimer()
                    }
                }
            
            // モーダルコンテンツ
            VStack(spacing: 24) {
                // アイコン
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.orange.opacity(0.2), Color.red.opacity(0.2)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 72, height: 72)
                    
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 32))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.orange, .red],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                }
                .scaleEffect(showContent ? 1 : 0.5)
                .opacity(showContent ? 1 : 0)
                
                // テキスト
                VStack(spacing: 8) {
                    Text("エラーが発生しました")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Text("申し訳ありません。回答結果を取得できませんでした。")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                }
                .opacity(showContent ? 1 : 0)
                .offset(y: showContent ? 0 : 10)
                
                // ボタン
                Button(action: {
                    generateHapticFeedback()
                    if isButtonActive {
                        withAnimation(.spring(response: 0.3)) {
                            isPresented = false
                            startTimer()
                        }
                    }
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 14, weight: .semibold))
                        Text("戻る")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(
                            colors: [Color.blue, Color.blue.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(14)
                    .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                .disabled(!isButtonActive)
                .opacity(isButtonActive ? 1 : 0.6)
                .opacity(showContent ? 1 : 0)
                .offset(y: showContent ? 0 : 20)
            }
            .padding(28)
            .frame(maxWidth: 320)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(.ultraThinMaterial)
                    .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 10)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
            .scaleEffect(showContent ? 1 : 0.9)
            .opacity(showContent ? 1 : 0)
        }
        .onAppear {
            pauseTimer()
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                showContent = true
            }
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.3)
            .ignoresSafeArea()
        
        ModalReturnView(
            isPresented: .constant(true),
            pauseTimer: {},
            startTimer: {}
        )
    }
}
