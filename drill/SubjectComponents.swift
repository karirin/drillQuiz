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

// MARK: - Review Card (復習問題用)
struct ReviewCard: View {
    let subjectName: String
    let theme: SubjectTheme
    let hasIncorrectAnswers: Bool
    let isLoading: Bool
    let isLocked: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            generateHapticFeedback()
            action()
        }) {
            HStack(spacing: 16) {
                // Icon with Badge
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(
                            LinearGradient(
                                colors: hasIncorrectAnswers && !isLocked ? theme.gradientColors : [Color.gray.opacity(0.3), Color.gray.opacity(0.4)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: isIPad() ? 60 : 44, height: isIPad() ? 60 : 44)
                    
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.system(size: isIPad() ? 24 : 18, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("復習問題")
                        .font(.system(size: isIPad() ? 20 : 15, weight: .bold))
                        .foregroundColor(hasIncorrectAnswers && !isLocked ? Color("fontGray") : .gray)
                    
                    Text(isLoading ? "読み込み中..." : (hasIncorrectAnswers ? "不正解の問題を復習" : "復習する問題はありません"))
                        .font(.system(size: isIPad() ? 14 : 11))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                if hasIncorrectAnswers && !isLocked && !isLoading {
                    Image(systemName: "chevron.right")
                        .font(.system(size: isIPad() ? 16 : 12, weight: .semibold))
                        .foregroundColor(theme.primaryColor.opacity(0.7))
                }
            }
            .padding(isIPad() ? 18 : 14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white.opacity(0.9))
                    .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 3)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(
                        hasIncorrectAnswers && !isLocked ? theme.primaryColor.opacity(0.2) : Color.gray.opacity(0.1),
                        lineWidth: 1
                    )
            )
            .overlay(
                Group {
                    if isLocked {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.black.opacity(0.45))
                        
                        VStack(spacing: 6) {
                            Image(systemName: "lock.fill")
                                .font(.system(size: isIPad() ? 20 : 14))
                            Text("プレミアムプランで解放")
                                .font(.system(size: isIPad() ? 14 : 10, weight: .medium))
                        }
                        .foregroundColor(.white)
                    }
                }
            )
        }
        .buttonStyle(ScaleButtonStyle())
        .disabled(isLoading || (!hasIncorrectAnswers && !isLocked))
        .padding(.horizontal)
    }
    
    private func isIPad() -> Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}

// MARK: - Section Header
struct SectionHeader: View {
    let title: String
    let theme: SubjectTheme
    
    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 2)
                .fill(
                    LinearGradient(
                        colors: theme.gradientColors,
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 4, height: isIPad() ? 24 : 18)
            
            Text(title)
                .font(.system(size: isIPad() ? 18 : 14, weight: .semibold))
                .foregroundColor(Color("fontGray"))
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
    
    private func isIPad() -> Bool {
        UIDevice.current.userInterfaceIdiom == .pad
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
    
    private var gradeIcon: String {
        switch grade {
        case 1: return "1.circle.fill"
        case 2: return "2.circle.fill"
        case 3: return "3.circle.fill"
        case 4: return "4.circle.fill"
        case 5: return "5.circle.fill"
        case 6: return "6.circle.fill"
        default: return "\(grade).circle.fill"
        }
    }
    
    var body: some View {
        Button(action: {
            generateHapticFeedback()
            action()
        }) {
            HStack(spacing: 14) {
                // Grade Number
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: theme.gradientColors.map { $0.opacity(0.15) },
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: isIPad() ? 56 : 42, height: isIPad() ? 56 : 42)
                    
                    Text("\(grade)")
                        .font(.system(size: isIPad() ? 26 : 20, weight: .bold, design: .rounded))
                        .foregroundColor(theme.primaryColor)
                }
                
                // Title
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(grade)年生")
                        .font(.system(size: isIPad() ? 12 : 10, weight: .medium))
                        .foregroundColor(theme.primaryColor.opacity(0.8))
                    
                    Text(title)
                        .font(.system(size: isIPad() ? 18 : 14, weight: .semibold))
                        .foregroundColor(Color("fontGray"))
                        .lineLimit(1)
                }
                
                Spacer()
                
                // Progress indicator (placeholder)
                Image(systemName: "chevron.right")
                    .font(.system(size: isIPad() ? 16 : 12, weight: .medium))
                    .foregroundColor(.gray.opacity(0.5))
            }
            .padding(.horizontal, isIPad() ? 18 : 14)
            .padding(.vertical, isIPad() ? 16 : 12)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white)
                    .shadow(color: theme.primaryColor.opacity(0.08), radius: 8, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(theme.primaryColor.opacity(0.08), lineWidth: 1)
            )
        }
        .buttonStyle(ScaleButtonStyle())
        .padding(.horizontal)
    }
    
    private func isIPad() -> Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}

// MARK: - Background Gradient
struct SubjectBackgroundView: View {
    let theme: SubjectTheme
    
    var body: some View {
        ZStack {
            Color("Color2")
                .ignoresSafeArea()
            
            // Subtle gradient overlay
            LinearGradient(
                colors: [
                    theme.primaryColor.opacity(0.03),
                    Color.clear
                ],
                startPoint: .top,
                endPoint: .center
            )
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            SectionHeader(title: "復習問題", theme: .sansu)
            
            ReviewCard(
                subjectName: "算数",
                theme: .sansu,
                hasIncorrectAnswers: true,
                isLoading: false,
                isLocked: false,
                action: {}
            )
            
            SectionHeader(title: "学年を選択", theme: .sansu)
            
            GradeCard(grade: 1, title: "足し算・引き算", theme: .sansu, action: {})
            GradeCard(grade: 2, title: "かけ算・時計", theme: .sansu, action: {})
            GradeCard(grade: 3, title: "わり算・分数", theme: .sansu, action: {})
        }
        .padding(.vertical)
    }
    .background(SubjectBackgroundView(theme: .sansu))
}
