import SwiftUI
import StoreKit
import FirebaseAnalytics

enum PremiumPaywallSource: String {
    case general
    case homeAutomatic = "home_automatic"
    case quizResultAutomatic = "quiz_result_automatic"
    case quizResultButton = "quiz_result_button"
    case storyResultAutomatic = "story_result_automatic"
    case storyResultButton = "story_result_button"
    case review
    case graph
    case settings
    case friendLimit = "friend_limit"

    var headline: String {
        switch self {
        case .review:
            return "まちがえた問題を、すぐ得意に"
        case .graph:
            return "がんばりをグラフで見える化"
        case .friendLimit:
            return "フレンド枠を30人まで拡大"
        case .quizResultAutomatic, .quizResultButton, .storyResultAutomatic, .storyResultButton:
            return "広告なしで次の問題へ"
        case .settings:
            return "広告をなくして学習に集中"
        case .homeAutomatic, .general:
            return "毎日の学習をもっと快適に"
        }
    }

    var message: String {
        switch self {
        case .review:
            return "間違えた問題だけを何度でも解き直せます。"
        case .graph:
            return "毎日の回答数と正答率から、成長を確認できます。"
        case .friendLimit:
            return "通常10人のフレンド上限が30人になります。"
        case .quizResultAutomatic, .quizResultButton, .storyResultAutomatic, .storyResultButton:
            return "結果画面やホームの広告を非表示にして、学習を続けられます。"
        case .settings:
            return "ホーム画面やクイズ後の広告が表示されなくなります。"
        case .homeAutomatic, .general:
            return "広告非表示・復習・分析など、学習を支える機能をまとめて使えます。"
        }
    }

    /// 見出しの上に出す小さなラベル。流入元ごとに「今まさに欲しい価値」を言い切る。
    var eyebrow: String {
        switch self {
        case .review:
            return "復習機能がすぐ使えます"
        case .graph:
            return "グラフ機能がすぐ使えます"
        case .friendLimit:
            return "フレンド枠がすぐ広がります"
        case .quizResultAutomatic, .quizResultButton, .storyResultAutomatic, .storyResultButton:
            return "この広告、今日からゼロに"
        case .settings, .homeAutomatic, .general:
            return "プレミアムプラン"
        }
    }
}

// MARK: - Premium Palette

enum PremiumPalette {
    static let backdropTop = Color(hex: "0B1026")
    static let backdropMid = Color(hex: "16214B")
    static let backdropBottom = Color(hex: "2A1B4A")

    static let cardFill = Color.white.opacity(0.07)
    static let cardFillStrong = Color.white.opacity(0.11)
    static let cardStroke = Color.white.opacity(0.14)

    static let ink = Color(hex: "2D1F14")
    static let gold = Color(hex: "FFCF5C")

    static let goldGradient = LinearGradient(
        colors: [Color(hex: "FFE9A8"), Color(hex: "FFC83D"), Color(hex: "F59A1E")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let goldTextGradient = LinearGradient(
        colors: [Color(hex: "FFE9A8"), Color(hex: "FFC83D")],
        startPoint: .top,
        endPoint: .bottom
    )
}

// MARK: - Backdrop

struct PremiumBackdrop: View {
    var animate: Bool

    var body: some View {
        LinearGradient(
            colors: [
                PremiumPalette.backdropTop,
                PremiumPalette.backdropMid,
                PremiumPalette.backdropBottom
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .overlay(alignment: .top) {
            glow(colors: [Color(hex: "FFC83D").opacity(0.30), .clear])
                .offset(x: -110, y: animate ? -160 : -130)
        }
        .overlay(alignment: .bottom) {
            glow(colors: [Color(hex: "6C5CE7").opacity(0.34), .clear])
                .offset(x: 120, y: animate ? 140 : 110)
        }
        .clipped()
        .ignoresSafeArea()
    }

    private func glow(colors: [Color]) -> some View {
        Circle()
            .fill(
                RadialGradient(
                    colors: colors,
                    center: .center,
                    startRadius: 0,
                    endRadius: 210
                )
            )
            .frame(width: 420, height: 420)
            .allowsHitTesting(false)
    }
}

// MARK: - Feature

struct Feature: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let color: Color
}

// MARK: - Benefit Row

struct PremiumBenefitRow: View {
    let feature: Feature
    let isHighlighted: Bool

    var body: some View {
        HStack(spacing: 13) {
            ZStack {
                RoundedRectangle(cornerRadius: 13, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [feature.color.opacity(0.95), feature.color.opacity(0.55)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 42, height: 42)

                Image(systemName: feature.imageName)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Text(feature.title)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)

                    if isHighlighted {
                        Text("今すぐ解放")
                            .font(.system(size: 9, weight: .black))
                            .foregroundColor(PremiumPalette.ink)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Capsule().fill(PremiumPalette.goldGradient))
                    }
                }

                Text(feature.description)
                    .font(.system(size: 11.5))
                    .foregroundColor(.white.opacity(0.68))
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 17))
                .foregroundStyle(PremiumPalette.goldTextGradient)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 11)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(isHighlighted ? PremiumPalette.cardFillStrong : PremiumPalette.cardFill)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(
                    isHighlighted ? PremiumPalette.gold.opacity(0.55) : PremiumPalette.cardStroke,
                    lineWidth: isHighlighted ? 1.5 : 1
                )
        )
    }
}

