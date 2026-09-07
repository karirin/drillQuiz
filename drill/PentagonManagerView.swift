//
//  PentagonManagerView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

private struct SubjectAccuracyScore: Identifiable {
    let title: String
    let answeredCount: Int
    let correctCount: Int
    let theme: SubjectTheme
    var id: String { title }

    var value: Double {
        answeredCount > 0 ? Double(correctCount) / Double(answeredCount) : 0
    }
}

struct PentagonManagerView: View {
    @ObservedObject var authManager = AuthManager.shared
    @Environment(\.presentationMode) var presentationMode
    @State private var scores: [SubjectAccuracyScore] = PentagonManagerView.placeholderScores
    @State private var isLoading = true

    private var totalAnswered: Int {
        scores.reduce(0) { $0 + $1.answeredCount }
    }

    private var totalCorrect: Int {
        scores.reduce(0) { $0 + $1.correctCount }
    }

    private var overallAccuracy: Double {
        totalAnswered > 0 ? Double(totalCorrect) / Double(totalAnswered) : 0
    }

    var body: some View {
        ZStack {
            AnalysisTheme.backgroundGradient
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    accuracyGraphCard

                    VStack(spacing: 12) {
                        ForEach(scores) { score in
                            categoryLine(score)
                        }
                    }
                    .padding(22)
                    .background(AnalysisTheme.card, in: RoundedRectangle(cornerRadius: 24))
                    .shadow(color: AnalysisTheme.primary.opacity(0.1), radius: 14, x: 0, y: 8)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 100)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            generateHapticFeedback()
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("fontGray"))
            Text("戻る")
                .foregroundColor(Color("fontGray"))
        })
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("正答率")
                    .font(.system(size: 20))
                    .foregroundStyle(AnalysisTheme.ink)
            }
        }
        .background(Color.clear)
        .onAppear {
            fetchAccuracyScores()
        }
    }

    private var accuracyGraphCard: some View {
        VStack(alignment: .leading, spacing: 22) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(AnalysisTheme.primaryGradient.opacity(0.18))
                        .frame(width: 42, height: 42)
                    Image(systemName: "scope")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(AnalysisTheme.primaryGradient)
                }

                VStack(alignment: .leading, spacing: 3) {
                    Text("分野別 正答率")
                        .font(.system(size: 21, weight: .black))
                        .foregroundStyle(AnalysisTheme.ink)
                    Text("得意・苦手を一目で確認")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text("\(totalAnswered)問")
                    .font(.system(size: 13, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 7)
                    .background(AnalysisTheme.primaryGradient, in: Capsule())
            }

            HStack(alignment: .center, spacing: 18) {
                accuracyRing

                VStack(spacing: 10) {
                    ForEach(scores) { score in
                        categoryMiniBar(score)
                    }
                }
            }

            HStack(spacing: 8) {
                ForEach(scores) { score in
                    accuracyDot(score)
                }
            }
        }
        .padding(22)
        .background(AnalysisTheme.card, in: RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(.white.opacity(0.75), lineWidth: 1)
        )
        .shadow(color: AnalysisTheme.primary.opacity(0.12), radius: 18, y: 8)
    }

    private var accuracyRing: some View {
        ZStack {
            Circle()
                .stroke(.gray.opacity(0.14), style: StrokeStyle(lineWidth: 20, lineCap: .round))

            Circle()
                .trim(from: 0, to: CGFloat(overallAccuracy.clamped(to: 0...1)))
                .stroke(
                    AngularGradient(
                        colors: [AnalysisTheme.primary, AnalysisTheme.green, AnalysisTheme.secondary, AnalysisTheme.primary],
                        center: .center
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .shadow(color: AnalysisTheme.primary.opacity(0.28), radius: 8, y: 4)

            Circle()
                .fill(.white)
                .frame(width: 96, height: 96)
                .shadow(color: .black.opacity(0.06), radius: 8, y: 3)

            VStack(spacing: 2) {
                Text("\(Int(overallAccuracy * 100))%")
                    .font(.system(size: 34, weight: .black, design: .rounded))
                    .foregroundStyle(AnalysisTheme.ink)
                    .monospacedDigit()
                Text("総合")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.secondary)
            }
        }
        .frame(width: 150, height: 150)
    }

    private func categoryMiniBar(_ score: SubjectAccuracyScore) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 6) {
                Circle()
                    .fill(score.theme.primaryColor)
                    .frame(width: 7, height: 7)
                Text(score.title)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(AnalysisTheme.ink)
                    .lineLimit(1)
                    .minimumScaleFactor(0.78)
                Spacer(minLength: 4)
                Text(score.answeredCount == 0 ? "-" : "\(Int(score.value * 100))%")
                    .font(.system(size: 12, weight: .black, design: .rounded))
                    .foregroundStyle(score.theme.primaryColor)
                    .monospacedDigit()
            }

            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(score.theme.primaryColor.opacity(0.13))
                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [score.theme.primaryColor.opacity(0.95), score.theme.primaryColor.opacity(0.45)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: proxy.size.width * CGFloat(score.value.clamped(to: 0...1)))
                }
            }
            .frame(height: 8)
        }
        .padding(10)
        .background(score.theme.primaryColor.opacity(0.08), in: RoundedRectangle(cornerRadius: 14))
    }

    private func accuracyDot(_ score: SubjectAccuracyScore) -> some View {
        VStack(spacing: 5) {
            Circle()
                .fill(score.theme.primaryColor)
                .frame(width: 9, height: 9)
            Text("\(Int(score.value * 100))")
                .font(.system(size: 10, weight: .black, design: .rounded))
                .foregroundStyle(score.answeredCount == 0 ? .secondary : score.theme.primaryColor)
                .monospacedDigit()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(.white.opacity(0.78), in: RoundedRectangle(cornerRadius: 12))
    }

    private func categoryLine(_ score: SubjectAccuracyScore) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(score.title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(AnalysisTheme.ink)
                Spacer()
                Text(score.answeredCount == 0 ? "未学習" : "\(Int(score.value * 100))%")
                    .font(.caption.monospacedDigit().bold())
                    .foregroundStyle(score.theme.primaryColor)
            }
            ProgressView(value: score.value)
                .tint(score.theme.primaryColor)
        }
    }

    private static let placeholderScores: [SubjectAccuracyScore] = [
        SubjectAccuracyScore(title: "算数", answeredCount: 0, correctCount: 0, theme: .sansu),
        SubjectAccuracyScore(title: "国語", answeredCount: 0, correctCount: 0, theme: .kokugo),
        SubjectAccuracyScore(title: "社会", answeredCount: 0, correctCount: 0, theme: .shakai),
        SubjectAccuracyScore(title: "理科", answeredCount: 0, correctCount: 0, theme: .rika)
    ]

    private func fetchAccuracyScores() {
        guard let userId = authManager.currentUserId else { return }
        isLoading = true

        let group = DispatchGroup()
        var sansuTotals = (answer: 0, correct: 0)
        var kokugoTotals = (answer: 0, correct: 0)
        var shakaiTotals = (answer: 0, correct: 0)
        var rikaTotals = (answer: 0, correct: 0)

        group.enter()
        RateManager.shared.fetchSansuQuizData(userId: userId) { data in
            sansuTotals = data.values.reduce((0, 0)) { ($0.0 + $1.answer, $0.1 + $1.correct) }
            group.leave()
        }
        group.enter()
        RateManager.shared.fetchKokugoQuizData(userId: userId) { data in
            kokugoTotals = data.values.reduce((0, 0)) { ($0.0 + $1.answer, $0.1 + $1.correct) }
            group.leave()
        }
        group.enter()
        RateManager.shared.fetchShakaiQuizData(userId: userId) { data in
            shakaiTotals = data.values.reduce((0, 0)) { ($0.0 + $1.answer, $0.1 + $1.correct) }
            group.leave()
        }
        group.enter()
        RateManager.shared.fetchRikaQuizData(userId: userId) { data in
            rikaTotals = data.values.reduce((0, 0)) { ($0.0 + $1.answer, $0.1 + $1.correct) }
            group.leave()
        }

        group.notify(queue: .main) {
            self.scores = [
                SubjectAccuracyScore(title: "算数", answeredCount: sansuTotals.answer, correctCount: sansuTotals.correct, theme: .sansu),
                SubjectAccuracyScore(title: "国語", answeredCount: kokugoTotals.answer, correctCount: kokugoTotals.correct, theme: .kokugo),
                SubjectAccuracyScore(title: "社会", answeredCount: shakaiTotals.answer, correctCount: shakaiTotals.correct, theme: .shakai),
                SubjectAccuracyScore(title: "理科", answeredCount: rikaTotals.answer, correctCount: rikaTotals.correct, theme: .rika)
            ]
            self.isLoading = false
        }
    }
}

private extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        min(max(self, limits.lowerBound), limits.upperBound)
    }
}

#Preview {
    PentagonManagerView()
}
