//
//  SubjectComponents.swift
//  it
//
//  Modern UI Components for Subject List Views
//

import SwiftUI

// MARK: - Color Hex Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Subject Theme
struct SubjectTheme {
    let primaryColor: Color
    let secondaryColor: Color
    let iconName: String
    let gradientColors: [Color]
    
    static let sansu = SubjectTheme(
        primaryColor: Color(red: 0.25, green: 0.47, blue: 0.85),
        secondaryColor: Color(red: 0.4, green: 0.6, blue: 0.95),
        iconName: "function",
        gradientColors: [
            Color(red: 0.25, green: 0.47, blue: 0.85),
            Color(red: 0.45, green: 0.65, blue: 0.95)
        ]
    )
    
    static let kokugo = SubjectTheme(
        primaryColor: Color(red: 0.85, green: 0.35, blue: 0.4),
        secondaryColor: Color(red: 0.95, green: 0.5, blue: 0.55),
        iconName: "text.book.closed.fill",
        gradientColors: [
            Color(red: 0.85, green: 0.35, blue: 0.4),
            Color(red: 0.95, green: 0.55, blue: 0.5)
        ]
    )
    
    static let shakai = SubjectTheme(
        primaryColor: Color(red: 0.2, green: 0.65, blue: 0.45),
        secondaryColor: Color(red: 0.35, green: 0.8, blue: 0.6),
        iconName: "globe.asia.australia.fill",
        gradientColors: [
            Color(red: 0.2, green: 0.65, blue: 0.45),
            Color(red: 0.4, green: 0.8, blue: 0.6)
        ]
    )
    
    static let rika = SubjectTheme(
        primaryColor: Color(red: 0.9, green: 0.55, blue: 0.2),
        secondaryColor: Color(red: 0.95, green: 0.7, blue: 0.35),
        iconName: "atom",
        gradientColors: [
            Color(red: 0.9, green: 0.55, blue: 0.2),
            Color(red: 0.95, green: 0.75, blue: 0.4)
        ]
    )
}

// MARK: - Modern Subject Card
struct ModernSubjectCard: View {
    let title: String
    let subtitle: String
    let theme: SubjectTheme
    let isLocked: Bool
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            generateHapticFeedback()
            action()
        }) {
            HStack(spacing: 16) {
                // Icon Circle
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: theme.gradientColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: isIPad() ? 70 : 50, height: isIPad() ? 70 : 50)
                    
                    Image(systemName: theme.iconName)
                        .font(.system(size: isIPad() ? 28 : 20, weight: .semibold))
                        .foregroundColor(.white)
                }
                
                // Text Content
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: isIPad() ? 22 : 16, weight: .bold))
                        .foregroundColor(Color("fontGray"))
                    
                    Text(subtitle)
                        .font(.system(size: isIPad() ? 16 : 12))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Arrow
                Image(systemName: "chevron.right")
                    .font(.system(size: isIPad() ? 18 : 14, weight: .semibold))
                    .foregroundColor(theme.primaryColor.opacity(0.7))
            }
            .padding(isIPad() ? 20 : 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: theme.primaryColor.opacity(0.15), radius: 8, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(theme.primaryColor.opacity(0.1), lineWidth: 1)
            )
            .overlay(
                Group {
                    if isLocked {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.black.opacity(0.4))
                        
                        VStack(spacing: 8) {
                            Image(systemName: "lock.fill")
                                .font(.system(size: isIPad() ? 24 : 18))
                            Text("プレミアムプランで解放")
                                .font(.system(size: isIPad() ? 16 : 12, weight: .medium))
                        }
                        .foregroundColor(.white)
                    }
                }
            )
        }
        .buttonStyle(ScaleButtonStyle())
        .padding(.horizontal)
    }
    
    private func isIPad() -> Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}

// MARK: - Learning Mode Glass (itQuiz の学習モードと共通の見た目)
struct LearningModeGlassBackground: View {
    var body: some View {
        ZStack {
            Color(uiColor: .systemGroupedBackground)
            LinearGradient(
                colors: [Color(hex: "b9e9e1").opacity(0.4), Color(hex: "d4d9fa").opacity(0.3), Color(hex: "f5d8e7").opacity(0.35)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            GeometryReader { geometry in
                Circle()
                    .fill(Color(hex: "38c9ae").opacity(0.2))
                    .frame(width: 300, height: 300)
                    .blur(radius: 40)
                    .offset(x: -100, y: -50)
                Circle()
                    .fill(Color(hex: "667eea").opacity(0.22))
                    .frame(width: 250, height: 250)
                    .blur(radius: 40)
                    .offset(x: geometry.size.width - 100, y: geometry.size.height - 200)
            }
        }
        .ignoresSafeArea()
    }
}

private struct LearningModeGlassSurface: ViewModifier {
    let gradient: LinearGradient
    @Environment(\.accessibilityReduceTransparency) private var reduceTransparency
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(reduceTransparency
                          ? AnyShapeStyle(Color(uiColor: .secondarySystemGroupedBackground))
                          : AnyShapeStyle(Material.ultraThin))
                    .overlay {
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .fill(gradient.opacity(colorScheme == .dark ? 0.1 : 0.12))
                    }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .strokeBorder(
                        LinearGradient(
                            colors: [.white.opacity(colorScheme == .dark ? 0.4 : 0.9), .white.opacity(0.1)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            }
            .contentShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .shadow(color: .black.opacity(0.07), radius: 12, x: 0, y: 6)
    }
}

extension View {
    func learningModeGlassSurface(gradient: LinearGradient) -> some View {
        modifier(LearningModeGlassSurface(gradient: gradient))
    }
}

/// 学習モードのカード右端に置く丸いシェブロン
private struct GlassCardChevron: View {
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Image(systemName: "chevron.right")
            .font(.system(size: 12, weight: .bold))
            .foregroundStyle(.secondary)
            .frame(width: 26, height: 26)
            .background(.white.opacity(colorScheme == .dark ? 0.08 : 0.5), in: Circle())
    }
}

/// プレミアム限定カードに重ねるロック表示
private struct GlassCardLockOverlay: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.black.opacity(0.4))

