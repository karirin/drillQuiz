//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Shakai1ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "次の中で、朝起きて最初にすることが多いのはどれですか？",
            choices: [
                "顔を洗う",
                "遊びに行く",
                "お昼ごはんを食べる",
                "寝る"
            ],
            correctAnswerIndex: 0,
            explanation: "朝起きたらまず「顔を洗う」ことが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、冬によく使う暖房器具はどれですか？",
            choices: [
                "こたつ",
                "扇風機",
                "うちわ",
                "プール"
            ],
            correctAnswerIndex: 0,
            explanation: "冬には「こたつ」を使って暖まります。"
        ),
        QuizQuestion(
            question: "次の中で、学校で書くために使うものはどれですか？",
            choices: [
                "鉛筆",
                "本",
                "消しゴム",
                "定規"
            ],
            correctAnswerIndex: 0,
            explanation: "学校では「鉛筆」を使って書きます。"
        ),
        QuizQuestion(
            question: "次の中で、夏に遊びに行く場所として人気があるのはどれですか？",
            choices: [
                "プール",
                "図書館",
                "教室",
                "体育館"
            ],
            correctAnswerIndex: 0,
            explanation: "夏には「プール」で遊ぶことが人気です。"
        ),
        QuizQuestion(
            question: "次の中で、お弁当を食べる時間をなんと言いますか？",
            choices: [
                "朝食",
                "昼食",
                "夕食",
                "間食"
            ],
            correctAnswerIndex: 1,
            explanation: "お弁当を食べる時間は「昼食」と言います。"
        ),
        QuizQuestion(
            question: "次の中で、学校に行くときに使うものはどれですか？",
            choices: [
                "ランドセル",
                "自転車",
                "布団",
                "こたつ"
            ],
            correctAnswerIndex: 0,
            explanation: "学校に行くときには「ランドセル」を使います。"
        ),
        QuizQuestion(
            question: "次の中で、食べ物を買うことができる場所はどこですか？",
            choices: [
                "図書館",
                "病院",
                "スーパー",
                "体育館"
            ],
            correctAnswerIndex: 2,
            explanation: "食べ物は「スーパー」で買うことができます。"
        ),
        QuizQuestion(
            question: "次の中で、寒い日に使うことが多いものはどれですか？",
            choices: [
                "うちわ",
                "毛布",
                "扇風機",
                "サングラス"
            ],
            correctAnswerIndex: 1,
            explanation: "寒い日には「毛布」を使って暖まります。"
        ),
        QuizQuestion(
            question: "次の中で、学校で勉強するために使うものはどれですか？",
            choices: [
                "自転車",
                "テレビ",
                "教科書",
                "クッション"
            ],
            correctAnswerIndex: 2,
            explanation: "学校では「教科書」を使って勉強します。"
        ),
        QuizQuestion(
            question: "次の中で、朝目が覚めた後にすることが多いのはどれですか？",
            choices: [
                "寝る",
                "ごはんを食べる",
                "テレビを見る",
                "遊ぶ"
            ],
            correctAnswerIndex: 1,
            explanation: "朝目が覚めた後には「ごはんを食べる」ことが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、朝学校に行く前にすることが多いのはどれですか？",
            choices: [
                "顔を洗う",
                "宿題をする",
                "テレビを見る",
                "遊びに行く"
            ],
            correctAnswerIndex: 0,
            explanation: "学校に行く前には「顔を洗う」ことが一般的です。"
        ),
        QuizQuestion(
            question: "次の中で、夜寝る前に使うものはどれですか？",
            choices: [
                "ベッド",
                "テーブル",
                "ランドセル",
                "お弁当"
            ],
            correctAnswerIndex: 0,
            explanation: "寝る前には「ベッド」を使います。"
        ),
        QuizQuestion(
            question: "次の中で、夏に食べることが多い食べ物はどれですか？",
            choices: [
                "お鍋",
                "スイカ",
                "おでん",
                "シチュー"
            ],
            correctAnswerIndex: 1,
            explanation: "夏には「スイカ」を食べることが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、図書館でできることはどれですか？",
            choices: [
                "本を借りる",
                "お金を借りる",
                "ゲームをする",
                "自転車を借りる"
            ],
            correctAnswerIndex: 0,
            explanation: "図書館では「本を借りる」ことができます。"
        ),
        QuizQuestion(
            question: "次の中で、冬によく着るものはどれですか？",
            choices: [
                "水着",
                "セーター",
                "半袖シャツ",
                "短パン"
            ],
            correctAnswerIndex: 1,
            explanation: "冬には「セーター」をよく着ます。"
        ),
        QuizQuestion(
            question: "次の中で、誕生日に食べることが多いものはどれですか？",
            choices: [
                "ケーキ",
                "おにぎり",
                "サラダ",
                "スープ"
            ],
            correctAnswerIndex: 0,
            explanation: "誕生日には「ケーキ」を食べることが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、学校に持って行くことが多いものはどれですか？",
            choices: [
                "お弁当",
                "本",
                "自転車",
                "靴"
            ],
            correctAnswerIndex: 1,
            explanation: "学校には「本」を持っていくことが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、夏休みによく行く場所はどこですか？",
            choices: [
                "プール",
                "図書館",
                "公園",
                "スーパー"
            ],
            correctAnswerIndex: 0,
            explanation: "夏休みには「プール」に行くことが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、手紙を書くために使うものはどれですか？",
            choices: [
                "のり",
                "ハサミ",
                "鉛筆",
                "消しゴム"
            ],
            correctAnswerIndex: 2,
            explanation: "手紙を書くには「鉛筆」を使います。"
        ),
        QuizQuestion(
            question: "次の中で、教室にあることが多いものはどれですか？",
            choices: [
                "黒板",
                "ベッド",
                "テレビ",
                "コンロ"
            ],
            correctAnswerIndex: 0,
            explanation: "教室には「黒板」があります。"
        ),
        QuizQuestion(
            question: "次の中で、朝学校に行くときに着るものはどれですか？",
            choices: [
                "パジャマ",
                "制服",
                "スーツ",
                "水着"
            ],
            correctAnswerIndex: 1,
            explanation: "学校に行くときは「制服」を着ることが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、運動会で使うことが多いものはどれですか？",
            choices: [
                "縄跳び",
                "お弁当",
                "赤白帽子",
                "ノート"
            ],
            correctAnswerIndex: 2,
            explanation: "運動会では「赤白帽子」を使います。"
        ),
        QuizQuestion(
            question: "次の中で、食べ物を保存するために使うものはどれですか？",
            choices: [
                "冷蔵庫",
                "テレビ",
                "洗濯機",
                "コンロ"
            ],
            correctAnswerIndex: 0,
            explanation: "食べ物を保存するためには「冷蔵庫」を使います。"
        ),
        QuizQuestion(
            question: "次の中で、運動をする場所はどれですか？",
            choices: [
                "教室",
                "体育館",
                "図書館",
                "保健室"
            ],
            correctAnswerIndex: 1,
            explanation: "運動は「体育館」で行うことが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、学校でお昼ごはんを食べる時間をなんと言いますか？",
            choices: [
                "朝食",
                "夕食",
                "昼食",
                "間食"
            ],
            correctAnswerIndex: 2,
            explanation: "学校では「昼食」の時間にお昼ごはんを食べます。"
        ),
        QuizQuestion(
            question: "次の中で、雨の日に使うものはどれですか？",
            choices: [
                "傘",
                "ぼうし",
                "メガネ",
                "サングラス"
            ],
            correctAnswerIndex: 0,
            explanation: "雨の日には「傘」を使って濡れないようにします。"
        ),
        QuizQuestion(
            question: "次の中で、夜に使うことが多いものはどれですか？",
            choices: [
                "懐中電灯",
                "おもちゃ",
                "テレビ",
                "布団"
            ],
            correctAnswerIndex: 3,
            explanation: "夜には「布団」を使って寝ます。"
        ),
        QuizQuestion(
            question: "次の中で、先生に質問するために挙げるものはどれですか？",
            choices: [
                "手",
                "足",
                "本",
                "鉛筆"
            ],
            correctAnswerIndex: 0,
            explanation: "先生に質問するときは「手」を挙げます。"
        ),
        QuizQuestion(
            question: "次の中で、誕生日に受け取ることが多いものはどれですか？",
            choices: [
                "ケーキ",
                "プレゼント",
                "手紙",
                "花"
            ],
            correctAnswerIndex: 1,
            explanation: "誕生日には「プレゼント」を受け取ることが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、夏に外で遊ぶために必要なものはどれですか？",
            choices: [
                "虫よけスプレー",
                "コート",
                "手袋",
                "ストーブ"
            ],
            correctAnswerIndex: 0,
            explanation: "夏に外で遊ぶときには「虫よけスプレー」が役立ちます。"
        ),
        QuizQuestion(
            question: "次の中で、朝起きた後にすることが多いのはどれですか？",
            choices: [
                "朝ごはんを食べる",
                "昼ごはんを食べる",
                "夜ごはんを食べる",
                "デザートを食べる"
            ],
            correctAnswerIndex: 0,
            explanation: "朝起きた後には「朝ごはんを食べる」ことが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、冬によく使うものはどれですか？",
            choices: [
                "こたつ",
                "扇風機",
                "プール",
                "うちわ"
            ],
            correctAnswerIndex: 0,
            explanation: "冬には「こたつ」を使って暖まります。"
        ),
        QuizQuestion(
            question: "次の中で、音楽を聴くときに使うものはどれですか？",
            choices: [
                "テレビ",
                "ラジオ",
                "自転車",
                "洗濯機"
            ],
            correctAnswerIndex: 1,
            explanation: "音楽を聴くには「ラジオ」や他の音楽機器を使います。"
        ),
        QuizQuestion(
            question: "次の中で、学校で書き物をするときに使うものはどれですか？",
            choices: [
                "ハサミ",
                "のり",
                "鉛筆",
                "消しゴム"
            ],
            correctAnswerIndex: 2,
            explanation: "学校では「鉛筆」を使って書き物をします。"
        ),
        QuizQuestion(
            question: "次の中で、冬に着ることが多いものはどれですか？",
            choices: [
                "半袖シャツ",
                "水着",
                "コート",
                "サンダル"
            ],
            correctAnswerIndex: 2,
            explanation: "冬には「コート」を着ることが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、家の中で食べ物を調理する場所はどこですか？",
            choices: [
                "お風呂",
                "リビング",
                "キッチン",
                "寝室"
            ],
            correctAnswerIndex: 2,
            explanation: "食べ物は「キッチン」で調理します。"
        ),
        QuizQuestion(
            question: "次の中で、学校に通うために使うものはどれですか？",
            choices: [
                "ランドセル",
                "図書館",
                "ノート",
                "スーパー"
            ],
            correctAnswerIndex: 0,
            explanation: "学校には「ランドセル」を使って通います。"
        ),
        QuizQuestion(
            question: "次の中で、夏に涼しくするために使うものはどれですか？",
            choices: [
                "毛布",
                "扇風機",
                "こたつ",
                "温泉"
            ],
            correctAnswerIndex: 1,
            explanation: "夏には「扇風機」を使って涼しくします。"
        ),
        QuizQuestion(
            question: "次の中で、先生が教えてくれる場所はどれですか？",
            choices: [
                "教室",
                "公園",
                "スーパー",
                "病院"
            ],
            correctAnswerIndex: 0,
            explanation: "学校の「教室」で先生が教えてくれます。"
        ),
        QuizQuestion(
            question: "次の中で、野菜を買うことができる場所はどこですか？",
            choices: [
                "図書館",
                "スーパー",
                "公園",
                "病院"
            ],
            correctAnswerIndex: 1,
            explanation: "「スーパー」では野菜を買うことができます。"
        ),
        QuizQuestion(
            question: "次の中で、手を洗うのに使うものはどれですか？",
            choices: [
                "石けん",
                "本",
                "おもちゃ",
                "ふく"
            ],
            correctAnswerIndex: 0,
            explanation: "手を洗うときには「石けん」を使います。"
        ),
        QuizQuestion(
            question: "次の中で、夏に行われることが多いイベントはどれですか？",
            choices: [
                "運動会",
                "プール開き",
                "入学式",
                "遠足"
            ],
            correctAnswerIndex: 1,
            explanation: "夏には「プール開き」が行われることが多いです。"
        ),
        QuizQuestion(
            question: "次の中で、道路を安全に渡るために使うものはどれですか？",
            choices: [
                "図書館",
                "横断歩道",
                "信号機",
                "スーパー"
            ],
            correctAnswerIndex: 2,
            explanation: "信号機を守って道路を渡ると安全です。"
        ),
        QuizQuestion(
            question: "次の中で、木の下に座って休む場所はどれですか？",
            choices: [
                "図書館",
                "スーパー",
                "病院",
                "公園"
            ],
            correctAnswerIndex: 3,
            explanation: "公園には木が多く、休むのに最適な場所です。"
        ),
        QuizQuestion(
            question: "次の中で、家の中で靴を履かない場所はどれですか？",
            choices: [
                "リビング",
                "玄関",
                "お風呂",
                "寝室"
            ],
            correctAnswerIndex: 2,
            explanation: "日本では通常「お風呂」で靴を履くことはありません。"
        ),
        QuizQuestion(
            question: "次の中で、夜ごはんに食べることが多いものはどれですか？",
            choices: [
                "ごはん",
                "昼ごはん",
                "夜ごはん",
                "デザート"
            ],
            correctAnswerIndex: 0,
            explanation: "一般的に夜ごはんには「ごはん」を食べることが多いです。"
        ),
        QuizQuestion(
            question: "卒業式が行われる季節はどれですか？",
            choices: [
                "春",
                "夏",
                "秋",
                "冬"
            ],
            correctAnswerIndex: 3,
            explanation: "卒業式は通常、春に行われますが、四季の流れを学びながら記憶します。"
        ),
        QuizQuestion(
            question: "お肉を買うことができる場所はどれですか？",
            choices: [
                "図書館",
                "スーパー",
                "公園",
                "病院"
            ],
            correctAnswerIndex: 1,
            explanation: "お肉は「スーパー」で買うことができます。"
        ),
        QuizQuestion(
            question: "遠足が行われる場所はどれですか？",
            choices: [
                "公園",
                "図書館",
                "スーパー",
                "病院"
            ],
            correctAnswerIndex: 0,
            explanation: "遠足は通常「公園」などの屋外で行われます。"
        ),
        QuizQuestion(
            question: "給食で飲むことが多い飲み物はどれですか？",
            choices: [
                "水",
                "牛乳",
                "ジュース",
                "お茶"
            ],
            correctAnswerIndex: 1,
            explanation: "給食では通常「牛乳」が提供されます。"
        ),
        QuizQuestion(
            question: "次の中で、朝ごはんに食べることが多いものはどれですか？",
            choices: [
                "ごはん",
                "昼ごはん",
                "夜ごはん",
                "おやつ"
            ],
            correctAnswerIndex: 0,
            explanation: "一般的に朝ごはんには「ごはん」を食べることが多いです。"
        ),
        QuizQuestion(
            question: "運動会が行われる季節はどれですか？",
            choices: [
                "春",
                "夏",
                "秋",
                "冬"
            ],
            correctAnswerIndex: 2,
            explanation: "運動会は通常、秋に行われることが多いです。"
        ),
        QuizQuestion(
            question: "本を借りることができる場所はどれですか？",
            choices: [
                "図書館",
                "スーパー",
                "公園",
                "病院"
            ],
            correctAnswerIndex: 0,
            explanation: "本を借りることができる場所は「図書館」です。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai1, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Shakai1ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai1ListView(isPresenting: .constant(false))
    }
}
