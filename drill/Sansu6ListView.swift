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
            correctAnswerIndex: 0,
            explanation: "46人の35%はおおよそ16.1人なので、男子は約16人です。"
        ),

        QuizQuestion(
            question: "半径24cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "1,809平方センチメートル",
                "1,800平方センチメートル",
                "1,805平方センチメートル",
                "1,820平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "面積は、半径の2乗×円周率で求められます。24×24×3.14=1,808.64平方センチメートルなので、おおよそ1,809平方センチメートルです。"
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
            correctAnswerIndex: 1,
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
                "529平方センチメートル",
                "531平方センチメートル",
                "525平方センチメートル",
                "540平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "面積は、半径の2乗×円周率で求められます。13×13×3.14=530.66平方センチメートルなので、おおよそ531平方センチメートルです。"
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 2,
            explanation: "28人の60%は16.8なので、およそ17人です。"
        ),

        QuizQuestion(
            question: "半径25cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "1,960平方センチメートル",
                "1,963平方センチメートル",
                "1,950平方センチメートル",
                "1,965平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "面積は、半径の2乗×円周率で求められます。25×25×3.14=1,962.5平方センチメートルなので、おおよそ1,963平方センチメートルです。"
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
            correctAnswerIndex: 1,
            explanation: "36人の40%は14.4人なので、女子はおおよそ14人です。"
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
            correctAnswerIndex: 1,
            explanation: "50人の30%は15人です。"
        ),

        QuizQuestion(
            question: "半径8cmの円の面積はおおよそ何平方センチメートルですか？（円周率を3.14とする）",
            choices: [
                "200平方センチメートル",
                "201平方センチメートル",
                "220平方センチメートル",
                "210平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "面積は、半径の2乗×円周率で求められます。8×8×3.14=200.96平方センチメートルなので、おおよそ201平方センチメートルです。"
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
            correctAnswerIndex: 0,
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
            correctAnswerIndex: 1,
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

        QuizQuestion(
                question: "5/8 + 7/15 はいくつですか？",
                choices: [
                    "1と1/120",
                    "1と11/120",
                    "11/23",
                    "1と13/120"
                ],
                correctAnswerIndex: 1,
                explanation: "5/8と7/15の分母を120にそろえると、75/120+56/120=131/120=1と11/120です。"
            ),

            QuizQuestion(
                question: "3.5：5.6を最も簡単な整数の比にすると、どれですか？",
                choices: [
                    "7：8",
                    "5：6",
                    "5：8",
                    "8：13"
                ],
                correctAnswerIndex: 2,
                explanation: "3.5：5.6の両方を10倍すると35：56です。35と56を7で割ると、5：8です。"
            ),

            QuizQuestion(
                question: "yがxに比例し、y=0.75×xで表されます。xが48のとき、yはいくつですか？",
                choices: [
                    "34",
                    "32",
                    "36",
                    "40"
                ],
                correctAnswerIndex: 2,
                explanation: "y=0.75×48=36です。"
            ),

            QuizQuestion(
                question: "4.62kmの道のりを28分で進みました。分速は何mですか？",
                choices: [
                    "160m",
                    "165m",
                    "154m",
                    "150m"
                ],
                correctAnswerIndex: 1,
                explanation: "4.62km=4,620mです。4,620÷28=165より、分速165mです。"
            ),

            QuizQuestion(
                question: "正九角形の対称の軸は何本ありますか？",
                choices: [
                    "9本",
                    "18本",
                    "4本",
                    "8本"
                ],
                correctAnswerIndex: 0,
                explanation: "正九角形では、各頂点と向かい側の辺の中点を通る対称の軸が1本ずつあり、全部で9本です。"
            ),

            QuizQuestion(
                question: "半径18cmの円の6分の1の面積は何平方センチメートルですか？（円周率を3.14とする）",
                choices: [
                    "339.12平方センチメートル",
                    "508.68平方センチメートル",
                    "169.56平方センチメートル",
                    "84.78平方センチメートル"
                ],
                correctAnswerIndex: 2,
                explanation: "円全体の面積は18×18×3.14=1,017.36平方センチメートルです。その6分の1なので、1,017.36÷6=169.56平方センチメートルです。"
            ),

            QuizQuestion(
                question: "底面積が56平方センチメートル、高さが7.5cmの柱の体積は何立方センチメートルですか？",
                choices: [
                    "406立方センチメートル",
                    "448立方センチメートル",
                    "420立方センチメートル",
                    "392立方センチメートル"
                ],
                correctAnswerIndex: 2,
                explanation: "柱の体積は底面積×高さなので、56×7.5=420立方センチメートルです。"
            ),

            QuizQuestion(
                question: "帽子が5種類、上着が3種類、靴が2種類あります。それぞれ1種類ずつ選ぶ組み合わせは何通りですか？",
                choices: [
                    "15通り",
                    "20通り",
                    "10通り",
                    "30通り"
                ],
                correctAnswerIndex: 3,
                explanation: "帽子、上着、靴の選び方をかけると、5×3×2=30通りです。"
            ),

            QuizQuestion(
                question: "3と3/8 ÷ 1と1/2 はいくつですか？",
                choices: [
                    "2と3/8",
                    "1と7/8",
                    "3と1/4",
                    "2と1/4"
                ],
                correctAnswerIndex: 3,
                explanation: "3と3/8=27/8、1と1/2=3/2です。27/8÷3/2=27/8×2/3=9/4=2と1/4です。"
            ),

            QuizQuestion(
                question: "1,260円を4：5の比に分けます。少ない方はいくらですか？",
                choices: [
                    "700円",
                    "504円",
                    "560円",
                    "630円"
                ],
                correctAnswerIndex: 2,
                explanation: "比の合計は4+5=9です。1,260÷9=140、140×4=560より、少ない方は560円です。"
            ),

            QuizQuestion(
                question: "yがxに反比例し、x=16のときy=9です。x=24のとき、yはいくつですか？",
                choices: [
                    "5",
                    "8",
                    "4",
                    "6"
                ],
                correctAnswerIndex: 3,
                explanation: "反比例ではx×yが一定です。16×9=144なので、x=24のときy=144÷24=6です。"
            ),

            QuizQuestion(
                question: "秒速3.5mで4分間進むと、道のりは何mですか？",
                choices: [
                    "840m",
                    "780m",
                    "810m",
                    "720m"
                ],
                correctAnswerIndex: 0,
                explanation: "4分=240秒です。道のりは速さ×時間なので、3.5×240=840mです。"
            ),

            QuizQuestion(
                question: "直径28cmの円の8分の5の面積は何平方センチメートルですか？（円周率を3.14とする）",
                choices: [
                    "615.44平方センチメートル",
                    "384.65平方センチメートル",
                    "461.58平方センチメートル",
                    "307.72平方センチメートル"
                ],
                correctAnswerIndex: 1,
                explanation: "半径は14cmで、円全体の面積は14×14×3.14=615.44平方センチメートルです。その8分の5なので、615.44×5÷8=384.65平方センチメートルです。"
            ),

            QuizQuestion(
                question: "6人の記録が8、10、12、12、14、16でした。この記録の最頻値はどれですか？",
                choices: [
                    "10",
                    "16",
                    "13",
                    "12"
                ],
                correctAnswerIndex: 3,
                explanation: "12が2回で最も多く現れ、ほかの数は1回ずつなので、最頻値は12です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】7/9 × 27/14 = ＿＿。答えを帯分数で書きましょう。",
                answer: "1と1/2",
                acceptableAnswers: ["１と１／２"],
                explanation: "7/9×27/14=189/126=3/2なので、帯分数では1と1/2です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】7.5：12を最も簡単な整数の比にすると、＿＿です。",
                answer: "5：8",
                acceptableAnswers: ["5:8", "５：８"],
                explanation: "7.5：12の両方を1.5で割ると、5：8です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】2.88kmの道のりを16分で進む速さは、分速＿＿mです。",
                answer: "180",
                acceptableAnswers: ["１８０"],
                explanation: "2.88km=2,880mなので、2,880÷16=180より、分速180mです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】点Pと点P'は、点Oについて点対称です。OPが4.8cmのとき、PP'は＿＿cmです。",
                answer: "9.6",
                acceptableAnswers: ["９．６"],
                explanation: "点Oは線分PP'を二等分するので、PP'=4.8×2=9.6cmです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】半径5cm、高さ14cmの円柱の体積は＿＿立方センチメートルです。（円周率を3.14とする）",
                answer: "1099",
                acceptableAnswers: ["1,099", "１，０９９", "１０９９"],
                explanation: "円柱の体積は5×5×3.14×14=1099立方センチメートルです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】7個の数13、18、16、22、19、25、17の範囲は＿＿です。",
                answer: "12",
                acceptableAnswers: ["１２"],
                explanation: "最大値は25、最小値は13なので、範囲は25-13=12です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】2と1/10 ÷ 7/15を計算する手順を、正しい順に並べましょう。",
                choices: [
                    "315/70を約分し、9/2にする",
                    "2と1/10を21/10に直す",
                    "9/2を4と1/2に直して答える",
                    "7/15の逆数をかけ、21/10×15/7=315/70を計算する"
                ],
                orderedChoices: [
                    "2と1/10を21/10に直す",
                    "7/15の逆数をかけ、21/10×15/7=315/70を計算する",
                    "315/70を約分し、9/2にする",
                    "9/2を4と1/2に直して答える"
                ],
                explanation: "2と1/10を21/10に直し、7/15の逆数15/7をかけます。21/10×15/7=315/70=9/2=4と1/2です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】中心角が120度、直径18cmのおうぎ形の面積を求める手順を、正しい順に並べましょう。（円周率を3.14とする）",
                choices: [
                    "254.34÷3=84.78を計算する",
                    "直径18cmを2で割り、半径9cmを求める",
                    "84.78平方センチメートルと答える",
                    "9×9×3.14=254.34で円全体の面積を求める"
                ],
                orderedChoices: [
                    "直径18cmを2で割り、半径9cmを求める",
                    "9×9×3.14=254.34で円全体の面積を求める",
                    "254.34÷3=84.78を計算する",
                    "84.78平方センチメートルと答える"
                ],
                explanation: "中心角120度は360度の3分の1です。半径9cmの円全体の面積254.34を3で割ると、おうぎ形の面積は84.78平方センチメートルです。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】7枚の異なるカードから3枚を選び、左から順に並べる方法が何通りあるか求める手順を、正しい順に並べましょう。",
                choices: [
                    "3番目は残りの5枚から選ぶ",
                    "7×6×5=210を計算する",
                    "1番目は7枚から選ぶ",
                    "2番目は残りの6枚から選ぶ"
                ],
                orderedChoices: [
                    "1番目は7枚から選ぶ",
                    "2番目は残りの6枚から選ぶ",
                    "3番目は残りの5枚から選ぶ",
                    "7×6×5=210を計算する"
                ],
                explanation: "1番目は7通り、2番目は6通り、3番目は5通りなので、7×6×5=210通りです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】比例・反比例の式から、指定されたxに対応するyの値を求めて組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "y=2.4×x、x=15", match: "36"),
                    QuizMatchingPair(prompt: "y=96÷x、x=12", match: "8"),
                    QuizMatchingPair(prompt: "y=0.6×x、x=50", match: "30"),
                    QuizMatchingPair(prompt: "y=126÷x、x=18", match: "7")
                ],
                choices: [
                    "8",
                    "30",
                    "7",
                    "36"
                ],
                explanation: "2.4×15=36、96÷12=8、0.6×50=30、126÷18=7です。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】図形と対称の性質を正しく組み合わせましょう。長方形は正方形ではなく、二等辺三角形は正三角形ではないものとします。",
                pairs: [
                    QuizMatchingPair(prompt: "正十三角形", match: "対称の軸が13本あり、点対称ではない"),
                    QuizMatchingPair(prompt: "正十四角形", match: "対称の軸が14本あり、点対称でもある"),
                    QuizMatchingPair(prompt: "長方形", match: "対称の軸が2本あり、点対称でもある"),
                    QuizMatchingPair(prompt: "二等辺三角形", match: "対称の軸が1本あり、点対称ではない")
                ],
                choices: [
                    "対称の軸が2本あり、点対称でもある",
                    "対称の軸が13本あり、点対称ではない",
                    "対称の軸が1本あり、点対称ではない",
                    "対称の軸が14本あり、点対称でもある"
                ],
                explanation: "正十三角形は対称の軸が13本で点対称ではなく、正十四角形は対称の軸が14本で点対称でもあります。長方形は対称の軸が2本で点対称でもあり、二等辺三角形は対称の軸が1本で点対称ではありません。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】材料Aと材料Bを、資料と同じ比で合計64kg用意します。材料Aは何kg必要ですか？",
                answer: "24",
                acceptableAnswers: ["２４"],
                referenceTitle: "見本で使った材料の重さ",
                referenceRows: [
                    QuizReferenceRow(label: "材料A", value: "4.5kg"),
                    QuizReferenceRow(label: "材料B", value: "7.5kg")
                ],
                explanation: "4.5：7.5=3：5です。比の合計は8なので、64÷8=8、8×3=24より、材料Aは24kg必要です。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】xとyが比例しています。yが90のときのxを答えましょう。",
                answer: "20",
                acceptableAnswers: ["２０"],
                referenceTitle: "xとyの対応",
                referenceRows: [
                    QuizReferenceRow(label: "対応1", value: "x=7、y=31.5"),
                    QuizReferenceRow(label: "対応2", value: "x=12、y=54"),
                    QuizReferenceRow(label: "求める対応", value: "x=?、y=90")
                ],
                explanation: "31.5÷7=4.5、54÷12=4.5なので、y=4.5×xです。90÷4.5=20より、xは20です。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】休まずに2つの区間を続けて進みました。全体の平均の速さを、時速何kmかで答えましょう。",
                answer: "43.2",
                acceptableAnswers: ["４３．２"],
                referenceTitle: "2つの区間の記録",
                referenceRows: [
                    QuizReferenceRow(label: "第1区間", value: "15kmを20分"),
                    QuizReferenceRow(label: "第2区間", value: "21kmを30分")
                ],
                explanation: "全体の道のりは15+21=36km、全体の時間は20+30=50分=5/6時間です。36÷5/6=43.2より、平均の速さは時速43.2kmです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】直方体の水そうに入っている水の体積をLで答えましょう。",
                answer: "50.4",
                acceptableAnswers: ["５０．４"],
                referenceTitle: "水そうと水の深さ",
                referenceRows: [
                    QuizReferenceRow(label: "底面の縦", value: "60cm"),
                    QuizReferenceRow(label: "底面の横", value: "35cm"),
                    QuizReferenceRow(label: "水の深さ", value: "24cm"),
                    QuizReferenceRow(label: "体積の換算", value: "1,000立方センチメートル=1L")
                ],
                explanation: "水の体積は60×35×24=50,400立方センチメートルです。50,400÷1,000=50.4より、50.4Lです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】主菜、副菜、デザートを1種類ずつ選びます。選べない組み合わせを除くと、全部で何通りですか？",
                answer: "22",
                acceptableAnswers: ["２２"],
                referenceTitle: "セットメニューの選び方",
                referenceRows: [
                    QuizReferenceRow(label: "主菜", value: "3種類"),
                    QuizReferenceRow(label: "副菜", value: "4種類"),
                    QuizReferenceRow(label: "デザート", value: "2種類"),
                    QuizReferenceRow(label: "選べない組み合わせ", value: "主菜Cと副菜Dを同時に選ぶ2通り")
                ],
                explanation: "条件がなければ3×4×2=24通りです。主菜Cと副菜Dを同時に選ぶ場合は、デザートの選び方2通りがどちらも選べないので、24-2=22通りです。"
            ),
            QuizQuestion(
                question: "13/18 - 5/12 はいくつですか？",
                choices: [
                    "23/36",
                    "1/6",
                    "11/36",
                    "7/30"
                ],
                correctAnswerIndex: 2,
                explanation: "13/18と5/12の分母を36にそろえると、26/36-15/36=11/36です。"
            ),

            QuizQuestion(
                question: "84：126を最も簡単な整数の比にすると、どれですか？",
                choices: [
                    "2：3",
                    "3：4",
                    "7：9",
                    "4：5"
                ],
                correctAnswerIndex: 0,
                explanation: "84と126を最大公約数42で割ると、84：126=2：3です。"
            ),

            QuizQuestion(
                question: "yがxに比例し、y=3.2×xで表されます。xが15のとき、yはいくつですか？",
                choices: [
                    "45",
                    "48",
                    "51",
                    "42"
                ],
                correctAnswerIndex: 1,
                explanation: "y=3.2×15=48です。"
            ),

            QuizQuestion(
                question: "3.24kmの道のりを24分で進みました。分速は何mですか？",
                choices: [
                    "120m",
                    "125m",
                    "135m",
                    "130m"
                ],
                correctAnswerIndex: 2,
                explanation: "3.24km=3,240mです。3,240÷24=135より、分速135mです。"
            ),

            QuizQuestion(
                question: "正十角形の対称の軸は何本ありますか？",
                choices: [
                    "5本",
                    "10本",
                    "20本",
                    "8本"
                ],
                correctAnswerIndex: 1,
                explanation: "正十角形には、向かい合う頂点を通る軸が5本、向かい合う辺の中点を通る軸が5本あり、合わせて10本です。"
            ),

            QuizQuestion(
                question: "直径30cmの円の面積は何平方センチメートルですか？（円周率を3.14とする）",
                choices: [
                    "1,413平方センチメートル",
                    "706.5平方センチメートル",
                    "2,826平方センチメートル",
                    "353.25平方センチメートル"
                ],
                correctAnswerIndex: 1,
                explanation: "半径は30÷2=15cmです。15×15×3.14=706.5より、面積は706.5平方センチメートルです。"
            ),

            QuizQuestion(
                question: "底面が上底5cm、下底11cm、高さ6cmの台形で、柱の高さが8cmの四角柱の体積は何立方センチメートルですか？",
                choices: [
                    "384立方センチメートル",
                    "192立方センチメートル",
                    "336立方センチメートル",
                    "768立方センチメートル"
                ],
                correctAnswerIndex: 0,
                explanation: "底面積は(5+11)×6÷2=48平方センチメートルです。48×8=384より、体積は384立方センチメートルです。"
            ),

            QuizQuestion(
                question: "ノートが4種類、ペンが3種類、シールが2種類あります。それぞれ1種類ずつ選ぶ組み合わせは何通りですか？",
                choices: [
                    "24通り",
                    "9通り",
                    "18通り",
                    "12通り"
                ],
                correctAnswerIndex: 0,
                explanation: "ノート、ペン、シールの選び方をかけると、4×3×2=24通りです。"
            ),

            QuizQuestion(
                question: "2と5/6 ÷ 1と1/3 はいくつですか？",
                choices: [
                    "3と1/8",
                    "2と1/8",
                    "2と3/8",
                    "1と7/8"
                ],
                correctAnswerIndex: 1,
                explanation: "2と5/6=17/6、1と1/3=4/3です。17/6÷4/3=17/6×3/4=17/8=2と1/8です。"
            ),

            QuizQuestion(
                question: "AとBの長さの比は4：7です。Bが63cmのとき、Aは何cmですか？",
                choices: [
                    "36cm",
                    "49cm",
                    "42cm",
                    "28cm"
                ],
                correctAnswerIndex: 0,
                explanation: "Bの7に当たる長さが63cmなので、1に当たる長さは63÷7=9cmです。Aは9×4=36cmです。"
            ),

            QuizQuestion(
                question: "yがxに反比例し、x=18のときy=14です。y=21のとき、xはいくつですか？",
                choices: [
                    "10",
                    "8",
                    "14",
                    "12"
                ],
                correctAnswerIndex: 3,
                explanation: "反比例ではx×yが一定です。18×14=252なので、y=21のときx=252÷21=12です。"
            ),

            QuizQuestion(
                question: "時速54kmで1時間20分進むと、道のりは何kmですか？",
                choices: [
                    "63km",
                    "68km",
                    "72km",
                    "60km"
                ],
                correctAnswerIndex: 2,
                explanation: "1時間20分=4/3時間です。54×4/3=72より、道のりは72kmです。"
            ),

            QuizQuestion(
                question: "点Aと点A'は、点Oについて点対称です。OAが7.5cmのとき、AA'の長さは何cmですか？",
                choices: [
                    "15cm",
                    "30cm",
                    "7.5cm",
                    "22.5cm"
                ],
                correctAnswerIndex: 0,
                explanation: "点Oは線分AA'を二等分するので、AA'=7.5×2=15cmです。"
            ),

            QuizQuestion(
                question: "6回の記録が14、19、17、23、16、20でした。この記録の範囲はいくつですか？",
                choices: [
                    "37",
                    "7",
                    "10",
                    "9"
                ],
                correctAnswerIndex: 3,
                explanation: "最大値は23、最小値は14なので、範囲は23-14=9です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】4/7 × 21/16 = ＿＿。答えを最も簡単な分数で書きましょう。",
                answer: "3/4",
                acceptableAnswers: ["３／４", "3／4", "4分の3"],
                explanation: "4/7×21/16=84/112=3/4です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】yがxに比例し、y=4.5×xで表されます。xが8のとき、yは＿＿です。",
                answer: "36",
                acceptableAnswers: ["３６"],
                explanation: "y=4.5×8=36です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】1.65kmの道のりを11分で進む速さは、分速＿＿mです。",
                answer: "150",
                acceptableAnswers: ["１５０"],
                explanation: "1.65km=1,650mなので、1,650÷11=150より、分速150mです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】直径18cmの円の面積は＿＿平方センチメートルです。（円周率を3.14とする）",
                answer: "254.34",
                acceptableAnswers: ["２５４．３４"],
                explanation: "半径は18÷2=9cmです。9×9×3.14=254.34より、面積は254.34平方センチメートルです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】底面が底辺12cm、高さ5cmの三角形で、柱の高さが14cmの三角柱の体積は＿＿立方センチメートルです。",
                answer: "420",
                acceptableAnswers: ["４２０"],
                explanation: "底面積は12×5÷2=30平方センチメートルです。30×14=420より、体積は420立方センチメートルです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】5回のテストの平均が18点でした。4回分の得点が14点、17点、20点、21点のとき、残り1回の得点は＿＿点です。",
                answer: "18",
                acceptableAnswers: ["１８"],
                explanation: "5回分の合計は18×5=90点です。分かっている4回分は14+17+20+21=72点なので、残りは90-72=18点です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】1.5：2.1を最も簡単な整数の比にする手順を、正しい順に並べましょう。",
                choices: [
                    "15と21の最大公約数3を見つける",
                    "5：7と答える",
                    "1.5：2.1の両方を10倍して15：21にする",
                    "15と21をそれぞれ3で割り、5と7を求める"
                ],
                orderedChoices: [
                    "1.5：2.1の両方を10倍して15：21にする",
                    "15と21の最大公約数3を見つける",
                    "15と21をそれぞれ3で割り、5と7を求める",
                    "5：7と答える"
                ],
                explanation: "1.5：2.1を10倍して15：21にし、両方を最大公約数3で割ると5：7です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】6冊の異なる本から2冊を選び、左と右に1冊ずつ並べる方法が何通りあるか求める手順を、正しい順に並べましょう。",
                choices: [
                    "右に置く本は、残りの5冊から選ぶ",
                    "6×5=30を計算する",
                    "左に置く本は6冊から選ぶ",
                    "30通りと答える"
                ],
                orderedChoices: [
                    "左に置く本は6冊から選ぶ",
                    "右に置く本は、残りの5冊から選ぶ",
                    "6×5=30を計算する",
                    "30通りと答える"
                ],
                explanation: "左に置く本は6通り、そのそれぞれについて右に置く本は5通りなので、6×5=30通りです。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】2点が3人、4点が2人、6点が1人のとき、平均点を求める手順を、正しい順に並べましょう。",
                choices: [
                    "次に、2×3+4×2+6×1=20で得点の合計を求める",
                    "20÷6=10/3を計算する",
                    "3と1/3点と答える",
                    "最初に、3+2+1=6で人数の合計を求める"
                ],
                orderedChoices: [
                    "最初に、3+2+1=6で人数の合計を求める",
                    "次に、2×3+4×2+6×1=20で得点の合計を求める",
                    "20÷6=10/3を計算する",
                    "3と1/3点と答える"
                ],
                explanation: "人数は6人、得点の合計は20点です。20÷6=10/3なので、平均は3と1/3点です。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】正多角形などの図形と、対称の軸の本数を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "正七角形", match: "7本"),
                    QuizMatchingPair(prompt: "正十一角形", match: "11本"),
                    QuizMatchingPair(prompt: "正十二角形", match: "12本"),
                    QuizMatchingPair(prompt: "長方形でもひし形でもない平行四辺形", match: "0本")
                ],
                choices: [
                    "11本",
                    "0本",
                    "7本",
                    "12本"
                ],
                explanation: "正七角形は7本、正十一角形は11本、正十二角形は12本の対称の軸があります。長方形でもひし形でもない平行四辺形には対称の軸がありません。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】柱の底面や体積を見て、高さを正しく組み合わせましょう。円周率は3.14とします。",
                pairs: [
                    QuizMatchingPair(prompt: "底面積36平方センチメートル、体積432立方センチメートルの柱", match: "12cm"),
                    QuizMatchingPair(prompt: "底面積28平方センチメートル、体積252立方センチメートルの柱", match: "9cm"),
                    QuizMatchingPair(prompt: "半径3cm、体積282.6立方センチメートルの円柱", match: "10cm"),
                    QuizMatchingPair(prompt: "底面積45平方センチメートル、体積315立方センチメートルの柱", match: "7cm")
                ],
                choices: [
                    "10cm",
                    "7cm",
                    "12cm",
                    "9cm"
                ],
                explanation: "高さは体積÷底面積で求めます。432÷36=12、252÷28=9、282.6÷(3×3×3.14)=10、315÷45=7なので、それぞれ12cm、9cm、10cm、7cmです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】3つの容器に入っている水の量の合計を、帯分数で答えましょう。",
                answer: "2と17/60",
                acceptableAnswers: ["2 17/60", "２と１７／６０", "2と17／60", "2と60分の17"],
                referenceTitle: "容器に入っている水の量",
                referenceRows: [
                    QuizReferenceRow(label: "容器A", value: "5/6L"),
                    QuizReferenceRow(label: "容器B", value: "7/10L"),
                    QuizReferenceRow(label: "容器C", value: "3/4L")
                ],
                explanation: "5/6+7/10+3/4=50/60+42/60+45/60=137/60なので、合計は2と17/60Lです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】xとyが比例しています。yが57.5のときのxを答えましょう。",
                answer: "23",
                acceptableAnswers: ["２３"],
                referenceTitle: "xとyの対応",
                referenceRows: [
                    QuizReferenceRow(label: "対応1", value: "x=6、y=15"),
                    QuizReferenceRow(label: "対応2", value: "x=14、y=35"),
                    QuizReferenceRow(label: "求める対応", value: "x=?、y=57.5")
                ],
                explanation: "15÷6=2.5、35÷14=2.5なので、y=2.5×xです。57.5÷2.5=23より、xは23です。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】正方形から、その内側にぴったり入る円を切り取ります。残った部分の面積を平方センチメートルで答えましょう。（円周率を3.14とする）",
                answer: "86",
                acceptableAnswers: ["８６"],
                referenceTitle: "正方形と円の大きさ",
                referenceRows: [
                    QuizReferenceRow(label: "正方形の一辺", value: "20cm"),
                    QuizReferenceRow(label: "円の直径", value: "20cm")
                ],
                explanation: "正方形の面積は20×20=400平方センチメートル、円の面積は10×10×3.14=314平方センチメートルです。400-314=86より、残った部分の面積は86平方センチメートルです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】男子と女子から1人ずつ係を選びます。選べない1組を除くと、選び方は何通りですか？",
                answer: "19",
                acceptableAnswers: ["１９"],
                referenceTitle: "係の選び方の条件",
                referenceRows: [
                    QuizReferenceRow(label: "男子", value: "5人"),
                    QuizReferenceRow(label: "女子", value: "4人"),
                    QuizReferenceRow(label: "選べない組", value: "男子Aさんと女子Bさんの1組")
                ],
                explanation: "条件がなければ5×4=20通りです。選べない1組を除くので、20-1=19通りです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】5日間の最高気温の範囲は何度ですか？",
                answer: "7",
                acceptableAnswers: ["７"],
                referenceTitle: "5日間の最高気温",
                referenceRows: [
                    QuizReferenceRow(label: "月曜日", value: "18℃"),
                    QuizReferenceRow(label: "火曜日", value: "21℃"),
                    QuizReferenceRow(label: "水曜日", value: "17℃"),
                    QuizReferenceRow(label: "木曜日", value: "24℃"),
                    QuizReferenceRow(label: "金曜日", value: "20℃")
                ],
                explanation: "最大値は24℃、最小値は17℃なので、範囲は24-17=7℃です。"
            ),
            QuizQuestion(
                question: "5/9 + 7/12 はいくつですか？",
                choices: [
                    "31/36",
                    "41/72",
                    "1と1/36",
                    "1と5/36"
                ],
                correctAnswerIndex: 3,
                explanation: "5/9と7/12の分母を36にそろえると、20/36+21/36=41/36=1と5/36です。"
            ),

            QuizQuestion(
                question: "45：60を最も簡単な整数の比にすると、どれですか？",
                choices: [
                    "5：6",
                    "4：5",
                    "3：4",
                    "2：3"
                ],
                correctAnswerIndex: 2,
                explanation: "45と60を最大公約数15で割ると、45：60=3：4です。"
            ),

            QuizQuestion(
                question: "yがxに比例し、y=2.5×xで表されます。xが14のとき、yはいくつですか？",
                choices: [
                    "35",
                    "28",
                    "30",
                    "42"
                ],
                correctAnswerIndex: 0,
                explanation: "y=2.5×14=35です。"
            ),

            QuizQuestion(
                question: "2.1kmの道のりを14分で進みました。分速は何mですか？",
                choices: [
                    "120m",
                    "150m",
                    "160m",
                    "140m"
                ],
                correctAnswerIndex: 1,
                explanation: "2.1km=2,100mです。2,100÷14=150より、分速150mです。"
            ),

            QuizQuestion(
                question: "正五角形の対称の軸は何本ありますか？",
                choices: [
                    "4本",
                    "5本",
                    "6本",
                    "10本"
                ],
                correctAnswerIndex: 1,
                explanation: "正五角形では、各頂点と向かい側の辺の中点を通る対称の軸が1本ずつあり、全部で5本です。"
            ),

            QuizQuestion(
                question: "直径46cmの円の面積は何平方センチメートルですか？（円周率を3.14とする）",
                choices: [
                    "1,661.06平方センチメートル",
                    "1,444.74平方センチメートル",
                    "3,322.12平方センチメートル",
                    "529平方センチメートル"
                ],
                correctAnswerIndex: 0,
                explanation: "半径は46÷2=23cmです。23×23×3.14=1,661.06より、面積は1,661.06平方センチメートルです。"
            ),

            QuizQuestion(
                question: "底面が底辺7cm、高さ6cmの平行四辺形で、柱の高さが11cmの四角柱の体積は何立方センチメートルですか？",
                choices: [
                    "231立方センチメートル",
                    "462立方センチメートル",
                    "420立方センチメートル",
                    "924立方センチメートル"
                ],
                correctAnswerIndex: 1,
                explanation: "底面積は7×6=42平方センチメートルです。42×11=462より、体積は462立方センチメートルです。"
            ),

            QuizQuestion(
                question: "本が6種類、しおりが4種類あります。本としおりを1種類ずつ選ぶ組み合わせは何通りですか？",
                choices: [
                    "24通り",
                    "10通り",
                    "18通り",
                    "20通り"
                ],
                correctAnswerIndex: 0,
                explanation: "本の選び方6通りのそれぞれに、しおりの選び方が4通りあるので、6×4=24通りです。"
            ),

            QuizQuestion(
                question: "3と1/5 ÷ 1と3/5 はいくつですか？",
                choices: [
                    "2",
                    "5",
                    "1と3/5",
                    "2と1/5"
                ],
                correctAnswerIndex: 0,
                explanation: "3と1/5=16/5、1と3/5=8/5です。16/5÷8/5=16/5×5/8=2です。"
            ),

            QuizQuestion(
                question: "ジュースと水を2：5の比で混ぜ、全部で980mLにします。ジュースは何mL必要ですか？",
                choices: [
                    "392mL",
                    "700mL",
                    "140mL",
                    "280mL"
                ],
                correctAnswerIndex: 3,
                explanation: "比の合計は2+5=7です。980÷7=140、140×2=280より、ジュースは280mL必要です。"
            ),

            QuizQuestion(
                question: "yがxに反比例し、x=5のときy=18です。y=10のとき、xはいくつですか？",
                choices: [
                    "9",
                    "10",
                    "5",
                    "8"
                ],
                correctAnswerIndex: 0,
                explanation: "反比例ではx×yが一定です。5×18=90なので、y=10のときx=90÷10=9です。"
            ),

            QuizQuestion(
                question: "時速72kmで35分間進むと、道のりは何kmですか？",
                choices: [
                    "48km",
                    "35km",
                    "42km",
                    "40km"
                ],
                correctAnswerIndex: 2,
                explanation: "35分=35/60時間です。72×35/60=42より、道のりは42kmです。"
            ),

            QuizQuestion(
                question: "半径26cmの半円の面積は何平方センチメートルですか？（円周率を3.14とする）",
                choices: [
                    "530.66平方センチメートル",
                    "4,245.28平方センチメートル",
                    "2,122.64平方センチメートル",
                    "1,061.32平方センチメートル"
                ],
                correctAnswerIndex: 3,
                explanation: "円全体の面積は26×26×3.14=2,122.64平方センチメートルです。半円なので、2,122.64÷2=1,061.32平方センチメートルです。"
            ),

            QuizQuestion(
                question: "0、2、4、6の数字から異なる3つを使って3けたの整数を作ります。何通りできますか？",
                choices: [
                    "12通り",
                    "36通り",
                    "18通り",
                    "24通り"
                ],
                correctAnswerIndex: 2,
                explanation: "百の位は0以外の3通り、十の位は残りの3通り、一の位は残りの2通りです。3×3×2=18通りです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】11/15 - 2/9 = ＿＿。答えを最も簡単な分数で書きましょう。",
                answer: "23/45",
                acceptableAnswers: ["２３／４５", "23／45", "45分の23"],
                explanation: "11/15-2/9=33/45-10/45=23/45です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】yがxに比例し、x=12のときy=30です。x=18のとき、yは＿＿です。",
                answer: "45",
                acceptableAnswers: ["４５"],
                explanation: "30÷12=2.5なので、y=2.5×xです。x=18のとき、y=2.5×18=45です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】6.6kmの道のりを30分で進む速さは、分速＿＿mです。",
                answer: "220",
                acceptableAnswers: ["２２０"],
                explanation: "6.6km=6,600mなので、6,600÷30=220より、分速220mです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】点対称な図形は、対称の中心のまわりに＿＿度回転させると元の図形に重なります。",
                answer: "180",
                acceptableAnswers: ["１８０"],
                explanation: "点対称な図形は、対称の中心のまわりに180度回転させると元の図形に重なります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】底面が底辺9cm、高さ4cmの三角形で、柱の高さが13cmの三角柱の体積は＿＿立方センチメートルです。",
                answer: "234",
                acceptableAnswers: ["２３４"],
                explanation: "底面積は9×4÷2=18平方センチメートルです。18×13=234より、体積は234立方センチメートルです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】5回の記録が14、18、20、23、25でした。平均は＿＿です。",
                answer: "20",
                acceptableAnswers: ["２０"],
                explanation: "(14+18+20+23+25)÷5=100÷5=20より、平均は20です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】1と3/4 × 6/7を計算する手順を、正しい順に並べましょう。",
                choices: [
                    "42/28を約分して3/2にする",
                    "1と3/4を7/4に直す",
                    "3/2を1と1/2に直して答える",
                    "7/4×6/7=42/28を計算する"
                ],
                orderedChoices: [
                    "1と3/4を7/4に直す",
                    "7/4×6/7=42/28を計算する",
                    "42/28を約分して3/2にする",
                    "3/2を1と1/2に直して答える"
                ],
                explanation: "帯分数を仮分数に直して計算すると、7/4×6/7=42/28=3/2=1と1/2です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】540個のおはじきを4：5の比に分ける手順を、正しい順に並べましょう。",
                choices: [
                    "一方を240個、もう一方を300個と答える",
                    "540÷9=60を計算する",
                    "比の合計4+5=9を求める",
                    "60×4=240、60×5=300を計算する"
                ],
                orderedChoices: [
                    "比の合計4+5=9を求める",
                    "540÷9=60を計算する",
                    "60×4=240、60×5=300を計算する",
                    "一方を240個、もう一方を300個と答える"
                ],
                explanation: "比の合計9で540を割ると1に当たる数は60です。60×4=240、60×5=300なので、240個と300個に分けます。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】直径12cm、高さ9cmの円柱の体積を求める手順を、正しい順に並べましょう。（円周率を3.14とする）",
                choices: [
                    "113.04×9=1,017.36を計算する",
                    "直径12cmを2で割り、半径6cmを求める",
                    "1,017.36立方センチメートルと答える",
                    "6×6×3.14=113.04で底面積を求める"
                ],
                orderedChoices: [
                    "直径12cmを2で割り、半径6cmを求める",
                    "6×6×3.14=113.04で底面積を求める",
                    "113.04×9=1,017.36を計算する",
                    "1,017.36立方センチメートルと答える"
                ],
                explanation: "半径は6cm、底面積は6×6×3.14=113.04平方センチメートルです。113.04×9=1,017.36より、体積は1,017.36立方センチメートルです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】式と、指定されたxに対応するyの値を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "y=4×x、x=7", match: "28"),
                    QuizMatchingPair(prompt: "y=54÷x、x=9", match: "6"),
                    QuizMatchingPair(prompt: "y=1.5×x、x=8", match: "12"),
                    QuizMatchingPair(prompt: "y=80÷x、x=16", match: "5")
                ],
                choices: [
                    "12",
                    "5",
                    "28",
                    "6"
                ],
                explanation: "4×7=28、54÷9=6、1.5×8=12、80÷16=5です。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】立体と体積を正しく組み合わせましょう。円周率は3.14とします。",
                pairs: [
                    QuizMatchingPair(prompt: "一辺6cmの立方体", match: "216立方センチメートル"),
                    QuizMatchingPair(prompt: "縦8cm、横7cm、高さ5cmの直方体", match: "280立方センチメートル"),
                    QuizMatchingPair(prompt: "底面が底辺10cm、高さ6cmの三角形で、柱の高さが7cmの三角柱", match: "210立方センチメートル"),
                    QuizMatchingPair(prompt: "半径4cm、高さ5cmの円柱", match: "251.2立方センチメートル")
                ],
                choices: [
                    "251.2立方センチメートル",
                    "210立方センチメートル",
                    "216立方センチメートル",
                    "280立方センチメートル"
                ],
                explanation: "立方体は6×6×6=216、直方体は8×7×5=280、三角柱は10×6÷2×7=210、円柱は4×4×3.14×5=251.2立方センチメートルです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】線対称な図形で、点Pと点P'は対称の軸に対して対応しています。PP'の長さをcmで答えましょう。",
                answer: "13",
                acceptableAnswers: ["１３"],
                referenceTitle: "点と対称の軸までの距離",
                referenceRows: [
                    QuizReferenceRow(label: "点Pから対称の軸まで", value: "6.5cm"),
                    QuizReferenceRow(label: "点P'から対称の軸まで", value: "6.5cm")
                ],
                explanation: "対称の軸はPP'を二等分するので、PP'=6.5+6.5=13cmです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】青い玉と黄色い玉の個数の比を、最も簡単な整数の比で答えましょう。",
                answer: "2：3",
                acceptableAnswers: ["2:3", "２：３"],
                referenceTitle: "玉の個数",
                referenceRows: [
                    QuizReferenceRow(label: "青い玉", value: "24個"),
                    QuizReferenceRow(label: "黄色い玉", value: "36個")
                ],
                explanation: "24：36の両方を12で割ると、2：3です。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】同じ道を往復したときの平均の速さを、時速何kmかで答えましょう。休憩時間はありません。",
                answer: "40",
                acceptableAnswers: ["４０"],
                referenceTitle: "往復の記録",
                referenceRows: [
                    QuizReferenceRow(label: "行き", value: "18kmを30分"),
                    QuizReferenceRow(label: "帰り", value: "18kmを24分")
                ],
                explanation: "往復の道のりは36km、時間は54分=0.9時間です。36÷0.9=40より、平均の速さは時速40kmです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】円柱の容器の体積をLで答えましょう。（円周率を3.14とする）",
                answer: "1.57",
                acceptableAnswers: ["１．５７"],
                referenceTitle: "円柱の容器",
                referenceRows: [
                    QuizReferenceRow(label: "底面の直径", value: "10cm"),
                    QuizReferenceRow(label: "高さ", value: "20cm"),
                    QuizReferenceRow(label: "体積の換算", value: "1,000立方センチメートル=1L")
                ],
                explanation: "半径は5cmです。5×5×3.14×20=1,570立方センチメートルなので、1.57Lです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】4人の中から、委員長と記録係を1人ずつ選びます。同じ人が2つの係を兼ねないとき、選び方は何通りですか？",
                answer: "12",
                acceptableAnswers: ["１２"],
                referenceTitle: "係の選び方",
                referenceRows: [
                    QuizReferenceRow(label: "委員長の選び方", value: "4通り"),
                    QuizReferenceRow(label: "記録係の選び方", value: "委員長以外の3通り")
                ],
                explanation: "委員長は4通り、そのそれぞれについて記録係は3通りなので、4×3=12通りです。"
            ),
            QuizQuestion(
                question: "7/12 ÷ 5/18 はいくつですか？",
                choices: [
                    "35/216",
                    "1と1/10",
                    "7/30",
                    "2と1/10"
                ],
                correctAnswerIndex: 3,
                explanation: "7/12÷5/18=7/12×18/5=126/60=21/10=2と1/10です。"
            ),

            QuizQuestion(
                question: "28：42を最も簡単な整数の比にすると、どれですか？",
                choices: [
                    "2：3",
                    "4：7",
                    "5：7",
                    "3：4"
                ],
                correctAnswerIndex: 0,
                explanation: "28と42を最大公約数14で割ると、28：42=2：3です。"
            ),

            QuizQuestion(
                question: "yがxに比例し、y=5×xで表されます。xが9のとき、yはいくつですか？",
                choices: [
                    "50",
                    "45",
                    "40",
                    "14"
                ],
                correctAnswerIndex: 1,
                explanation: "y=5×9=45です。"
            ),

            QuizQuestion(
                question: "420mの道のりを70秒で走りました。秒速は何mですか？",
                choices: [
                    "5m",
                    "4m",
                    "6m",
                    "7m"
                ],
                correctAnswerIndex: 2,
                explanation: "速さは道のり÷時間なので、420÷70=6より、秒速6mです。"
            ),

            QuizQuestion(
                question: "正六角形の対称の軸は何本ありますか？",
                choices: [
                    "6本",
                    "12本",
                    "3本",
                    "4本"
                ],
                correctAnswerIndex: 0,
                explanation: "正六角形には、向かい合う頂点を通る軸が3本、向かい合う辺の中点を通る軸が3本あり、合わせて6本です。"
            ),

            QuizQuestion(
                question: "直径42cmの円の面積は何平方センチメートルですか？（円周率を3.14とする）",
                choices: [
                    "1,384.74平方センチメートル",
                    "2,769.48平方センチメートル",
                    "5,538.96平方センチメートル",
                    "659.4平方センチメートル"
                ],
                correctAnswerIndex: 0,
                explanation: "半径は42÷2=21cmです。21×21×3.14=1,384.74より、面積は1,384.74平方センチメートルです。"
            ),

            QuizQuestion(
                question: "底面が上底4cm、下底8cm、高さ5cmの台形で、柱の高さが9cmの四角柱の体積は何立方センチメートルですか？",
                choices: [
                    "135立方センチメートル",
                    "540立方センチメートル",
                    "180立方センチメートル",
                    "270立方センチメートル"
                ],
                correctAnswerIndex: 3,
                explanation: "底面積は(4+8)×5÷2=30平方センチメートルです。30×9=270より、体積は270立方センチメートルです。"
            ),

            QuizQuestion(
                question: "アイスの味が4種類、トッピングが3種類あります。味とトッピングを1種類ずつ選ぶ組み合わせは何通りですか？",
                choices: [
                    "7通り",
                    "12通り",
                    "10通り",
                    "8通り"
                ],
                correctAnswerIndex: 1,
                explanation: "味の選び方4通りのそれぞれに、トッピングの選び方が3通りあるので、4×3=12通りです。"
            ),

            QuizQuestion(
                question: "2と1/4 × 8/15 はいくつですか？",
                choices: [
                    "2と2/5",
                    "1と1/3",
                    "1と7/15",
                    "1と1/5"
                ],
                correctAnswerIndex: 3,
                explanation: "2と1/4を9/4に直すと、9/4×8/15=72/60=6/5=1と1/5です。"
            ),

            QuizQuestion(
                question: "赤い玉と白い玉の個数の比が5：7で、全部で72個あります。赤い玉は何個ですか？",
                choices: [
                    "42個",
                    "30個",
                    "35個",
                    "24個"
                ],
                correctAnswerIndex: 1,
                explanation: "比の合計は5+7=12です。72÷12=6、6×5=30より、赤い玉は30個です。"
            ),

            QuizQuestion(
                question: "yがxに反比例し、x=9のときy=8です。x=12のとき、yはいくつですか？",
                choices: [
                    "5",
                    "8",
                    "4",
                    "6"
                ],
                correctAnswerIndex: 3,
                explanation: "反比例ではx×yが一定です。9×8=72なので、x=12のときy=72÷12=6です。"
            ),

            QuizQuestion(
                question: "3.6kmの道のりを24分で進みました。分速は何mですか？",
                choices: [
                    "120m",
                    "135m",
                    "150m",
                    "180m"
                ],
                correctAnswerIndex: 2,
                explanation: "3.6km=3,600mです。3,600÷24=150より、分速150mです。"
            ),

            QuizQuestion(
                question: "半径10cmの円の4分の3の面積は何平方センチメートルですか？（円周率を3.14とする）",
                choices: [
                    "471平方センチメートル",
                    "78.5平方センチメートル",
                    "314平方センチメートル",
                    "235.5平方センチメートル"
                ],
                correctAnswerIndex: 3,
                explanation: "円全体の面積は10×10×3.14=314平方センチメートルです。その4分の3なので、314×3÷4=235.5平方センチメートルです。"
            ),

            QuizQuestion(
                question: "5人の中から、異なる2人の代表を選びます。選び方は何通りですか？",
                choices: [
                    "25通り",
                    "20通り",
                    "10通り",
                    "5通り"
                ],
                correctAnswerIndex: 2,
                explanation: "1人目と2人目を順に選ぶと5×4=20通りですが、同じ2人を選ぶ順番を2回ずつ数えているので、20÷2=10通りです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】7/8 ÷ 14/15 = ＿＿。答えを最も簡単な分数で書きましょう。",
                answer: "15/16",
                acceptableAnswers: ["１５／１６", "15／16", "16分の15"],
                explanation: "7/8÷14/15=7/8×15/14=105/112=15/16です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】3.6：4.8を最も簡単な整数の比にすると、＿＿です。",
                answer: "3：4",
                acceptableAnswers: ["3:4", "３：４"],
                explanation: "3.6：4.8の両方を1.2で割ると、3：4です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】yがxに比例し、y=7×xで表されます。xが6のとき、yは＿＿です。",
                answer: "42",
                acceptableAnswers: ["４２"],
                explanation: "y=7×6=42です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】900mの道のりを5分で進む速さは、分速＿＿mです。",
                answer: "180",
                acceptableAnswers: ["１８０"],
                explanation: "900÷5=180より、分速180mです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】線対称な図形で、対応する2点を結ぶ線分は、対称の軸によって＿＿されます。",
                answer: "垂直に二等分",
                acceptableAnswers: ["垂直二等分", "垂直に二等"],
                explanation: "線対称な図形では、対称の軸が対応する2点を結ぶ線分を垂直に二等分します。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】底面が一辺7cmの正方形で、高さが12cmの四角柱の体積は＿＿立方センチメートルです。",
                answer: "588",
                acceptableAnswers: ["５８８"],
                explanation: "底面積は7×7=49平方センチメートルです。49×12=588より、体積は588立方センチメートルです。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】半径12cmの円の4分の1の面積を求める手順を、正しい順に並べましょう。（円周率を3.14とする）",
                choices: [
                    "452.16÷4=113.04を計算する",
                    "12×12×3.14を計算する",
                    "113.04平方センチメートルと答える",
                    "円全体の面積が452.16平方センチメートルだと分かる"
                ],
                orderedChoices: [
                    "12×12×3.14を計算する",
                    "円全体の面積が452.16平方センチメートルだと分かる",
                    "452.16÷4=113.04を計算する",
                    "113.04平方センチメートルと答える"
                ],
                explanation: "円全体の面積12×12×3.14=452.16を求め、4で割ると113.04平方センチメートルです。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】5/6 ÷ 10/9を計算する手順を、正しい順に並べましょう。",
                choices: [
                    "5/6×9/10を計算する",
                    "3/4と答える",
                    "10/9の逆数9/10をかける式に直す",
                    "45/60を約分する"
                ],
                orderedChoices: [
                    "10/9の逆数9/10をかける式に直す",
                    "5/6×9/10を計算する",
                    "45/60を約分する",
                    "3/4と答える"
                ],
                explanation: "割る数10/9の逆数9/10をかけ、5/6×9/10=45/60を約分すると3/4です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】時速48kmで2時間15分進む道のりを求める手順を、正しい順に並べましょう。",
                choices: [
                    "48×2.25=108を計算する",
                    "2時間15分を2.25時間に直す",
                    "108kmと答える",
                    "道のり=速さ×時間にあてはめる"
                ],
                orderedChoices: [
                    "2時間15分を2.25時間に直す",
                    "道のり=速さ×時間にあてはめる",
                    "48×2.25=108を計算する",
                    "108kmと答える"
                ],
                explanation: "2時間15分を2.25時間に直し、48×2.25=108と計算するので、道のりは108kmです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】図形と対称の軸の本数を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "二等辺三角形", match: "1本"),
                    QuizMatchingPair(prompt: "長方形", match: "2本"),
                    QuizMatchingPair(prompt: "正三角形", match: "3本"),
                    QuizMatchingPair(prompt: "正方形", match: "4本")
                ],
                choices: [
                    "3本",
                    "1本",
                    "4本",
                    "2本"
                ],
                explanation: "二等辺三角形は1本、長方形は2本、正三角形は3本、正方形は4本の対称の軸があります。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】比と、最も簡単な整数の比を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "12：18", match: "2：3"),
                    QuizMatchingPair(prompt: "20：35", match: "4：7"),
                    QuizMatchingPair(prompt: "45：30", match: "3：2"),
                    QuizMatchingPair(prompt: "16：64", match: "1：4")
                ],
                choices: [
                    "1：4",
                    "3：2",
                    "2：3",
                    "4：7"
                ],
                explanation: "12：18=2：3、20：35=4：7、45：30=3：2、16：64=1：4です。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】xとyが反比例しています。xが8のときのyを答えましょう。",
                answer: "18",
                acceptableAnswers: ["１８"],
                referenceTitle: "xとyの対応",
                referenceRows: [
                    QuizReferenceRow(label: "対応1", value: "x=6、y=24"),
                    QuizReferenceRow(label: "対応2", value: "x=12、y=12"),
                    QuizReferenceRow(label: "求める対応", value: "x=8、y=?")
                ],
                explanation: "反比例なのでx×yは一定です。6×24=144より、x=8のときy=144÷8=18です。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】2つの円形の花だんの面積の差を平方センチメートルで答えましょう。（円周率を3.14とする）",
                answer: "200.96",
                acceptableAnswers: ["２００．９６"],
                referenceTitle: "円形の花だん",
                referenceRows: [
                    QuizReferenceRow(label: "大きい花だん", value: "直径20cm"),
                    QuizReferenceRow(label: "小さい花だん", value: "直径12cm")
                ],
                explanation: "半径はそれぞれ10cmと6cmです。面積の差は(10×10-6×6)×3.14=64×3.14=200.96平方センチメートルです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】水そうに入っている水の体積は何Lですか？",
                answer: "60",
                acceptableAnswers: ["６０"],
                referenceTitle: "直方体の水そう",
                referenceRows: [
                    QuizReferenceRow(label: "底面の縦", value: "50cm"),
                    QuizReferenceRow(label: "底面の横", value: "40cm"),
                    QuizReferenceRow(label: "水の深さ", value: "30cm"),
                    QuizReferenceRow(label: "体積の換算", value: "1,000立方センチメートル=1L")
                ],
                explanation: "水の体積は50×40×30=60,000立方センチメートルです。60,000÷1,000=60より、60Lです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】5種類のカードから異なる3枚を選び、左から順に並べます。並べ方は何通りですか？",
                answer: "60",
                acceptableAnswers: ["６０"],
                referenceTitle: "カードの並べ方",
                referenceRows: [
                    QuizReferenceRow(label: "1番目の選び方", value: "5通り"),
                    QuizReferenceRow(label: "2番目の選び方", value: "残り4通り"),
                    QuizReferenceRow(label: "3番目の選び方", value: "残り3通り")
                ],
                explanation: "1番目は5通り、2番目は4通り、3番目は3通りなので、5×4×3=60通りです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】点対称な図形について、OAの長さとBB'の長さの合計をcmで答えましょう。Oは対称の中心、A'とB'はそれぞれAとBに対応する点です。",
                answer: "21.8",
                acceptableAnswers: ["２１．８"],
                referenceTitle: "点対称な図形の長さ",
                referenceRows: [
                    QuizReferenceRow(label: "AA'の長さ", value: "18cm"),
                    QuizReferenceRow(label: "OBの長さ", value: "6.4cm")
                ],
                explanation: "対称の中心OはAA'とBB'をそれぞれ二等分します。OA=18÷2=9cm、BB'=6.4×2=12.8cmなので、合計は9+12.8=21.8cmです。"
            ),
            QuizQuestion(
                question: "2/3 × 9/10 はいくつですか？",
                choices: [
                    "3/5",
                    "6/13",
                    "3/10",
                    "5/6"
                ],
                correctAnswerIndex: 0,
                explanation: "2/3 × 9/10 = 18/30 = 3/5です。"
            ),

            QuizQuestion(
                question: "18：24を最も簡単な整数の比にすると、どれですか？",
                choices: [
                    "6：8",
                    "2：3",
                    "3：4",
                    "4：5"
                ],
                correctAnswerIndex: 2,
                explanation: "18と24を最大公約数6で割ると、18：24 = 3：4です。"
            ),

            QuizQuestion(
                question: "yがxに比例し、y = 3 × xで表されます。xが7のとき、yはいくつですか？",
                choices: [
                    "18",
                    "24",
                    "10",
                    "21"
                ],
                correctAnswerIndex: 3,
                explanation: "y = 3 × 7 = 21です。"
            ),

            QuizQuestion(
                question: "180mの道のりを30秒で走りました。秒速は何mですか？",
                choices: [
                    "5m",
                    "6m",
                    "3m",
                    "9m"
                ],
                correctAnswerIndex: 1,
                explanation: "速さは道のり÷時間なので、180÷30=6より、秒速6mです。"
            ),

            QuizQuestion(
                question: "次の図形のうち、線対称ではあるが点対称ではないものはどれですか？",
                choices: [
                    "二等辺三角形",
                    "正方形",
                    "長方形でもひし形でもない平行四辺形",
                    "不等辺三角形"
                ],
                correctAnswerIndex: 0,
                explanation: "二等辺三角形には対称の軸がありますが、180度回転して重なる点対称な図形ではありません。"
            ),

            QuizQuestion(
                question: "直径34cmの円の面積は何平方センチメートルですか？（円周率を3.14とする）",
                choices: [
                    "853.52平方センチメートル",
                    "907.46平方センチメートル",
                    "1,814.92平方センチメートル",
                    "3,629.84平方センチメートル"
                ],
                correctAnswerIndex: 1,
                explanation: "半径は34÷2=17cmです。17×17×3.14=907.46より、面積は907.46平方センチメートルです。"
            ),

            QuizQuestion(
                question: "底面が底辺6cm、高さ8cmの三角形で、柱の高さが10cmの三角柱の体積は何立方センチメートルですか？",
                choices: [
                    "480立方センチメートル",
                    "240立方センチメートル",
                    "120立方センチメートル",
                    "180立方センチメートル"
                ],
                correctAnswerIndex: 1,
                explanation: "底面積は6×8÷2=24平方センチメートルです。24×10=240より、体積は240立方センチメートルです。"
            ),

            QuizQuestion(
                question: "シャツが3種類、ズボンが2種類あります。シャツとズボンを1種類ずつ選ぶ組み合わせは何通りですか？",
                choices: [
                    "3通り",
                    "4通り",
                    "6通り",
                    "5通り"
                ],
                correctAnswerIndex: 2,
                explanation: "シャツ1種類につきズボンの選び方が2通りあるので、3×2=6通りです。"
            ),

            QuizQuestion(
                question: "1と1/2 ÷ 3/5 はいくつですか？",
                choices: [
                    "1と4/5",
                    "2と1/2",
                    "1と1/10",
                    "3と1/2"
                ],
                correctAnswerIndex: 1,
                explanation: "1と1/2を3/2に直すと、3/2 ÷ 3/5 = 3/2 × 5/3 = 5/2 = 2と1/2です。"
            ),

            QuizQuestion(
                question: "840円を3：4の比に分けます。少ない方はいくらですか？",
                choices: [
                    "360円",
                    "320円",
                    "480円",
                    "420円"
                ],
                correctAnswerIndex: 0,
                explanation: "比の合計は3+4=7です。840÷7=120、120×3=360より、少ない方は360円です。"
            ),

            QuizQuestion(
                question: "yがxに反比例し、x=6のときy=8です。x=12のとき、yはいくつですか？",
                choices: [
                    "3",
                    "4",
                    "6",
                    "2"
                ],
                correctAnswerIndex: 1,
                explanation: "反比例ではx×yが一定です。6×8=48なので、x=12のときy=48÷12=4です。"
            ),

            QuizQuestion(
                question: "1.2kmの道のりを8分で進みました。分速は何mですか？",
                choices: [
                    "120m",
                    "960m",
                    "96m",
                    "150m"
                ],
                correctAnswerIndex: 3,
                explanation: "1.2km=1,200mです。1,200÷8=150より、分速150mです。"
            ),

            QuizQuestion(
                question: "半径8cmの円から、同じ中心をもつ半径5cmの円を切り取った残りの面積は何平方センチメートルですか？（円周率を3.14とする）",
                choices: [
                    "39平方センチメートル",
                    "200.96平方センチメートル",
                    "122.46平方センチメートル",
                    "279.46平方センチメートル"
                ],
                correctAnswerIndex: 2,
                explanation: "残りの面積は、(8×8-5×5)×3.14=39×3.14=122.46平方センチメートルです。"
            ),

            QuizQuestion(
                question: "1、2、3、4の数字から異なる2つを使って2けたの偶数を作ります。何通りできますか？",
                choices: [
                    "4通り",
                    "12通り",
                    "8通り",
                    "6通り"
                ],
                correctAnswerIndex: 3,
                explanation: "一の位は2または4の2通りです。それぞれ十の位は残りの3通りなので、2×3=6通りです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】5/6 - 1/4 = ＿＿。答えを最も簡単な分数で書きましょう。",
                answer: "7/12",
                acceptableAnswers: ["７／１２", "7／12", "12分の7"],
                explanation: "5/6 - 1/4 = 10/12 - 3/12 = 7/12です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】yがxに反比例し、y = 24 ÷ xで表されます。xが8のとき、yは＿＿です。",
                answer: "3",
                acceptableAnswers: ["３"],
                explanation: "y = 24 ÷ 8 = 3です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】2.4kmの道のりを12分で進む速さは、分速＿＿mです。",
                answer: "200",
                acceptableAnswers: ["２００"],
                explanation: "2.4km=2,400mなので、2,400÷12=200より、分速200mです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】点対称な図形で、対応する2点を結ぶ線分は、対称の中心で＿＿されます。",
                answer: "二等分",
                acceptableAnswers: ["2等分", "二等"],
                explanation: "点対称な図形では、対応する2点を結ぶ線分は対称の中心で二等分されます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】半径3cm、高さ8cmの円柱の体積は＿＿立方センチメートルです。（円周率を3.14とする）",
                answer: "226.08",
                acceptableAnswers: ["２２６．０８"],
                explanation: "3×3×3.14×8=226.08より、体積は226.08立方センチメートルです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】4日間に読んだ本の冊数が12冊、15冊、18冊、15冊でした。1日平均は＿＿冊です。",
                answer: "15",
                acceptableAnswers: ["１５"],
                explanation: "(12+15+18+15)÷4=60÷4=15より、1日平均は15冊です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】42：56を最も簡単な整数の比にする手順を、正しい順に並べましょう。",
                choices: [
                    "42と56をそれぞれ14で割る",
                    "比を3：4と表す",
                    "42と56の最大公約数14を見つける",
                    "3と4になる"
                ],
                orderedChoices: [
                    "42と56の最大公約数14を見つける",
                    "42と56をそれぞれ14で割る",
                    "3と4になる",
                    "比を3：4と表す"
                ],
                explanation: "最大公約数14を見つけ、両方を14で割ると3と4になり、比は3：4です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】直径38cmの円の面積を求める手順を、正しい順に並べましょう。（円周率を3.14とする）",
                choices: [
                    "361×3.14を計算する",
                    "直径38cmを2で割り、半径19cmを求める",
                    "1,133.54平方センチメートルと答える",
                    "19×19=361を計算する"
                ],
                orderedChoices: [
                    "直径38cmを2で割り、半径19cmを求める",
                    "19×19=361を計算する",
                    "361×3.14を計算する",
                    "1,133.54平方センチメートルと答える"
                ],
                explanation: "半径19cmを求め、19×19=361、361×3.14=1,133.54と計算するので、面積は1,133.54平方センチメートルです。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】1.8kmの道のりを12分で進む速さを、分速何mかで求める手順を正しい順に並べましょう。",
                choices: [
                    "1,800÷12=150を計算する",
                    "分速150mと答える",
                    "1.8kmを1,800mに直す",
                    "速さ=道のり÷時間にあてはめ、1,800÷12とする"
                ],
                orderedChoices: [
                    "1.8kmを1,800mに直す",
                    "速さ=道のり÷時間にあてはめ、1,800÷12とする",
                    "1,800÷12=150を計算する",
                    "分速150mと答える"
                ],
                explanation: "1.8kmを1,800mに直し、速さ=道のり÷時間にあてはめて1,800÷12=150と計算するので、分速150mです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】図形と対称の性質を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "正方形", match: "線対称でも点対称でもある"),
                    QuizMatchingPair(prompt: "正三角形", match: "線対称だが点対称ではない"),
                    QuizMatchingPair(prompt: "長方形でもひし形でもない平行四辺形", match: "点対称だが線対称ではない"),
                    QuizMatchingPair(prompt: "不等辺三角形", match: "線対称でも点対称でもない")
                ],
                choices: [
                    "点対称だが線対称ではない",
                    "線対称でも点対称でもない",
                    "線対称でも点対称でもある",
                    "線対称だが点対称ではない"
                ],
                explanation: "正方形は線対称・点対称の両方、正三角形は線対称のみ、長方形でもひし形でもない平行四辺形は点対称のみ、不等辺三角形はどちらでもありません。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】立体と体積を正しく組み合わせましょう。円周率は3.14とします。",
                pairs: [
                    QuizMatchingPair(prompt: "縦11cm、横4cm、高さ3cmの直方体", match: "132立方センチメートル"),
                    QuizMatchingPair(prompt: "一辺5cmの立方体", match: "125立方センチメートル"),
                    QuizMatchingPair(prompt: "底面が底辺6cm、高さ4cmの三角形で、柱の高さが8cmの三角柱", match: "96立方センチメートル"),
                    QuizMatchingPair(prompt: "半径2cm、高さ10cmの円柱", match: "125.6立方センチメートル")
                ],
                choices: [
                    "96立方センチメートル",
                    "125.6立方センチメートル",
                    "132立方センチメートル",
                    "125立方センチメートル"
                ],
                explanation: "直方体は11×4×3=132、立方体は5×5×5=125、三角柱は6×4÷2×8=96、円柱は2×2×3.14×10=125.6立方センチメートルです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】4人の得点を比べ、最も高い人を答えましょう。",
                answer: "Bさん",
                acceptableAnswers: ["B"],
                referenceTitle: "算数テストの得点",
                referenceRows: [
                    QuizReferenceRow(label: "Aさん", value: "72点"),
                    QuizReferenceRow(label: "Bさん", value: "88点"),
                    QuizReferenceRow(label: "Cさん", value: "81点"),
                    QuizReferenceRow(label: "Dさん", value: "76点")
                ],
                explanation: "最も高い得点は88点なので、答えはBさんです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】5日間に読んだページ数の平均は何ページですか？",
                answer: "22",
                acceptableAnswers: ["２２"],
                referenceTitle: "1日に読んだページ数",
                referenceRows: [
                    QuizReferenceRow(label: "月曜日", value: "18ページ"),
                    QuizReferenceRow(label: "火曜日", value: "24ページ"),
                    QuizReferenceRow(label: "水曜日", value: "21ページ"),
                    QuizReferenceRow(label: "木曜日", value: "27ページ"),
                    QuizReferenceRow(label: "金曜日", value: "20ページ")
                ],
                explanation: "(18+24+21+27+20)÷5=110÷5=22より、平均は22ページです。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】記録を小さい順に見たときの中央値を答えましょう。",
                answer: "16",
                acceptableAnswers: ["１６"],
                referenceTitle: "6回の記録",
                referenceRows: [
                    QuizReferenceRow(label: "1番目", value: "11"),
                    QuizReferenceRow(label: "2番目", value: "13"),
                    QuizReferenceRow(label: "3番目", value: "15"),
                    QuizReferenceRow(label: "4番目", value: "17"),
                    QuizReferenceRow(label: "5番目", value: "24"),
                    QuizReferenceRow(label: "6番目", value: "30")
                ],
                explanation: "資料は小さい順に並んでいます。中央の15と17の平均は(15+17)÷2=16なので、中央値は16です。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】xとyが比例しています。yが52のときのxを答えましょう。",
                answer: "13",
                acceptableAnswers: ["１３"],
                referenceTitle: "xとyの対応",
                referenceRows: [
                    QuizReferenceRow(label: "対応1", value: "x=3、y=12"),
                    QuizReferenceRow(label: "対応2", value: "x=8、y=32"),
                    QuizReferenceRow(label: "求める対応", value: "x=?、y=52")
                ],
                explanation: "12÷3=4、32÷8=4なので、y=4×xです。52÷4=13より、xは13です。"
            ),

            QuizQuestion.dataReading(
                question: "【資料の読み取り】A地点からB地点へ、C地点またはD地点を通って行きます。道の選び方は全部で何通りですか？",
                answer: "14",
                acceptableAnswers: ["１４"],
                referenceTitle: "地点どうしを結ぶ道の本数",
                referenceRows: [
                    QuizReferenceRow(label: "A地点からC地点", value: "2本"),
                    QuizReferenceRow(label: "C地点からB地点", value: "3本"),
                    QuizReferenceRow(label: "A地点からD地点", value: "4本"),
                    QuizReferenceRow(label: "D地点からB地点", value: "2本")
                ],
                explanation: "C地点を通る行き方は2×3=6通り、D地点を通る行き方は4×2=8通りです。6+8=14より、全部で14通りです。"
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
