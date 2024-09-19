//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Sansu6ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "クラスの46人のうち、35%が男子です。男子は何人いますか？",
            choices: [
                "16人",
                "15人",
                "18人",
                "17人"
            ],
            correctAnswerIndex: 3,
            explanation: "46人の35%はおおよそ16.1人なので、男子は約16人です。"
        ),

        QuizQuestion(
            question: "半径24cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "1,810.56平方センチメートル",
                "1,809.76平方センチメートル",
                "1,805平方センチメートル",
                "1,820平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。24×24×3.14=1,810.56平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速65kmで4時間走ると、何キロメートル進みますか？",
            choices: [
                "260km",
                "250km",
                "270km",
                "240km"
            ],
            correctAnswerIndex: 0,
            explanation: "時速65kmで4時間走ると、65×4=260km進みます。"
        ),
        QuizQuestion(
            question: "クラスの38人のうち、30%が女子です。女子は何人いますか？",
            choices: [
                "11人",
                "12人",
                "13人",
                "10人"
            ],
            correctAnswerIndex: 0,
            explanation: "38人の30%は11.4人なので、女子はおおよそ11人です。"
        ),

        QuizQuestion(
            question: "半径22cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "1,520.76平方センチメートル",
                "1,515平方センチメートル",
                "1,500平方センチメートル",
                "1,525平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。22×22×3.14=1,520.76平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速100kmで1.5時間走ると、何キロメートル進みますか？",
            choices: [
                "140km",
                "130km",
                "150km",
                "160km"
            ],
            correctAnswerIndex: 2,
            explanation: "時速100kmで1.5時間走ると、100×1.5=150km進みます。"
        ),
        QuizQuestion(
            question: "クラスの55人のうち、40%が女子です。女子は何人いますか？",
            choices: [
                "20人",
                "22人",
                "24人",
                "21人"
            ],
            correctAnswerIndex: 2,
            explanation: "55人の40%は22人です。"
        ),

        QuizQuestion(
            question: "半径18cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "1,018.44平方センチメートル",
                "1,000平方センチメートル",
                "1,015平方センチメートル",
                "1,020平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。18×18×3.14=1,018.44平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速70kmで5時間走ると、何キロメートル進みますか？",
            choices: [
                "350km",
                "360km",
                "340km",
                "370km"
            ],
            correctAnswerIndex: 0,
            explanation: "時速70kmで5時間走ると、70×5=350km進みます。"
        ),
        QuizQuestion(
            question: "クラスの42人のうち、50%が男子です。男子は何人いますか？",
            choices: [
                "21人",
                "22人",
                "20人",
                "19人"
            ],
            correctAnswerIndex: 0,
            explanation: "42人の50%は21人です。"
        ),

        QuizQuestion(
            question: "半径16cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "804.32平方センチメートル",
                "800平方センチメートル",
                "810平方センチメートル",
                "820平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。16×16×3.14=804.32平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速80kmで4.5時間走ると、何キロメートル進みますか？",
            choices: [
                "340km",
                "360km",
                "320km",
                "350km"
            ],
            correctAnswerIndex: 1,
            explanation: "時速80kmで4.5時間走ると、80×4.5=360km進みます。"
        ),
        QuizQuestion(
            question: "クラスの36人のうち、25%が女子です。女子は何人いますか？",
            choices: [
                "9人",
                "8人",
                "10人",
                "11人"
            ],
            correctAnswerIndex: 0,
            explanation: "36人の25%は9人です。"
        ),

        QuizQuestion(
            question: "半径14cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "615.44平方センチメートル",
                "610平方センチメートル",
                "600平方センチメートル",
                "620平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。14×14×3.14=615.44平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速90kmで3.5時間走ると、何キロメートル進みますか？",
            choices: [
                "300km",
                "315km",
                "320km",
                "310km"
            ],
            correctAnswerIndex: 1,
            explanation: "時速90kmで3.5時間走ると、90×3.5=315km進みます。"
        ),
        QuizQuestion(
            question: "クラスの50人のうち、60%が男子です。男子は何人いますか？",
            choices: [
                "25人",
                "30人",
                "35人",
                "40人"
            ],
            correctAnswerIndex: 1,
            explanation: "50人の60%は30人です。"
        ),

        QuizQuestion(
            question: "半径13cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "529.66平方センチメートル",
                "530平方センチメートル",
                "525平方センチメートル",
                "532平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。13×13×3.14=529.66平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速75kmで2時間走ると、何キロメートル進みますか？",
            choices: [
                "140km",
                "160km",
                "150km",
                "130km"
            ],
            correctAnswerIndex: 2,
            explanation: "時速75kmで2時間走ると、75×2=150km進みます。"
        ),
        QuizQuestion(
            question: "クラスの44人のうち、75%が女子です。女子は何人いますか？",
            choices: [
                "32人",
                "33人",
                "34人",
                "35人"
            ],
            correctAnswerIndex: 2,
            explanation: "44人の75%は33人です。"
        ),

        QuizQuestion(
            question: "半径11cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "379.94平方センチメートル",
                "380平方センチメートル",
                "370平方センチメートル",
                "375平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。11×11×3.14=379.94平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速45kmで6時間走ると、何キロメートル進みますか？",
            choices: [
                "270km",
                "250km",
                "260km",
                "280km"
            ],
            correctAnswerIndex: 0,
            explanation: "時速45kmで6時間走ると、45×6=270km進みます。"
        ),
        QuizQuestion(
            question: "クラスの25人のうち、20%が男子です。男子は何人いますか？",
            choices: [
                "4人",
                "5人",
                "6人",
                "7人"
            ],
            correctAnswerIndex: 1,
            explanation: "25人の20%は5人です。"
        ),

        QuizQuestion(
            question: "半径4cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "50.24平方センチメートル",
                "48平方センチメートル",
                "52平方センチメートル",
                "49.5平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。4×4×3.14=50.24平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速90kmで4時間走ると、何キロメートル進みますか？",
            choices: [
                "350km",
                "360km",
                "370km",
                "400km"
            ],
            correctAnswerIndex: 1,
            explanation: "時速90kmで4時間走ると、90×4=360km進みます。"
        ),
        QuizQuestion(
            question: "クラスの30人のうち、70%が女子です。女子は何人いますか？",
            choices: [
                "18人",
                "20人",
                "21人",
                "22人"
            ],
            correctAnswerIndex: 2,
            explanation: "30人の70%は21人です。"
        ),

        QuizQuestion(
            question: "半径30cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "2,828.4平方センチメートル",
                "2,800平方センチメートル",
                "2,850平方センチメートル",
                "2,820平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。30×30×3.14=2,828.4平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速100kmで3時間走ると、何キロメートル進みますか？",
            choices: [
                "300km",
                "310km",
                "320km",
                "330km"
            ],
            correctAnswerIndex: 0,
            explanation: "時速100kmで3時間走ると、100×3=300km進みます。"
        ),
        QuizQuestion(
            question: "クラスの28人のうち、60%が男子です。男子は何人いますか？",
            choices: [
                "14人",
                "16人",
                "17人",
                "18人"
            ],
            correctAnswerIndex: 3,
            explanation: "28人の60%は16.8なので、およそ17人です。"
        ),

        QuizQuestion(
            question: "半径25cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "1,960平方センチメートル",
                "1,962.5平方センチメートル",
                "1,962平方センチメートル",
                "1,965平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "面積は、半径の2乗×円周率で求められます。25×25×3.14=1,962.5平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速40kmで4.5時間走ると、何キロメートル進みますか？",
            choices: [
                "160km",
                "170km",
                "180km",
                "175km"
            ],
            correctAnswerIndex: 2,
            explanation: "時速40kmで4.5時間走ると、40×4.5=180km進みます。"
        ),
        QuizQuestion(
            question: "クラスの40人のうち、45%が女子です。女子は何人いますか？",
            choices: [
                "18人",
                "20人",
                "22人",
                "16人"
            ],
            correctAnswerIndex: 0,
            explanation: "40人の45%は18人です。"
        ),

        QuizQuestion(
            question: "半径20cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "1,256平方センチメートル",
                "1,250平方センチメートル",
                "1,260平方センチメートル",
                "1,265平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。20×20×3.14=1,256平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速85kmで3.5時間走ると、何キロメートル進みますか？",
            choices: [
                "297.5km",
                "300km",
                "280km",
                "290km"
            ],
            correctAnswerIndex: 0,
            explanation: "時速85kmで3.5時間走ると、85×3.5=297.5km進みます。"
        ),
        QuizQuestion(
            question: "クラスの36人のうち、40%が女子です。女子は何人いますか？",
            choices: [
                "12人",
                "14人",
                "15人",
                "16人"
            ],
            correctAnswerIndex: 0,
            explanation: "36人の40%は12人です。"
        ),

        QuizQuestion(
            question: "半径15cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "707平方センチメートル",
                "706.5平方センチメートル",
                "710平方センチメートル",
                "715平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "面積は、半径の2乗×円周率で求められます。15×15×3.14=706.5平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速65kmで4時間走ると、何キロメートル進みますか？",
            choices: [
                "260km",
                "250km",
                "270km",
                "240km"
            ],
            correctAnswerIndex: 0,
            explanation: "時速65kmで4時間走ると、65×4=260km進みます。"
        ),
        QuizQuestion(
            question: "クラスの48人のうち、25%が男子です。男子は何人いますか？",
            choices: [
                "10人",
                "12人",
                "15人",
                "18人"
            ],
            correctAnswerIndex: 1,
            explanation: "48人の25%は12人です。"
        ),

        QuizQuestion(
            question: "半径12cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "452平方センチメートル",
                "452.16平方センチメートル",
                "455平方センチメートル",
                "460平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "面積は、半径の2乗×円周率で求められます。12×12×3.14=452.16平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速75kmで3時間走ると、何キロメートル進みますか？",
            choices: [
                "200km",
                "210km",
                "225km",
                "230km"
            ],
            correctAnswerIndex: 2,
            explanation: "時速75kmで3時間走ると、75×3=225km進みます。"
        ),
        QuizQuestion(
            question: "クラスの32人のうち、50%が男子です。男子は何人いますか？",
            choices: [
                "12人",
                "16人",
                "18人",
                "20人"
            ],
            correctAnswerIndex: 1,
            explanation: "32人の50%は16人です。"
        ),

        QuizQuestion(
            question: "半径9cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "254平方センチメートル",
                "254.34平方センチメートル",
                "256平方センチメートル",
                "260平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "面積は、半径の2乗×円周率で求められます。9×9×3.14=254.34平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速55kmで2時間30分走ると、何キロメートル進みますか？",
            choices: [
                "137.5km",
                "130km",
                "135km",
                "125km"
            ],
            correctAnswerIndex: 0,
            explanation: "時速55kmで2.5時間走ると、55×2.5=137.5km進みます。"
        ),
        QuizQuestion(
            question: "クラスの60人のうち、35%が女子です。女子は何人いますか？",
            choices: [
                "18人",
                "21人",
                "24人",
                "20人"
            ],
            correctAnswerIndex: 1,
            explanation: "60人の35%は21人です。"
        ),

        QuizQuestion(
            question: "半径5cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "75平方センチメートル",
                "78.5平方センチメートル",
                "80平方センチメートル",
                "70平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "面積は、半径の2乗×円周率で求められます。5×5×3.14=78.5平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速70kmで1.5時間走ると、何キロメートル進みますか？",
            choices: [
                "105km",
                "100km",
                "110km",
                "120km"
            ],
            correctAnswerIndex: 0,
            explanation: "時速70kmで1.5時間走ると、70×1.5=105km進みます。"
        ),
        QuizQuestion(
            question: "クラスの35人のうち、40%が男子です。男子は何人いますか？",
            choices: [
                "12人",
                "14人",
                "15人",
                "10人"
            ],
            correctAnswerIndex: 1,
            explanation: "35人の40%は14人です。"
        ),

        QuizQuestion(
            question: "半径6cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "113.04平方センチメートル",
                "110平方センチメートル",
                "120平方センチメートル",
                "100平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。6×6×3.14=113.04平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速90kmで2.5時間走ると、何キロメートル進みますか？",
            choices: [
                "200km",
                "225km",
                "240km",
                "180km"
            ],
            correctAnswerIndex: 1,
            explanation: "時速90kmで2.5時間走ると、90×2.5=225km進みます。"
        ),
        QuizQuestion(
            question: "クラスの50人のうち、30%が女子です。女子は何人いますか？",
            choices: [
                "12人",
                "15人",
                "20人",
                "18人"
            ],
            correctAnswerIndex: 3,
            explanation: "50人の30%は15人です。"
        ),

        QuizQuestion(
            question: "半径8cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "200平方センチメートル",
                "201平方センチメートル",
                "220平方センチメートル",
                "201.06平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "面積は、半径の2乗×円周率で求められます。8×8×3.14=201.06平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速50kmで3時間走ると、何キロメートル進みますか？",
            choices: [
                "100km",
                "150km",
                "200km",
                "120km"
            ],
            correctAnswerIndex: 1,
            explanation: "時速50kmで3時間走ると、50×3=150km進みます。"
        ),
        QuizQuestion(
            question: "クラスの45人のうち、20%が男子です。男子は何人いますか？",
            choices: [
                "9人",
                "12人",
                "10人",
                "15人"
            ],
            correctAnswerIndex: 0,
            explanation: "45人の20%は9人です。"
        ),

        QuizQuestion(
            question: "半径10cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "314平方センチメートル",
                "300平方センチメートル",
                "320平方センチメートル",
                "330平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "面積は、半径の2乗×円周率で求められます。10×10×3.14=314平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速80kmで1.5時間走ると、何キロメートル進みますか？",
            choices: [
                "100km",
                "120km",
                "130km",
                "140km"
            ],
            correctAnswerIndex: 2,
            explanation: "時速80kmで1.5時間走ると、80×1.5=120km進みます。"
        ),
        QuizQuestion(
            question: "クラスの40人のうち、25%が女子です。女子は何人いますか？",
            choices: [
                "10人",
                "15人",
                "20人",
                "25人"
            ],
            correctAnswerIndex: 0,
            explanation: "40人の25%は10人です。"
        ),

        QuizQuestion(
            question: "半径7cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "154平方センチメートル",
                "144平方センチメートル",
                "160平方センチメートル",
                "140平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。7×7×3.14=おおよそ154平方センチメートルです。"
        ),

        QuizQuestion(
            question: "時速60kmで2時間走ると、何キロメートル進みますか？",
            choices: [
                "100km",
                "120km",
                "140km",
                "160km"
            ],
            correctAnswerIndex: 1,
            explanation: "時速60kmで2時間走ると、60×2=120km進みます。"
        ),

    ]
        
    @State private var shuffledQuizList: [QuizQuestion]
    private var authManager = AuthManager()
    private var audioManager = AudioManager.shared

    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
        _shuffledQuizList = State(initialValue: quizBeginnerList.shuffled())
    }
    @StateObject var sharedInterstitial = Interstitial()
    var body: some View {
        QuizView(quizzes: shuffledQuizList, quizLevel: .sansu6, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Sansu6ListView_Previews: PreviewProvider {
    static var previews: some View {
        Sansu6ListView(isPresenting: .constant(false))
    }
}