            VStack(spacing: 6) {
                Image(systemName: "lock.fill")
                    .font(.system(size: 14))
                Text("プレミアムプランで解放")
                    .font(.system(size: 11, weight: .bold))
            }
            .foregroundColor(.white)
        }
    }
}

// MARK: - Review Card (復習問題用)
struct ReviewCard: View {
    let subjectName: String
    let theme: SubjectTheme
    let hasIncorrectAnswers: Bool
    let isLoading: Bool
    let isLocked: Bool
    let action: () -> Void

    private var isActive: Bool { hasIncorrectAnswers && !isLocked }

    var body: some View {
        Button(action: {
            generateHapticFeedback()
            action()
        }) {
            HStack(spacing: 10) {
                ZStack {
                    Circle()
                        .fill(QuizColors.review.opacity(0.14))
                        .frame(width: 34, height: 34)

                    if isLoading {
                        ProgressView()
                            .scaleEffect(0.8)
                    } else {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(.primary)
                    }
                }

                VStack(alignment: .leading, spacing: 3) {
                    Text("復習問題")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.primary)

                    Text(isLoading ? "読み込み中..." : (hasIncorrectAnswers ? "不正解の問題を復習" : "復習する問題はありません"))
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(.secondary)
                }

                Spacer(minLength: 0)

                if isActive && !isLoading {
                    GlassCardChevron()
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .learningModeGlassSurface(gradient: QuizColors.review)
            .opacity(isActive || isLocked || isLoading ? 1 : 0.6)
            .overlay {
                if isLocked {
                    GlassCardLockOverlay()
                }
            }
        }
        .buttonStyle(ScaleButtonStyle())
        .disabled(isLoading || (!hasIncorrectAnswers && !isLocked))
        .padding(.horizontal, 16)
    }
}

// MARK: - Section Header
struct SectionHeader: View {
    let title: String
    let icon: String
    let colors: [Color]

    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 2)
                .fill(
                    LinearGradient(
                        colors: colors,
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 4, height: 20)

            Image(systemName: icon)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(colors.first ?? .secondary)

            Text(title)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

// MARK: - Scale Button Style
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

// MARK: - Grade Card (学年別カード)
struct GradeCard: View {
    let grade: Int
    let title: String
    let theme: SubjectTheme
    let action: () -> Void

    private var gradient: LinearGradient {
        LinearGradient(colors: theme.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
    }

    var body: some View {
        Button(action: {
            generateHapticFeedback()
            action()
        }) {
            HStack(spacing: 10) {
                Text("\(grade)")
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundStyle(.primary)
                    .frame(width: 34, height: 34)
                    .background(gradient.opacity(0.14), in: Circle())

                VStack(alignment: .leading, spacing: 3) {
                    Text("\(grade)年生")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(.secondary)

                    Text(title)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.primary)
                        .lineLimit(1)
                }

                Spacer(minLength: 0)

                GlassCardChevron()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .learningModeGlassSurface(gradient: gradient)
        }
        .buttonStyle(ScaleButtonStyle())
        .padding(.horizontal, 16)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
                SectionHeader(title: "復習問題", icon: "arrow.counterclockwise", colors: [QuizColors.reviewStart, QuizColors.reviewEnd])

                ReviewCard(
                    subjectName: "算数",
                    theme: .sansu,
                    hasIncorrectAnswers: true,
                    isLoading: false,
                    isLocked: false,
                    action: {}
                )
            }

            VStack(spacing: 12) {
                SectionHeader(title: "学年を選択", icon: "folder.fill", colors: SubjectTheme.sansu.gradientColors)

                GradeCard(grade: 1, title: "足し算・引き算", theme: .sansu, action: {})
                GradeCard(grade: 2, title: "かけ算・時計", theme: .sansu, action: {})
                GradeCard(grade: 3, title: "わり算・分数", theme: .sansu, action: {})
            }
        }
        .padding(.vertical)
    }
    .background(LearningModeGlassBackground())
}