// MARK: - Comparison Table

struct PremiumComparisonTable: View {
    private let rows: [(title: String, free: String, premium: String)] = [
        ("広告", "表示あり", "すべて非表示"),
        ("復習機能", "使えない", "使い放題"),
        ("成績グラフ", "使えない", "毎日見られる"),
        ("フレンド上限", "10人", "30人")
    ]

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("")
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("無料")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white.opacity(0.5))
                    .frame(width: 84)

                HStack(spacing: 3) {
                    Image(systemName: "crown.fill")
                        .font(.system(size: 10))
                    Text("プレミアム")
                        .font(.system(size: 12, weight: .black))
                }
                .foregroundStyle(PremiumPalette.goldTextGradient)
                .frame(width: 100)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)

            ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                HStack(spacing: 0) {
                    Text(row.title)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white.opacity(0.9))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text(row.free)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.42))
                        .frame(width: 84)

                    HStack(spacing: 4) {
                        Image(systemName: "checkmark")
                            .font(.system(size: 10, weight: .black))
                        Text(row.premium)
                            .font(.system(size: 12, weight: .bold))
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                    }
                    .foregroundColor(PremiumPalette.gold)
                    .frame(width: 100)
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 11)
                .background(index % 2 == 0 ? Color.white.opacity(0.05) : Color.clear)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(PremiumPalette.cardFill)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(PremiumPalette.cardStroke, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

// MARK: - Plan Display Model

struct PremiumPlanDisplay: Identifiable {
    let id: String
    let title: String
    let priceText: String
    let periodSuffix: String
    let detail: String
    let badgeText: String?
    let badgeColors: [Color]
    let isRecommended: Bool
    let trialText: String?
}

// MARK: - Plan Selection Card

struct PlanSelectionCard: View {
    let plan: PremiumPlanDisplay
    let isSelected: Bool
    let onSelect: () -> Void

    var body: some View {
        Button(action: {
            generateHapticFeedback()
            onSelect()
        }) {
            HStack(spacing: 13) {
                ZStack {
                    Circle()
                        .stroke(
                            isSelected ? PremiumPalette.gold : Color.white.opacity(0.32),
                            lineWidth: isSelected ? 2.5 : 1.5
                        )
                        .frame(width: 24, height: 24)

                    if isSelected {
                        Circle()
                            .fill(PremiumPalette.goldGradient)
                            .frame(width: 14, height: 14)
                    }
                }

                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text(plan.title)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)

                        if let badge = plan.badgeText {
                            Text(badge)
                                .font(.system(size: 10, weight: .black))
                                .foregroundColor(.white)
                                .padding(.horizontal, 7)
                                .padding(.vertical, 3)
                                .background(
                                    Capsule().fill(
                                        LinearGradient(
                                            colors: plan.badgeColors,
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                )
                        }
                    }

                    Text(plan.detail)
                        .font(.system(size: 11.5))
                        .foregroundColor(.white.opacity(0.66))
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    if let trial = plan.trialText {
                        Text(trial)
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(Color(hex: "6BE39A"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .layoutPriority(1)

                VStack(alignment: .trailing, spacing: 0) {
                    Text(plan.priceText)
                        .font(.system(size: 23, weight: .black))
                        .foregroundColor(.white)

                    Text(plan.periodSuffix)
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.55))
                }
                .fixedSize(horizontal: true, vertical: false)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(isSelected ? Color.white.opacity(0.13) : Color.black.opacity(0.22))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(
                        isSelected
                            ? LinearGradient(
                                colors: [Color(hex: "FFE9A8"), Color(hex: "FFC83D")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            : LinearGradient(
                                colors: [Color.white.opacity(0.16), Color.white.opacity(0.10)],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                        lineWidth: isSelected ? 2 : 1
                    )
            )
            .shadow(color: isSelected ? Color(hex: "FFC83D").opacity(0.28) : .clear, radius: 10, x: 0, y: 4)
            .overlay(alignment: .topTrailing) {
                if plan.isRecommended {
                    Text("おすすめ")
                        .font(.system(size: 10, weight: .black))
                        .foregroundColor(PremiumPalette.ink)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 3)
                        .background(Capsule().fill(PremiumPalette.goldGradient))
                        .offset(x: -12, y: -9)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Trust Chip

struct PremiumTrustChip: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
                .font(.system(size: 10, weight: .bold))
            Text(text)
                .font(.system(size: 11, weight: .bold))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .foregroundColor(.white.opacity(0.82))
        .padding(.horizontal, 10)
        .padding(.vertical, 7)
        .background(Capsule().fill(Color.white.opacity(0.09)))
        .overlay(Capsule().stroke(Color.white.opacity(0.14), lineWidth: 1))
    }
}

// MARK: - FAQ

struct PremiumFAQRow: View {
    let question: String
    let answer: String
    @State private var isOpen = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: {
                generateHapticFeedback()
                withAnimation(.easeInOut(duration: 0.2)) {
                    isOpen.toggle()
                }
            }) {
                HStack(spacing: 8) {
                    Text(question)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white.opacity(0.92))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Image(systemName: "chevron.down")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(.white.opacity(0.5))
                        .rotationEffect(.degrees(isOpen ? 180 : 0))
                }
                .padding(.horizontal, 13)
                .padding(.vertical, 14)
                .contentShape(Rectangle())
            }
            .buttonStyle(PlainButtonStyle())

            if isOpen {
                Text(answer)
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.7))
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 13)
                    .padding(.bottom, 14)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(PremiumPalette.cardFill)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(PremiumPalette.cardStroke, lineWidth: 1)
        )
    }
}

// MARK: - Section Header

struct PremiumSectionHeader: View {
    let icon: String
    let title: String

    var body: some View {
        HStack(spacing: 7) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(PremiumPalette.goldTextGradient)

            Text(title)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)

            Spacer(minLength: 0)
        }
    }
}

