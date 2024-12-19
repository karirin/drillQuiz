//
//  PentagonITShape.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

enum QuizSansuLevel {
    case sansu1
    case sansu2
    case sansu3
    case sansu4
    case sansu5
    case sansu6
    
    var description: String {
        switch self {
        case .sansu1:
            return "sansu1"
        case .sansu2:
            return "sansu2"
        case .sansu3:
            return "sansu3"
        case .sansu4:
            return "sansu4"
        case .sansu5:
            return "sansu5"
        case .sansu6:
            return "sansu6"
        }
    }
}

extension QuizSansuLevel: CaseIterable {
    static var allCases: [QuizSansuLevel] {
        return [.sansu1, .sansu2, .sansu3, .sansu4, .sansu5, .sansu6]
        // 除外したいケースをここで除外
    }
}

struct PentagonSansuGraphShape: Shape {
    var quizData: [QuizSansuLevel: QuizData]

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let baseRadius = min(rect.width, rect.height) / 2 - 10
        let angle = (2 * CGFloat.pi) / 6

        var path = Path()

        for (i, level) in QuizSansuLevel.allCases.enumerated() {
            let data = quizData[level] ?? QuizData(answer: 1, correct: 0)
            let radius = baseRadius * data.correctRate // 正解率に基づく半径
            let x = center.x + radius * cos(angle * CGFloat(i) - .pi / 2)
            let y = center.y + radius * sin(angle * CGFloat(i) - .pi / 2)
            let point = CGPoint(x: x, y: y)

            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }

        path.closeSubpath()
        return path
    }
}

struct PentagonSansuGraphLabelView: View {
    var label: String
    var index: Int
    // radius パラメータを削除して、ビューのサイズに基づいて計算するようにします

    var body: some View {
        GeometryReader { geometry in
            let angle = (2 * CGFloat.pi) / CGFloat(QuizSansuLevel.allCases.count) * CGFloat(index) - .pi / 2
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            // ビューのサイズに基づいて radius を計算します
            let radius = min(geometry.size.width, geometry.size.height) / 2 * 1.13 // 85% をラベルの配置に使用します

            let x = center.x + radius * cos(angle) - 20
            let y = center.y + radius * sin(angle) - 20

            Image("\(label)")
                .resizable()
                .frame(width: 40, height: 40)
                // ラベルの中心が正しい位置に来るように調整します
//                .offset(x: radius * cos(angle) + 178, y: radius * sin(angle) + 155)
//                .offset(x: radius * cos(angle) + 0, y: radius * sin(angle) + 0)
                .offset(x:x,y:y)
                // position ではなく offset を使って配置することで、
                // より詳細な位置調整が可能になります
        }
        
    }
}


struct PentagonSansuGraphBackgroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2 - 10
        let angle = (2 * CGFloat.pi) / 6

        // ここから追加
        let scale: [CGFloat] = [0.1,0.2,0.3, 0.4,0.5, 0.6,0.7, 0.8,0.9, 1.0]
        var path = Path()

        // 目盛りの円を追加
        for factor in scale {
            let scaledRadius = radius * factor
            path.addEllipse(in: CGRect(x: center.x - scaledRadius, y: center.y - scaledRadius, width: scaledRadius * 2, height: scaledRadius * 2))
        }
        // ここまで追加

        for i in 0..<4 {
            let x = center.x + radius * cos(angle * CGFloat(i) - .pi / 2)
            let y = center.y + radius * sin(angle * CGFloat(i) - .pi / 2)
            path.move(to: center)
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return path
    }
}


struct PentagonSansuGraphView: View {
    @State private var quizData = [QuizSansuLevel: QuizData]()
    let userId: String
    let labels: [String]
    
    let scaleNumbers: [CGFloat] = [0, 50, 100]
    let graphCenter = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
    let graphRadius = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 2
    
