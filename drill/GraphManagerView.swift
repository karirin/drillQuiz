//
//  GraphManagerView.swift
//  moneyQuiz
//
//  Created by hashimo ryoya on 2023/12/29.
//

import SwiftUI
import AVFoundation

struct GraphManagerView: View {
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
    @State private var isSoundOn: Bool = true
    @ObservedObject var audioManager = AudioManager.shared
    @Environment(\.presentationMode) var presentationMode
    @State private var tutorialNum: Int = 0
    @State private var buttonRect: CGRect = .zero
    @State private var bubbleHeight: CGFloat = 0.0
    let sampleData = createSampleData()
    let list: [String] = ["回答数(月間)","正答率"]
    @State private var selectedTab: Int = 0
    @State private var preFlag: Bool = false
    @ObservedObject private var appState = AppState.shared

    private var hasGraphPremiumAccess: Bool {
        appState.isSubscribed
    }

    var body: some View {
        ZStack{
            AnalysisTheme.backgroundGradient
                .ignoresSafeArea()
            if hasGraphPremiumAccess {
                analyticsContent
            } else {
                lockedContent
            }
        }
        .fullScreenCover(isPresented: $preFlag) {
                PreView(audioManager: audioManager, source: .graph)
            }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .navigationTitle("分析")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
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
    }

    private var analyticsContent: some View {
        VStack(spacing: 0) {
            AnalysisTopTabView(list: list, selectedTab: $selectedTab)
                .padding(.top, 8)
            TabView(selection: $selectedTab) {
                BarChartView(authManager: authManager, data: sampleData)
                    .navigationViewStyle(StackNavigationViewStyle())
                    .tag(0)

                PentagonManagerView()
                    .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }

    private var lockedContent: some View {
        ZStack {
            AnalysisTheme.backgroundGradient
                .ignoresSafeArea()

            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(AnalysisTheme.primaryGradient)
                        .frame(width: 74, height: 74)
                    Image(systemName: "lock.fill")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(.white)
                }

                Text("分析機能")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(AnalysisTheme.ink)

                Text("プレミアムプランに登録すると\n毎日の回答数や問題の正答率をグラフで確認できます")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(24)
            .frame(maxWidth: 340)
            .background(AnalysisTheme.card, in: RoundedRectangle(cornerRadius: 24))
            .shadow(color: AnalysisTheme.primary.opacity(0.14), radius: 18, x: 0, y: 10)
            .onTapGesture {
                preFlag = true
            }
        }
    }
    static func createSampleData() -> [DailyData] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return [
            DailyData(date: dateFormatter.date(from: "2023-12-01")!, count: 10),
            DailyData(date: dateFormatter.date(from: "2023-12-02")!, count: 15),
            DailyData(date: dateFormatter.date(from: "2023-12-03")!, count: 20)
        ]
    }
}

enum AnalysisTheme {
    static let primary = Color(hex: "667eea")
    static let secondary = Color(hex: "764ba2")
    static let green = Color(hex: "11998e")
    static let ink = Color(hex: "303443")
    static let card = Color.white.opacity(0.94)

    static let primaryGradient = LinearGradient(
        colors: [primary, secondary],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let backgroundGradient = LinearGradient(
        colors: [
            Color(red: 0.95, green: 0.97, blue: 1.0),
            Color(red: 0.98, green: 0.95, blue: 1.0)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct AnalysisTopTabView: View {
    let list: [String]
    @Binding var selectedTab: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(list.indices, id: \.self) { index in
                Button {
                    generateHapticFeedback()
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = index
                    }
                } label: {
                    VStack(spacing: 6) {
                        Text(list[index])
                            .font(.system(size: 14, weight: selectedTab == index ? .bold : .medium))
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                        RoundedRectangle(cornerRadius: 2)
                            .fill(selectedTab == index ? AnalysisTheme.primary : .clear)
                            .frame(height: 3)
                    }
                    .foregroundStyle(selectedTab == index ? AnalysisTheme.ink : .secondary)
                    .padding(.vertical, 10)
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal, 16)
    }
}

struct GraphManagerView_Previews: PreviewProvider {
    static var previews: some View {
        GraphManagerView()
    }
}