// MARK: - Period Helpers

/// 購読期間を「週/月/年」に正規化する。
/// App Store Connect で「7日間」のように日数で登録されていても週額として扱い、
/// 購読情報が取得できない場合は商品IDから推定して表示が崩れないようにする。
func premiumNormalizedPeriod(for product: Product) -> (unit: Product.SubscriptionPeriod.Unit, value: Int)? {
    if let period = product.subscription?.subscriptionPeriod {
        switch (period.unit, period.value) {
        case (.day, 7):
            return (.week, 1)
        case (.day, 30), (.day, 31):
            return (.month, 1)
        case (.day, 365), (.day, 366):
            return (.year, 1)
        default:
            return (period.unit, max(period.value, 1))
        }
    }

    let id = product.id.lowercased()
    if id.contains("week") { return (.week, 1) }
    if id.contains("month") { return (.month, 1) }
    if id.contains("year") || id.contains("annual") { return (.year, 1) }
    return nil
}

func premiumPeriodUnit(for product: Product) -> Product.SubscriptionPeriod.Unit? {
    premiumNormalizedPeriod(for: product)?.unit
}

func premiumPeriodValue(for product: Product) -> Int {
    premiumNormalizedPeriod(for: product)?.value ?? 1
}

// MARK: - Legal Sheet

enum PremiumLegalSheet: String, Identifiable {
    case terms
    case privacy
    case cancelGuide

    var id: String { rawValue }
}

// MARK: - Main PreView

struct PreView: View {
    @State private var selectedProduct: Product? = nil
    @StateObject private var viewModel = SubscriptionViewModel()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var audioManager: AudioManager
    let source: PremiumPaywallSource
    @State private var animateGlow = false
    @State private var shineOffset: CGFloat = -180
    @State private var hasLoggedPaywallView = false
    @State private var activeLegalSheet: PremiumLegalSheet?

