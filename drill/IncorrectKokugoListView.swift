//
//  QuizIncorrectAnswerListView.swift
//  it
//
//  Created by hashimo ryoya on 2023/12/28.
//

import SwiftUI
import Firebase

struct IncorrectKokugoListView: View {
    @Binding var isPresenting: Bool
    @State var shuffledQuizList: [QuizQuestion] = []
    @State var isDataLoaded = false // データロード状態の追跡
    
    @ObservedObject private var authManager = AuthManager.shared
    private var audioManager = AudioManager.shared
    @StateObject var sharedInterstitial = Interstitial()
    
    init(isPresenting: Binding<Bool>) {
        self._isPresenting = isPresenting
        // 初期化処理...
    }
    
    var body: some View {
        VStack{
            if isDataLoaded {
                if shuffledQuizList.isEmpty {
                    emptyIncorrectAnswerView
                } else {
                    QuizView(quizzes: shuffledQuizList, quizLevel: .incorrectKokugoAnswer, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
                }
            } else {
                ActivityIndicator()
            }
        }
        .onAppear {
            guard let userId = authManager.currentUserId else {
                isDataLoaded = true
                return
            }
            fetchKokugoIncorrectAnswers(userId: userId) { quizList in
                self.shuffledQuizList = quizList.shuffled()
                self.isDataLoaded = true
            }
        }
    }

    private var emptyIncorrectAnswerView: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 52))
                .foregroundColor(.green)
            Text("復習する問題はありません")
                .font(.headline)
            Button("戻る") { isPresenting = false }
        }
        .padding()
    }
}
    
func fetchKokugoIncorrectAnswers(userId: String, completion: @escaping ([QuizQuestion]) -> Void) {
    let ref = Database.database().reference().child("IncorrectKokugoAnswers").child(userId)
    ref.observeSingleEvent(of: .value) { snapshot in
        var quizList = [QuizQuestion]()
        
        for child in snapshot.children {
            if let childSnapshot = child as? DataSnapshot,
               let dict = childSnapshot.value as? [String: Any],
               let quiz = quizQuestion(fromIncorrectAnswerDict: dict, quizId: childSnapshot.key) {
                quizList.append(quiz)
            }
        }
        
        completion(quizList)
    }
}


struct IncorrectKokugoListView_Previews: PreviewProvider {
    static var previews: some View {
        IncorrectKokugoListView(isPresenting: .constant(false))
    }
}