    var body: some View {
            GeometryReader { geometry in
                let graphCenter = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2 - 170)
                // graphRadiusの最大値を100とするための計算
                let graphRadius = min(geometry.size.width, geometry.size.height) / 2 - 10
                let maxScaleValue: CGFloat = 100 // スケールの最大値
                let scaleFactor = graphRadius / maxScaleValue // スケールファクター

                ZStack {
                    PentagonSansuGraphBackgroundShape()
                                    .stroke(Color.gray, lineWidth: 1)
                    PentagonSansuGraphShape(quizData: quizData)
                        .fill(Color.orange.opacity(0.2)) // 先に塗りつぶしを適用
                           .overlay(
                               PentagonSansuGraphShape(quizData: quizData)
                                   .stroke(Color.orange, lineWidth: 2)
                           )

                    ForEach(Array(QuizSansuLevel.allCases.enumerated()), id: \.offset) { (i, _) in
                        PentagonSansuGraphLabelView(label: labels[i], index: i)
                    }
                    // 目盛りの数字を表示する
                    ForEach(scaleNumbers, id: \.self) { scaleValue in
                        // スケール値に基づいて半径を計算
                        let scaledRadius = scaleFactor * scaleValue
                        
                        // centerをgraphCenterに修正
                        let numberPosition = CGPoint(x: graphCenter.x, y: graphCenter.y - scaledRadius)
                        
                        // Text Viewを使って数字を表示
                        Text("\(Int(scaleValue))") // "%.1f" から整数に変更
                            .position(numberPosition)
                            .offset(x: -25, y: 170) // Textの位置を適宜調整
                    }
                }
                .onAppear {
                    RateManager.shared.fetchSansuQuizData(userId: userId) { data in
                        self.quizData = data
                    }
                }
            }
        }
    }

struct PentagonSansuView: View {
    @ObservedObject var authManager : AuthManager
    @State private var quizData = [QuizSansuLevel: QuizData]()
    @ObservedObject var audioManager = AudioManager.shared
    @Environment(\.presentationMode) var presentationMode
    @Binding var flag: Bool
    var body: some View {
        VStack{
            PentagonSansuGraphView(userId: authManager.currentUserId!, labels: ["算数丸１", "算数丸２", "算数丸３", "算数丸４","算数丸５","算数丸６"])
                .padding(.top,30)
            VStack(spacing: 0) {
                HStack{
                    Image("beginnerMonster1")
                        .resizable()
                        .frame(width:30,height:30)
                    Text("ダンジョンの種類")
                    Spacer()
                    Text("正答率")
                }
                .font(.system(size: 18))
                .padding()
                ScrollView{
                    ForEach(QuizSansuLevel.allCases, id: \.self) { level in
                        if let quizDataForLevel = quizData[level] {
                            VStack{
                                HStack{
                                    Image("\(level.description)")
                                        .resizable()
                                        .frame(width: 200,height: 40)
                                    Spacer()
                                    Text("\(quizDataForLevel.correctPerRate, specifier: "%.0f")%")
                                        .font(.system(size: 22))
                                }
                                .padding(.horizontal)
                            Divider()
                            }
                            .onAppear {
                                print("level.description:\(level.description)")
                            }
                        }
                    }
                }
            }
            .padding(.top)
            
            .foregroundColor(Color("fontGray"))
        }.background(Color("Color2"))
        .onAppear {
//            print("currentuser:\(authManager.currentUserId)")
            RateManager.shared.fetchSansuQuizData(userId: authManager.currentUserId!) { data in
                self.quizData = data
                print("self.quizData2:\(self.quizData)")
            }
            self.flag = true
        }
        .onChange(of: flag) { flag in
            RateManager.shared.fetchSansuQuizData(userId: authManager.currentUserId!) { data in
                self.quizData = data
//                print("self.quizData:\(self.quizData)")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PentagonSansuShape_Previews: PreviewProvider {
    static let dummyAuthManager = AuthManager()
    static var previews: some View {
//        PentagonGraphView(userId: "VQ0MZw8snHSY23rOXbhN9wxORF42", labels: ["初級", "中級", "上級", "ネットワーク", "セキュリティ","データベース", "デイリー", "神級", "初級(タイムアタック)", "中級(タイムアタック)", "上級(タイムアタック)"])
//        PentagonGraphView(userId: "VQ0MZw8snHSY23rOXbhN9wxORF42", labels: ["初級", "中級", "上級", "神級", "ネットワーク", "セキュリティ","データベース"])
        PentagonSansuView(authManager: dummyAuthManager, flag: .constant(false))
    }
}