    let features: [Feature] = [
        Feature(
            imageName: "rectangle.badge.xmark",
            title: "広告非表示",
            description: "ホーム画面やダンジョン後の広告が非表示に",
            color: Color(hex: "FF5E62")
        ),
        Feature(
            imageName: "arrow.counterclockwise.circle.fill",
            title: "復習機能",
            description: "間違えた問題をもう一度解き直し",
            color: Color(hex: "A56BFF")
        ),
        Feature(
            imageName: "chart.bar.fill",
            title: "グラフ機能",
            description: "毎日の回答数や正答率をグラフで確認",
            color: Color(hex: "3D9BFF")
        ),
        Feature(
            imageName: "person.2.fill",
            title: "フレンド30人",
            description: "フレンド上限が10人から30人に",
            color: Color(hex: "2FC28A")
        )
    ]

    init(audioManager: AudioManager, source: PremiumPaywallSource = .general) {
        self.audioManager = audioManager
        self.source = source
    }

    var body: some View {
        ZStack {
            PremiumBackdrop(animate: animateGlow)

            VStack(spacing: 0) {
                topBar

                ZStack(alignment: .bottom) {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 18) {
                            heroSection
                            headlineSection
                            trustChips
                            benefitSection
                            comparisonSection
                            planSection
                            faqSection
                            legalFooter
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                        .padding(.bottom, 172)
                    }

                    purchaseBar
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .sheet(item: $activeLegalSheet) { sheet in
            legalSheetView(sheet)
        }
        .alert(item: $viewModel.notice) { notice in
            Alert(
                title: Text(notice.title),
                message: Text(notice.message),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear {
            if !hasLoggedPaywallView {
                hasLoggedPaywallView = true
                Analytics.logEvent(
                    "premium_paywall_view",
                    parameters: ["source": source.rawValue]
                )
            }
            withAnimation(.easeInOut(duration: 2.4).repeatForever(autoreverses: true)) {
                animateGlow = true
            }
            withAnimation(.linear(duration: 2.6).repeatForever(autoreverses: false)) {
                shineOffset = 220
            }

            loadProducts()
        }
    }

    // MARK: Sections

    private var topBar: some View {
        HStack {
            Button(action: {
                generateHapticFeedback()
                Analytics.logEvent(
                    "premium_paywall_close",
                    parameters: ["source": source.rawValue]
                )
                presentationMode.wrappedValue.dismiss()
                audioManager.playCancelSound()
            }) {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 13, weight: .bold))
                    Text("戻る")
                        .font(.system(size: 14, weight: .bold))
                }
                .foregroundColor(.white.opacity(0.92))
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(Capsule().fill(Color.white.opacity(0.12)))
                .overlay(Capsule().stroke(Color.white.opacity(0.18), lineWidth: 1))
            }
            .buttonStyle(PlainButtonStyle())

            Spacer()

            Button(action: restorePurchases) {
                Text("購入を復元")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal, 14)
        .padding(.top, 4)
        .padding(.bottom, 8)
        .background(
            LinearGradient(
                colors: [
                    PremiumPalette.backdropTop,
                    PremiumPalette.backdropTop.opacity(0.92),
                    PremiumPalette.backdropTop.opacity(0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(edges: .top)
        )
        .zIndex(1)
    }

    private var heroSection: some View {
        Image("PremiumHeroBanner")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(PremiumPalette.gold.opacity(0.45), lineWidth: 1.5)
            )
            .shadow(color: Color(hex: "FFC83D").opacity(0.25), radius: 16, x: 0, y: 6)
    }

    private var headlineSection: some View {
        VStack(spacing: 8) {
            HStack(spacing: 5) {
                Image(systemName: "crown.fill")
                    .font(.system(size: 10))
                Text(source.eyebrow)
                    .font(.system(size: 11, weight: .black))
            }
            .foregroundColor(PremiumPalette.ink)
            .padding(.horizontal, 11)
            .padding(.vertical, 5)
            .background(Capsule().fill(PremiumPalette.goldGradient))

            Text(source.headline)
                .font(.system(size: 23, weight: .black))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)

            Text(source.message)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white.opacity(0.76))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 6)
    }

    private var trustChips: some View {
        HStack(spacing: 8) {
            PremiumTrustChip(icon: "checkmark.shield.fill", text: "いつでも解約OK")
            PremiumTrustChip(icon: "applelogo", text: "App Store決済")
            PremiumTrustChip(icon: "bolt.fill", text: "登録後すぐ反映")
        }
    }

    private var benefitSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            PremiumSectionHeader(icon: "crown.fill", title: "プレミアム特典")

            ForEach(features) { feature in
                PremiumBenefitRow(
                    feature: feature,
                    isHighlighted: isHighlightedFeature(feature)
                )
            }
        }
    }

    private var comparisonSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            PremiumSectionHeader(icon: "arrow.left.arrow.right", title: "無料プランとのちがい")
            PremiumComparisonTable()
        }
    }

    private var planSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            PremiumSectionHeader(icon: "tag.fill", title: "プランを選択")

            if viewModel.isLoadingProducts && viewModel.products.isEmpty {
                HStack(spacing: 8) {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    Text("読み込み中...")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.7))
                    Spacer()
                }
                .padding(.vertical, 30)
            } else if !viewModel.products.isEmpty {
                VStack(spacing: 10) {
                    ForEach(sortedProducts(), id: \.id) { product in
                        PlanSelectionCard(
                            plan: planDisplay(for: product),
                            isSelected: selectedProduct?.id == product.id
                        ) {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                selectedProduct = product
                            }
                            logEvent("premium_plan_select", product: product)
                        }
                    }
                }
            } else {
                VStack(spacing: 12) {
                    Text(viewModel.productLoadErrorMessage ?? "商品情報を取得できませんでした。")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white.opacity(0.78))
                        .multilineTextAlignment(.center)

                    Button("再読み込み") {
                        loadProducts()
                    }
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(PremiumPalette.ink)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 10)
                    .background(Capsule().fill(Color.white.opacity(0.92)))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
            }
        }
    }

    private var faqSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            PremiumSectionHeader(icon: "questionmark.circle.fill", title: "よくある質問")

            PremiumFAQRow(
                question: "解約はいつでもできますか？",
                answer: "はい。App Storeの「サブスクリプション」からいつでも解約できます。解約しても、支払い済みの期間が終わるまではプレミアム機能をそのまま使えます。"
            )

            PremiumFAQRow(
                question: "料金はどのように請求されますか？",
                answer: "Apple IDに登録されたお支払い方法から請求されます。期間終了の24時間前までに解約しない場合は、同じ期間で自動更新されます。"
            )

            PremiumFAQRow(
                question: "機種変更しても引き継げますか？",
                answer: "同じApple IDでサインインし、画面右上の「購入を復元」を押すと引き継げます。"
            )
        }
    }

    private var legalFooter: some View {
        VStack(spacing: 10) {
            HStack(spacing: 4) {
                Text("購入復元は")
                    .foregroundColor(.white.opacity(0.6))
                Button("こちら") {
                    restorePurchases()
                }
                .foregroundColor(.cyan)
                Text("・解約は")
                    .foregroundColor(.white.opacity(0.6))
                Button("こちら") {
                    activeLegalSheet = .cancelGuide
                }
                .foregroundColor(.cyan)
            }
            .font(.system(size: 12))

            HStack(spacing: 14) {
                Button("利用規約") {
                    activeLegalSheet = .terms
                }
                .foregroundColor(.white.opacity(0.55))

                Text("・")
                    .foregroundColor(.white.opacity(0.35))

                Button("プライバシーポリシー") {
                    activeLegalSheet = .privacy
                }
                .foregroundColor(.white.opacity(0.55))
            }
            .font(.system(size: 11))

            Text("登録期間終了の24時間前までに解約しない場合、同じ料金で自動更新されます。")
                .font(.system(size: 10))
                .foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, 4)
    }

    @ViewBuilder
    private func legalSheetView(_ sheet: PremiumLegalSheet) -> some View {
        NavigationView {
            Group {
                switch sheet {
                case .terms:
                    TermsOfServiceView()
                case .privacy:
                    PrivacyView()
                case .cancelGuide:
                    WebView(urlString: "https://support.apple.com/ja-jp/HT202039")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("閉じる") {
                        activeLegalSheet = nil
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    // MARK: Sticky purchase bar

    private var purchaseBar: some View {
        VStack(spacing: 8) {
            if let summary = selectedPlanSummary {
                Text(summary)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white.opacity(0.82))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }

            Button(action: purchaseSelectedProduct) {
                HStack(spacing: 8) {
                    Image(systemName: "crown.fill")
                        .font(.system(size: 17))

                    Text(viewModel.isProcessing ? "処理中…" : ctaTitle)
                        .font(.system(size: 17, weight: .black))
                }
                .foregroundColor(PremiumPalette.ink)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(PremiumPalette.goldGradient)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [.clear, Color.white.opacity(0.5), .clear],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 46)
                        .blur(radius: 6)
                        .rotationEffect(.degrees(18))
                        .offset(x: shineOffset)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .allowsHitTesting(false)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.white.opacity(0.45), lineWidth: 1)
                )
                .shadow(color: Color(hex: "FFB020").opacity(animateGlow ? 0.55 : 0.28), radius: animateGlow ? 16 : 8, x: 0, y: 5)
            }
            .buttonStyle(PlainButtonStyle())
            .disabled(selectedProduct == nil || viewModel.isProcessing)
            .opacity(selectedProduct == nil ? 0.55 : 1)

            Text(purchaseDisclosureText)
                .font(.system(size: 10.5))
                .foregroundColor(.white.opacity(0.55))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
        .padding(.bottom, 14)
        .background(
            VStack(spacing: 0) {
                LinearGradient(
                    colors: [
                        PremiumPalette.backdropTop.opacity(0),
                        PremiumPalette.backdropTop
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 28)

                PremiumPalette.backdropTop
            }
            .padding(.top, -28)
            .ignoresSafeArea(edges: .bottom)
        )
    }

    private var ctaTitle: String {
        guard let product = selectedProduct else { return "プランを選択してください" }
        if trialText(for: product) != nil {
            return "無料でプレミアムを始める"
        }
        return "プレミアムプランを始める"
    }

    private var selectedPlanSummary: String? {
        guard let product = selectedProduct else { return nil }
        let title = planTitle(for: product)

        if let trial = trialText(for: product) {
            return "\(title)・\(trial)"
        }

        if let daily = dailyEquivalentText(for: product) {
            return "\(title) \(product.displayPrice)\(periodSuffix(for: product))・1日あたり約\(daily)"
        }

        return "\(title) \(product.displayPrice)\(periodSuffix(for: product))"
    }

    private var purchaseDisclosureText: String {
        guard let product = selectedProduct,
              trialText(for: product) != nil else {
            return "いつでも解約できます・自動更新"
        }

        return viewModel.renewalText(for: product)
    }

    // MARK: Plan helpers

    private func isHighlightedFeature(_ feature: Feature) -> Bool {
        switch source {
        case .review:
            return feature.title == "復習機能"
        case .graph:
            return feature.title == "グラフ機能"
        case .friendLimit:
            return feature.title == "フレンド30人"
        case .settings, .homeAutomatic, .quizResultAutomatic, .quizResultButton,
             .storyResultAutomatic, .storyResultButton:
            return feature.title == "広告非表示"
        case .general:
            return false
        }
    }

    private func planTitle(for product: Product) -> String {
        switch premiumPeriodUnit(for: product) {
        case .week: return "週間プラン"
        case .month: return "月額プラン"
        case .year: return "年額プラン"
        default: return product.displayName
        }
    }

    private func periodSuffix(for product: Product) -> String {
        switch premiumPeriodUnit(for: product) {
        case .week: return "/週"
        case .month: return "/月"
        case .year: return "/年"
        default: return ""
        }
    }

    /// 1か月あたりの実質金額（プラン比較の共通ものさし）
    private func monthlyEquivalent(for product: Product) -> Double? {
        guard let unit = premiumPeriodUnit(for: product) else { return nil }
        let price = NSDecimalNumber(decimal: product.price).doubleValue
        let count = Double(premiumPeriodValue(for: product))

        switch unit {
        case .day: return price * 30.0 / count
        case .week: return price * 52.0 / 12.0 / count
        case .month: return price / count
        case .year: return price / (12.0 * count)
        default: return nil
        }
    }

    private func currencyText(_ amount: Double, like product: Product) -> String {
        Decimal(amount).formatted(product.priceFormatStyle)
    }

    private func dailyEquivalentText(for product: Product) -> String? {
        guard let monthly = monthlyEquivalent(for: product) else { return nil }
        return currencyText(monthly * 12.0 / 365.0, like: product)
    }

    private func discountPercent(for product: Product, comparedTo base: Product?) -> Int? {
        guard let base,
              let target = monthlyEquivalent(for: product),
              let baseline = monthlyEquivalent(for: base),
              baseline > 0,
              target < baseline else { return nil }

        let percent = Int(((baseline - target) / baseline * 100).rounded())
        return percent > 0 ? percent : nil
    }

    private func productMatching(_ unit: Product.SubscriptionPeriod.Unit) -> Product? {
        viewModel.products.first { premiumPeriodUnit(for: $0) == unit }
    }

    private func trialText(for product: Product) -> String? {
        viewModel.freeTrialText(for: product)
    }

    private func planDisplay(for product: Product) -> PremiumPlanDisplay {
        let unit = premiumPeriodUnit(for: product)
        let weekly = productMatching(.week)
        let monthly = productMatching(.month)

        var detail = "プレミアム機能がすべて使えます"
        var badge: String? = nil
        var badgeColors: [Color] = [Color(hex: "5B7CFA"), Color(hex: "8E5BFA")]
        var isRecommended = false

        switch unit {
        case .week:
            detail = "まずは1週間おためし"
        case .month:
            if let percent = discountPercent(for: product, comparedTo: weekly) {
                detail = "週間プランより約\(percent)%お得"
            } else {
                detail = "毎月自動更新でずっと快適"
            }
            badge = "人気"
            isRecommended = true
        case .year:
            if let monthlyEq = monthlyEquivalent(for: product) {
                detail = "月あたり約\(currencyText(monthlyEq, like: product))"
            }
            if let percent = discountPercent(for: product, comparedTo: monthly) {
                badge = "\(percent)%お得"
                badgeColors = [Color(hex: "FF8A3D"), Color(hex: "FF4D6D")]
            } else {
                badge = "最もお得"
                badgeColors = [Color(hex: "FF8A3D"), Color(hex: "FF4D6D")]
            }
        default:
            break
        }

        return PremiumPlanDisplay(
            id: product.id,
            title: planTitle(for: product),
            priceText: product.displayPrice,
            periodSuffix: periodSuffix(for: product),
            detail: detail,
            badgeText: badge,
            badgeColors: badgeColors,
            isRecommended: isRecommended,
            trialText: trialText(for: product)
        )
    }

    private func sortedProducts() -> [Product] {
        viewModel.products.sorted { product1, product2 in
            let order: [Product.SubscriptionPeriod.Unit: Int] = [
                .week: 0,
                .month: 1,
                .year: 2
            ]

            let unit1 = premiumPeriodUnit(for: product1)
            let unit2 = premiumPeriodUnit(for: product2)

            let priority1 = order[unit1 ?? .day] ?? 0
            let priority2 = order[unit2 ?? .day] ?? 0

            return priority1 < priority2
        }
    }

    // MARK: Actions

    private func purchaseSelectedProduct() {
        guard let product = selectedProduct, !viewModel.isProcessing else { return }
        generateHapticFeedback()
        Task { @MainActor in
            await viewModel.purchaseProduct(product, source: source.rawValue)
        }
    }

    private func restorePurchases() {
        generateHapticFeedback()
        Task {
            await viewModel.restorePurchases(source: source.rawValue)
        }
    }

    private func loadProducts() {
        Task {
            await viewModel.loadProducts()
            await MainActor.run {
                syncSelectedProduct()
            }
        }
    }

    private func syncSelectedProduct() {
        guard !viewModel.products.isEmpty else {
            selectedProduct = nil
            return
        }

        if let selectedProduct,
           viewModel.products.contains(where: { $0.id == selectedProduct.id }) {
            return
        }

        if let monthlyProduct = productMatching(.month) {
            selectedProduct = monthlyProduct
        } else {
            selectedProduct = viewModel.products.first
        }
    }

    private func logEvent(_ name: String, product: Product) {
        Analytics.logEvent(
            name,
            parameters: [
                "source": source.rawValue,
                "product_id": product.id,
                "price": NSDecimalNumber(decimal: product.price),
                "currency": product.priceFormatStyle.currencyCode,
                "free_trial_eligible": NSNumber(
                    value: viewModel.freeTrialEligibleProductIDs.contains(product.id)
                )
            ]
        )
    }
}

struct PreView_Previews: PreviewProvider {
    static var previews: some View {
        PreView(audioManager: AudioManager())
    }
}
