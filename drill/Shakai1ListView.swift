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
        QuizQuestion.related(
            question: "【関連づけ】ばしょと することが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "がっこう", match: "べんきょうする"),
                QuizMatchingPair(prompt: "こうえん", match: "あそぶ"),
                QuizMatchingPair(prompt: "ゆうびんきょく", match: "てがみを だす")
            ],
            choices: ["てがみを だす", "あそぶ", "べんきょうする"],
            explanation: "『がっこう=べんきょうする』『こうえん=あそぶ』『ゆうびんきょく=てがみを だす』が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
            question: "【分類】のりものを なかまで 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "バス", match: "りく"),
                QuizMatchingPair(prompt: "ひこうき", match: "そら"),
                QuizMatchingPair(prompt: "ふね", match: "みず")
            ],
            categories: ["りく", "そら", "みず"],
            explanation: "バスは『りく』、ひこうきは『そら』、ふねは『みず』の なかまです。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】のりものを はやいじゅんに ならべましょう。",
            choices: ["あるく", "バス", "ひこうき"],
            rankedChoices: ["ひこうき", "バス", "あるく"],
            explanation: "いちばん はやいのは ひこうきで、そのつぎが バスです。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】ばしょと そのばしょに あるものが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "ゆうびんきょく", match: "ぽすと"),
                QuizMatchingPair(prompt: "としょかん", match: "ほん"),
                QuizMatchingPair(prompt: "こうえん", match: "ぶらんこ")
            ],
            choices: ["ほん", "ぶらんこ", "ぽすと"],
            explanation: "ゆうびんきょくには ぽすと、としょかんには ほん、こうえんには ぶらんこが あります。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】のりものと とおる ところが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "でんしゃ", match: "せんろ"),
                QuizMatchingPair(prompt: "バス", match: "どうろ"),
                QuizMatchingPair(prompt: "ふね", match: "みずの うえ")
            ],
            choices: ["どうろ", "みずの うえ", "せんろ"],
            explanation: "でんしゃは せんろ、バスは どうろ、ふねは みずの うえを とおります。"
        ),

        QuizQuestion.classification(
            question: "【分類】しせつを はたらきで 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "がっこう", match: "まなぶ"),
                QuizMatchingPair(prompt: "スーパー", match: "かう"),
                QuizMatchingPair(prompt: "こうえん", match: "あそぶ")
            ],
            categories: ["まなぶ", "かう", "あそぶ"],
            explanation: "がっこうは まなぶ ところ、スーパーは かう ところ、こうえんは あそぶ ところです。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】のりものを 大きいじゅんに ならべましょう。",
            choices: ["じてんしゃ", "ばす", "でんしゃ"],
            rankedChoices: ["でんしゃ", "ばす", "じてんしゃ"],
            explanation: "大きいじゅんに ならべると、でんしゃ、ばす、じてんしゃです。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】あさから よるの じゅんに ならべましょう。",
            choices: ["よる", "あさ", "ひる"],
            rankedChoices: ["あさ", "ひる", "よる"],
            explanation: "一日のながれは、あさ、ひる、よるの順です。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】てがみが とどくまでの じゅんに ならべましょう。",
            choices: ["ゆうびんきょくに あつまる", "いえに とどく", "ぽすとに いれる"],
            orderedChoices: ["ぽすとに いれる", "ゆうびんきょくに あつまる", "いえに とどく"],
            explanation: "てがみは ぽすとに いれてから ゆうびんきょくに あつまり、そのあと いえに とどきます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】はたらく人と つかう のりものが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "しょうぼうし", match: "しょうぼうしゃ"),
                QuizMatchingPair(prompt: "けいさつかん", match: "ぱとかー"),
                QuizMatchingPair(prompt: "ゆうびんやさん", match: "ゆうびんしゃ")
            ],
            choices: ["しょうぼうしゃ", "ゆうびんしゃ", "ぱとかー"],
            explanation: "しょうぼうしは しょうぼうしゃ、けいさつかんは ぱとかー、ゆうびんやさんは ゆうびんしゃを つかいます。"
        ),

        QuizQuestion.classification(
            question: "【分類】どうぐを つかう ばしょで 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "ほん", match: "としょかん"),
                QuizMatchingPair(prompt: "ぶらんこ", match: "こうえん"),
                QuizMatchingPair(prompt: "てがみ", match: "ゆうびんきょく")
            ],
            categories: ["としょかん", "こうえん", "ゆうびんきょく"],
            explanation: "ほんは としょかん、ぶらんこは こうえん、てがみは ゆうびんきょくに あります。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】人を たくさん はこべる じゅんに ならべましょう。",
            choices: ["じてんしゃ", "ばす", "でんしゃ"],
            rankedChoices: ["でんしゃ", "ばす", "じてんしゃ"],
            explanation: "たくさんの人を はこべるのは、でんしゃ、ばす、じてんしゃ の順です。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】ばしょと はたらく人が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "がっこう", match: "せんせい"),
                QuizMatchingPair(prompt: "びょういん", match: "いしゃ"),
                QuizMatchingPair(prompt: "こうばん", match: "けいさつかん")
            ],
            choices: ["いしゃ", "けいさつかん", "せんせい"],
            explanation: "がっこうには せんせい、びょういんには いしゃ、こうばんには けいさつかんが います。"
        ),

        QuizQuestion.classification(
            question: "【分類】まちの ばしょを することで 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "がっこう", match: "まなぶ"),
                QuizMatchingPair(prompt: "びょういん", match: "たすけてもらう"),
                QuizMatchingPair(prompt: "ゆうびんきょく", match: "てがみを だす")
            ],
            categories: ["まなぶ", "たすけてもらう", "てがみを だす"],
            explanation: "がっこうは まなぶ ところ、びょういんは たすけてもらう ところ、ゆうびんきょくは てがみを だす ところです。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】としょかんで 本を かりる じゅんに ならべましょう。",
            choices: ["うけつけで かりる", "本を えらぶ", "としょかんに いく"],
            orderedChoices: ["としょかんに いく", "本を えらぶ", "うけつけで かりる"],
            explanation: "としょかんに 行って、本を えらび、うけつけで かります。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】しごとと つかうものが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "せんせい", match: "きょうかしょ"),
                QuizMatchingPair(prompt: "しょうぼうし", match: "ほーす"),
                QuizMatchingPair(prompt: "ゆうびんやさん", match: "かばん")
            ],
            choices: ["ほーす", "かばん", "きょうかしょ"],
            explanation: "せんせいは きょうかしょ、しょうぼうしは ほーす、ゆうびんやさんは かばんを つかいます。"
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
            question: "次の中で、道路を安全に渡るために、色で合図をしてくれるものはどれですか？",
            choices: [
                "図書館",
                "横断歩道",
                "信号機",
                "スーパー"
            ],
            correctAnswerIndex: 2,
            explanation: "信号機は色で合図をしてくれます。信号機と横断歩道を守って道路を渡ると安全です。"
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
            correctAnswerIndex: 0,
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

        QuizQuestion(
        question: "今日の給食に何が出るかを前もって確かめたいとき、見るものはどれですか？",
        choices: [
        "献立表",
        "座席表",
        "時間割",
        "出席簿"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「献立表」です。献立表を見ると、その日の給食にどんな料理が出るかを確かめることができます。"
        ),

        QuizQuestion(
        question: "教室の植物の世話をする係になりました。することとして最も合うものはどれですか？",
        choices: [
        "机を校庭へ運ぶ",
        "黒板に絵をかく",
        "植物に水をやり、様子を見る",
        "給食を作る"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「植物に水をやり、様子を見る」です。植物の世話をする係は、水やりなどをして植物の様子を見守ります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】学校で、外ばきから上ばきにはきかえる出入り口を「＿＿」といいます。",
        answer: "しょうこうぐち",
        acceptableAnswers: ["昇降口"],
        explanation: "＿＿に入る言葉は「しょうこうぐち」です。昇降口では、外ばきから上ばきにはきかえて校舎に入ります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】学校の当番や役割と、その仕事を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "日直", match: "朝や帰りの会などを進める"),
        QuizMatchingPair(prompt: "給食当番", match: "給食を配る"),
        QuizMatchingPair(prompt: "清掃当番", match: "決められた場所をそうじする"),
        QuizMatchingPair(prompt: "飼育当番", match: "学校で飼っている動物の世話をする")
        ],
        choices: [
        "学校で飼っている動物の世話をする",
        "給食を配る",
        "朝や帰りの会などを進める",
        "決められた場所をそうじする"
        ],
        explanation: "「日直＝朝や帰りの会などを進める」「給食当番＝給食を配る」「清掃当番＝決められた場所をそうじする」「飼育当番＝学校で飼っている動物の世話をする」が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】学校で使うものを、主に使う教室で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ピアノ", match: "音楽室"),
        QuizMatchingPair(prompt: "タンバリン", match: "音楽室"),
        QuizMatchingPair(prompt: "粘土", match: "図工室"),
        QuizMatchingPair(prompt: "絵の具", match: "図工室")
        ],
        categories: [
        "音楽室",
        "図工室"
        ],
        explanation: "ピアノとタンバリンは「音楽室」、粘土と絵の具は「図工室」で主に使います。"
        ),

        QuizQuestion(
        question: "洗濯物が乾いたあとにするとよいことはどれですか？",
        choices: [
        "庭に置いたままにする",
        "取りこんで、たたむ",
        "水の中に戻す",
        "床に広げたままにする"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「取りこんで、たたむ」です。乾いた洗濯物は取りこんでたたむと、しまいやすくなります。"
        ),

        QuizQuestion(
        question: "食事の準備を手伝うとき、小学1年生でも安全にしやすいことはどれですか？",
        choices: [
        "熱い油の入った鍋を運ぶ",
        "大きな包丁で固い物を切る",
        "火のついたコンロを一人で使う",
        "箸やスプーンを食卓に並べる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「箸やスプーンを食卓に並べる」です。熱い物や刃物、火を使う作業は危険があるため、安全にできるお手伝いを選びます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】家の人が外出している間、家で待っていることを「＿＿」といいます。",
        answer: "るすばん",
        acceptableAnswers: ["留守番"],
        explanation: "＿＿に入る言葉は「るすばん」です。家の人が外出している間に家で待つことを留守番といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】洗濯をするときの基本的な流れを、順番に並べましょう。",
        choices: [
        "乾いた衣服を取りこんでたたむ",
        "洗う衣服を洗濯機に入れる",
        "洗い終わった衣服を干す",
        "洗濯機で衣服を洗う"
        ],
        orderedChoices: [
        "洗う衣服を洗濯機に入れる",
        "洗濯機で衣服を洗う",
        "洗い終わった衣服を干す",
        "乾いた衣服を取りこんでたたむ"
        ],
        explanation: "「洗う衣服を洗濯機に入れる→洗濯機で衣服を洗う→洗い終わった衣服を干す→乾いた衣服を取りこんでたたむ」の順です。"
        ),

        QuizQuestion(
        question: "地域にある防災倉庫には、何が入っていることがありますか？",
        choices: [
        "学校の通知表だけ",
        "お店の商品だけ",
        "災害のときに使う道具や備蓄品",
        "遊園地の乗り物"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「災害のときに使う道具や備蓄品」です。防災倉庫には、災害に備えて必要な道具や物資が保管されていることがあります。"
        ),

        QuizQuestion(
        question: "農産物直売所では、どのようなものが売られていることが多いですか？",
        choices: [
        "地域でとれた野菜や果物",
        "学校の机だけ",
        "電車の車両",
        "道路標識だけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地域でとれた野菜や果物」です。農産物直売所では、その地域で作られた野菜や果物などが売られていることがあります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域で見かけるものと、その役目を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "防犯灯", match: "夜の道を明るくする"),
        QuizMatchingPair(prompt: "カーブミラー", match: "見えにくい方向の様子を確かめやすくする"),
        QuizMatchingPair(prompt: "消火栓", match: "火事の消火に使う水を取る"),
        QuizMatchingPair(prompt: "公衆電話", match: "外出先などから電話をかける")
        ],
        choices: [
        "火事の消火に使う水を取る",
        "外出先などから電話をかける",
        "夜の道を明るくする",
        "見えにくい方向の様子を確かめやすくする"
        ],
        explanation: "「防犯灯＝夜の道を明るくする」「カーブミラー＝見えにくい方向の様子を確かめやすくする」「消火栓＝火事の消火に使う水を取る」「公衆電話＝外出先などから電話をかける」が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域にある場所を、「人が住む場所」と「作物を育てる場所」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "住宅", match: "人が住む場所"),
        QuizMatchingPair(prompt: "マンション", match: "人が住む場所"),
        QuizMatchingPair(prompt: "田んぼ", match: "作物を育てる場所"),
        QuizMatchingPair(prompt: "畑", match: "作物を育てる場所")
        ],
        categories: [
        "人が住む場所",
        "作物を育てる場所"
        ],
        explanation: "住宅とマンションは「人が住む場所」、田んぼと畑は「作物を育てる場所」です。"
        ),

        QuizQuestion(
        question: "歩道橋は、何のために使うものですか？",
        choices: [
        "車を駐車するため",
        "電車に乗るため",
        "道路で遊ぶため",
        "車道を直接横切らずに道路の向こう側へ渡るため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「車道を直接横切らずに道路の向こう側へ渡るため」です。歩道橋を使うと、車が走る道路の上を安全に渡ることができます。"
        ),

        QuizQuestion(
        question: "前が見えにくい道路の曲がり角に来たとき、どうするのが安全ですか？",
        choices: [
        "勢いよく飛び出す",
        "いったん注意して、車や自転車などが来ないか確かめる",
        "目を閉じて進む",
        "道路の真ん中で遊ぶ"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「いったん注意して、車や自転車などが来ないか確かめる」です。見通しの悪い場所では、急に飛び出さず周りの安全を確かめます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】二つ以上の道路が交わっている場所を「＿＿」といいます。",
        answer: "こうさてん",
        acceptableAnswers: ["交差点"],
        explanation: "＿＿に入る言葉は「こうさてん」です。道路と道路が交わる場所を交差点といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】踏切を安全に渡るときの確認の順番に並べましょう。",
        choices: [
        "左右を見て電車が来ないか確かめる",
        "踏切の手前で止まる",
        "安全を確かめて踏切を渡る",
        "警報機や遮断機の様子を確かめる"
        ],
        orderedChoices: [
        "踏切の手前で止まる",
        "警報機や遮断機の様子を確かめる",
        "左右を見て電車が来ないか確かめる",
        "安全を確かめて踏切を渡る"
        ],
        explanation: "「踏切の手前で止まる→警報機や遮断機の様子を確かめる→左右を見て電車が来ないか確かめる→安全を確かめて踏切を渡る」の順です。"
        ),

        QuizQuestion(
        question: "公共施設で、部屋の場所や利用のしかたが分からないとき、たずねる場所として最も合うのはどれですか？",
        choices: [
        "受付",
        "倉庫",
        "屋上",
        "駐車スペース"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「受付」です。施設の受付では、場所や利用方法などを案内してもらえることがあります。"
        ),

        QuizQuestion(
        question: "公共施設などにあるスロープには、どのような役目がありますか？",
        choices: [
        "建物を暗くする",
        "自動車を速く走らせる",
        "車いすやベビーカーなどでも段差を移動しやすくする",
        "建物の音を大きくする"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「車いすやベビーカーなどでも段差を移動しやすくする」です。スロープは、段差のある場所を移動しやすくするために設けられています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】公共施設などにある設備や場所と、その役目を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "案内所", match: "施設について分からないことを聞く"),
        QuizMatchingPair(prompt: "エレベーター", match: "上や下の階へ移動する"),
        QuizMatchingPair(prompt: "コインロッカー", match: "荷物を一時的に預ける"),
        QuizMatchingPair(prompt: "授乳室", match: "赤ちゃんの授乳や世話をする")
        ],
        choices: [
        "荷物を一時的に預ける",
        "赤ちゃんの授乳や世話をする",
        "施設について分からないことを聞く",
        "上や下の階へ移動する"
        ],
        explanation: "「案内所＝施設について分からないことを聞く」「エレベーター＝上や下の階へ移動する」「コインロッカー＝荷物を一時的に預ける」「授乳室＝赤ちゃんの授乳や世話をする」が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】みんなが利用する場所を、「建物の中にある場所」と「屋外にある場所」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "公民館", match: "建物の中にある場所"),
        QuizMatchingPair(prompt: "市民ホール", match: "建物の中にある場所"),
        QuizMatchingPair(prompt: "公園", match: "屋外にある場所"),
        QuizMatchingPair(prompt: "地域の運動広場", match: "屋外にある場所")
        ],
        categories: [
        "建物の中にある場所",
        "屋外にある場所"
        ],
        explanation: "公民館と市民ホールは「建物の中にある場所」、公園と地域の運動広場は「屋外にある場所」です。"
        ),

        QuizQuestion(
        question: "夏祭りなどで着ることがある、日本の昔からの衣服はどれですか？",
        choices: [
        "スキーウェア",
        "浴衣",
        "ランドセル",
        "レインコート"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「浴衣」です。夏祭りなどでは、浴衣を着て参加することがあります。"
        ),

        QuizQuestion(
        question: "地域の秋祭りなどで、大勢の人がかつぐことがあるものはどれですか？",
        choices: [
        "黒板",
        "信号機",
        "本棚",
        "みこし"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「みこし」です。地域のお祭りでは、大勢の人がみこしをかつぐことがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】季節に合わせて、着る服を入れかえることを「＿＿」といいます。",
        answer: "ころもがえ",
        acceptableAnswers: ["衣替え"],
        explanation: "＿＿に入る言葉は「ころもがえ」です。暑さや寒さなど季節の変化に合わせて服を入れかえることを衣替えといいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】お正月に楽しまれる遊びと、使うものを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "凧あげ", match: "凧"),
        QuizMatchingPair(prompt: "羽根つき", match: "羽子板"),
        QuizMatchingPair(prompt: "かるた", match: "かるたの札"),
        QuizMatchingPair(prompt: "福笑い", match: "目や口などの顔の部品")
        ],
        choices: [
        "羽子板",
        "目や口などの顔の部品",
        "凧",
        "かるたの札"
        ],
        explanation: "「凧あげ＝凧」「羽根つき＝羽子板」「かるた＝かるたの札」「福笑い＝目や口などの顔の部品」が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "ベランダで安全に過ごすために大切なことはどれですか？",
        choices: [
        "手すりから身を乗り出す",
        "台を手すりの近くに置いて登る",
        "手すりに登ったり身を乗り出したりしない",
        "高い場所から物を投げる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「手すりに登ったり身を乗り出したりしない」です。ベランダでは転落する危険があるため、手すりに登ったり身を乗り出したりしてはいけません。"
        ),

        QuizQuestion(
        question: "インターネットを使っていて、知らない人から名前や住所を聞かれたとき、どうするのがよいですか？",
        choices: [
        "勝手に教えず、家の人など信頼できる大人に相談する",
        "すぐに全部教える",
        "家族の電話番号も一緒に教える",
        "友だちの住所を代わりに教える"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「勝手に教えず、家の人など信頼できる大人に相談する」です。名前や住所など大切な情報を、知らない人に勝手に教えないことが大切です。"
        ),

        QuizQuestion(
        question: "家でマッチやライターを見つけたとき、どうするのが安全ですか？",
        choices: [
        "火をつけて遊ぶ",
        "さわって遊ばず、大人に知らせる",
        "紙に火をつけてみる",
        "友だちに渡して遊ぶ"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「さわって遊ばず、大人に知らせる」です。マッチやライターでの火遊びは火事ややけどにつながるため、勝手に使ってはいけません。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】火事などの非常時に、建物から外へ逃げるために使う出口を「＿＿」といいます。",
        answer: "ひじょうぐち",
        acceptableAnswers: ["非常口"],
        explanation: "＿＿に入る言葉は「ひじょうぐち」です。非常口は、火事などの非常時に建物から避難するための出口です。"
        ),

        QuizQuestion.classification(
        question: "【分類】家での行動を、「自分でできること」と「大人に頼むこと」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ハンカチをたたむ", match: "自分でできること"),
        QuizMatchingPair(prompt: "読んだ本を本棚に戻す", match: "自分でできること"),
        QuizMatchingPair(prompt: "熱い油の入った鍋を運ぶ", match: "大人に頼むこと"),
        QuizMatchingPair(prompt: "高い場所の電球を交換する", match: "大人に頼むこと")
        ],
        categories: [
        "自分でできること",
        "大人に頼むこと"
        ],
        explanation: "ハンカチをたたむことと本を本棚に戻すことは「自分でできること」です。熱い油の入った鍋を運ぶことや高い場所の電球を交換することは危険があるため、「大人に頼むこと」です。"
        ),

        QuizQuestion(
        question: "朝の会で先生に名前を呼ばれたとき、どうするのがよいですか？",
        choices: [
        "机の下にかくれる",
        "聞こえる声で返事をする",
        "教室の外へ出る",
        "友だちの名前を答える"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「聞こえる声で返事をする」です。名前を呼ばれたら返事をすると、自分が登校していることを先生に伝えられます。"
        ),

        QuizQuestion(
        question: "休み時間が終わり、次の授業が始まる前にするとよいことはどれですか？",
        choices: [
        "校庭へ遊びに行く",
        "ランドセルを持って帰る",
        "教室の電気を全部消す",
        "次の授業の準備をして席につく"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「次の授業の準備をして席につく」です。授業が始まる前に必要な物を用意しておくと、落ち着いて学習を始められます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】授業と授業の間に、休んだり次の授業の準備をしたりする時間を「＿＿」といいます。",
        answer: "やすみじかん",
        acceptableAnswers: ["休み時間"],
        explanation: "＿＿に入る言葉は「やすみじかん」です。休み時間には、休んだり次の授業の準備をしたりします。"
        ),

        QuizQuestion.classification(
        question: "【分類】学校ですることを、「登校したあと」と「下校する前」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "その日に使う学習用具を出す", match: "登校したあと"),
        QuizMatchingPair(prompt: "上着や帽子を決められた場所に置く", match: "登校したあと"),
        QuizMatchingPair(prompt: "机の中に忘れ物がないか確かめる", match: "下校する前"),
        QuizMatchingPair(prompt: "持ち帰る物をランドセルに入れる", match: "下校する前")
        ],
        categories: [
        "登校したあと",
        "下校する前"
        ],
        explanation: "学習用具を出したり上着や帽子を置いたりするのは「登校したあと」、忘れ物を確かめたり持ち帰る物をランドセルに入れたりするのは「下校する前」に行います。"
        ),

        QuizQuestion(
        question: "家族が具合を悪くして家で休んでいるとき、どうするとよいですか？",
        choices: [
        "大きな音を出さず静かに過ごす",
        "休んでいる人の近くで走り回る",
        "テレビの音を一番大きくする",
        "何度も起こして話しかける"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「大きな音を出さず静かに過ごす」です。具合の悪い家族がゆっくり休めるように気を配ることが大切です。"
        ),

        QuizQuestion(
        question: "家族みんなが使う洗面台を使い終わったあと、どうするとよいですか？",
        choices: [
        "自分の物を広げたままにする",
        "水を出したままにする",
        "自分の物を片づけ、使いやすい状態にする",
        "ぬれた物を床に置く"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「自分の物を片づけ、使いやすい状態にする」です。みんなで使う場所は、次の人も気持ちよく使えるように整えます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】料理、洗濯、そうじなど、家のくらしに必要な仕事をまとめて「＿＿」といいます。",
        answer: "かじ",
        acceptableAnswers: ["家事"],
        explanation: "＿＿に入る言葉は「かじ」です。料理、洗濯、そうじなど、家庭で行うくらしの仕事を家事といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】家の仕事と、その仕事の目的を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "洗濯", match: "衣服を清潔にする"),
        QuizMatchingPair(prompt: "そうじ", match: "部屋をきれいにする"),
        QuizMatchingPair(prompt: "料理", match: "食事を作る"),
        QuizMatchingPair(prompt: "買い物", match: "生活に必要な物をそろえる")
        ],
        choices: [
        "食事を作る",
        "生活に必要な物をそろえる",
        "衣服を清潔にする",
        "部屋をきれいにする"
        ],
        explanation: "「洗濯＝衣服を清潔にする」「そうじ＝部屋をきれいにする」「料理＝食事を作る」「買い物＝生活に必要な物をそろえる」が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "地域で、朝に開かれて野菜や魚などを売ることがある市を何といいますか？",
        choices: [
        "運動会",
        "朝市",
        "音楽会",
        "始業式"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「朝市」です。朝市では、朝の時間に地域の野菜や魚など、さまざまな品物を売ることがあります。"
        ),

        QuizQuestion(
        question: "「特産品」とは、どのようなものですか？",
        choices: [
        "学校だけで使う文房具",
        "どの地域でも必ず同じ物",
        "家の中にある家具",
        "その地域で多く作られたり、有名だったりする品物"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「その地域で多く作られたり、有名だったりする品物」です。地域によって、農産物や食べ物、工芸品などさまざまな特産品があります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域にある場所と、特に関係の深いものを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "田んぼ", match: "米"),
        QuizMatchingPair(prompt: "畑", match: "野菜"),
        QuizMatchingPair(prompt: "果樹園", match: "果物"),
        QuizMatchingPair(prompt: "漁港", match: "魚")
        ],
        choices: [
        "果物",
        "魚",
        "米",
        "野菜"
        ],
        explanation: "「田んぼ＝米」「畑＝野菜」「果樹園＝果物」「漁港＝魚」が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】仕事のようすを、「農業に関係する仕事」と「漁業に関係する仕事」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "田植えをする", match: "農業に関係する仕事"),
        QuizMatchingPair(prompt: "野菜を収穫する", match: "農業に関係する仕事"),
        QuizMatchingPair(prompt: "網で魚をとる", match: "漁業に関係する仕事"),
        QuizMatchingPair(prompt: "漁船で海へ出る", match: "漁業に関係する仕事")
        ],
        categories: [
        "農業に関係する仕事",
        "漁業に関係する仕事"
        ],
        explanation: "田植えや野菜の収穫は「農業に関係する仕事」、網で魚をとったり漁船で海へ出たりすることは「漁業に関係する仕事」です。"
        ),

        QuizQuestion(
        question: "雨の日に傘をさして道を歩くとき、安全のために大切なことはどれですか？",
        choices: [
        "前がよく見えるように傘を持つ",
        "傘で顔を全部かくして歩く",
        "傘を振り回しながら歩く",
        "道路の真ん中を歩く"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「前がよく見えるように傘を持つ」です。雨の日は見通しが悪くなりやすいので、前や周りが見えるように歩くことが大切です。"
        ),

        QuizQuestion(
        question: "横断歩道で車が止まってくれたとき、渡る前にどうするとよいですか？",
        choices: [
        "すぐに走って渡る",
        "止まった車だけを見て渡る",
        "ほかの方向から来る車や自転車がないか確かめる",
        "横断歩道から離れた場所を渡る"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「ほかの方向から来る車や自転車がないか確かめる」です。一台の車が止まっていても、ほかの車や自転車が来ることがあるため、周りをよく確認します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】道路にある白いしま模様などで、歩行者が道路を渡るための場所を「＿＿」といいます。",
        answer: "おうだんほどう",
        acceptableAnswers: ["横断歩道"],
        explanation: "＿＿に入る言葉は「おうだんほどう」です。横断歩道は、歩行者が道路を渡るために設けられた場所です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】バスを降りたあと、道路の向こう側へ安全に移動するときの順番に並べましょう。",
        choices: [
        "横断歩道など安全に渡れる場所まで移動する",
        "バスを降りて歩道などの安全な場所に立つ",
        "左右や周りの安全を確かめて渡る",
        "バスが走り去り、周りが見やすくなるまで待つ"
        ],
        orderedChoices: [
        "バスを降りて歩道などの安全な場所に立つ",
        "バスが走り去り、周りが見やすくなるまで待つ",
        "横断歩道など安全に渡れる場所まで移動する",
        "左右や周りの安全を確かめて渡る"
        ],
        explanation: "「バスを降りて安全な場所に立つ→バスが走り去るまで待つ→横断歩道などへ移動する→左右や周りを確かめて渡る」の順です。バスのすぐ前や後ろから道路を渡らないことが大切です。"
        ),

        QuizQuestion(
        question: "地域の保健センターでできることとして、最も合うものはどれですか？",
        choices: [
        "電車の切符を買う",
        "健康について相談したり、健康診査を受けたりする",
        "自動車を修理する",
        "映画を見る"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「健康について相談したり、健康診査を受けたりする」です。保健センターでは、地域の人の健康を守るための相談や健康診査などを行います。"
        ),

        QuizQuestion(
        question: "科学館でできることとして、最も合うものはどれですか？",
        choices: [
        "野菜を買う",
        "手紙を配達してもらう",
        "道路工事をしてもらう",
        "科学の展示や実験を見て学ぶ"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「科学の展示や実験を見て学ぶ」です。科学館では、展示や実験などを通して科学について学ぶことができます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】みんなが利用できる施設と、そこで学べることを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "美術館", match: "絵や彫刻など"),
        QuizMatchingPair(prompt: "科学館", match: "科学や実験など"),
        QuizMatchingPair(prompt: "郷土資料館", match: "地域の昔のくらしなど"),
        QuizMatchingPair(prompt: "植物園", match: "さまざまな植物など")
        ],
        choices: [
        "地域の昔のくらしなど",
        "さまざまな植物など",
        "絵や彫刻など",
        "科学や実験など"
        ],
        explanation: "「美術館＝絵や彫刻など」「科学館＝科学や実験など」「郷土資料館＝地域の昔のくらしなど」「植物園＝さまざまな植物など」が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域のくらしを支える施設を、「水に関係する施設」と「ごみに関係する施設」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "浄水場", match: "水に関係する施設"),
        QuizMatchingPair(prompt: "下水処理場", match: "水に関係する施設"),
        QuizMatchingPair(prompt: "清掃工場", match: "ごみに関係する施設"),
        QuizMatchingPair(prompt: "リサイクルセンター", match: "ごみに関係する施設")
        ],
        categories: [
        "水に関係する施設",
        "ごみに関係する施設"
        ],
        explanation: "浄水場と下水処理場は「水に関係する施設」、清掃工場とリサイクルセンターは「ごみに関係する施設」です。"
        ),

        QuizQuestion(
        question: "新しい年になって初めて神社やお寺へお参りすることを何といいますか？",
        choices: [
        "初詣",
        "潮干狩り",
        "雪まつり",
        "運動会"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「初詣」です。初詣は、新しい年になって初めて神社やお寺へお参りすることです。"
        ),

        QuizQuestion(
        question: "クリスマスのころに飾ることが多いものはどれですか？",
        choices: [
        "門松",
        "こいのぼり",
        "クリスマスツリー",
        "すすき"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「クリスマスツリー」です。クリスマスのころには、木に飾りをつけたクリスマスツリーを飾ることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】11月23日の国民の祝日を「＿＿」といいます。",
        answer: "きんろうかんしゃのひ",
        acceptableAnswers: ["勤労感謝の日"],
        explanation: "＿＿に入る言葉は「きんろうかんしゃのひ」です。勤労感謝の日は11月23日の国民の祝日です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】季節の行事や催しと、そこで見られることを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "花火大会", match: "夜空に打ち上がる花火"),
        QuizMatchingPair(prompt: "潮干狩り", match: "海辺で貝を探す"),
        QuizMatchingPair(prompt: "雪まつり", match: "雪や氷で作った作品"),
        QuizMatchingPair(prompt: "収穫祭", match: "とれた作物の実りを祝う")
        ],
        choices: [
        "雪や氷で作った作品",
        "とれた作物の実りを祝う",
        "海辺で貝を探す",
        "夜空に打ち上がる花火"
        ],
        explanation: "「花火大会＝夜空に打ち上がる花火」「潮干狩り＝海辺で貝を探す」「雪まつり＝雪や氷で作った作品」「収穫祭＝とれた作物の実りを祝う」が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】行事を、「国民の祝日」と「国民の祝日ではない行事」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "海の日", match: "国民の祝日"),
        QuizMatchingPair(prompt: "山の日", match: "国民の祝日"),
        QuizMatchingPair(prompt: "クリスマス", match: "国民の祝日ではない行事"),
        QuizMatchingPair(prompt: "節分", match: "国民の祝日ではない行事")
        ],
        categories: [
        "国民の祝日",
        "国民の祝日ではない行事"
        ],
        explanation: "海の日と山の日は「国民の祝日」です。クリスマスと節分は、日本の「国民の祝日」ではありません。"
        ),

        QuizQuestion(
        question: "知らない人に「おうちの人が呼んでいるよ」と言われたとき、どうするのが安全ですか？",
        choices: [
        "その人の車に乗る",
        "ついて行かず、安全な場所で信頼できる大人に知らせる",
        "知らない場所まで案内してもらう",
        "家族の住所や電話番号を全部教える"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「ついて行かず、安全な場所で信頼できる大人に知らせる」です。知らない人にはついて行かず、先生や家族など信頼できる大人に相談します。"
        ),

        QuizQuestion(
        question: "家にある薬を飲むとき、どうするのがよいですか？",
        choices: [
        "お菓子のように好きなだけ飲む",
        "友だちの薬をもらって飲む",
        "何の薬か分からなくても飲む",
        "家の人など大人の指示を受けて、決められた量を飲む"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「家の人など大人の指示を受けて、決められた量を飲む」です。薬は勝手に飲まず、大人の指示や決められた使い方を守ります。"
        ),

        QuizQuestion(
        question: "外で遊んでいるときに雷が鳴り始めました。どうするのが安全ですか？",
        choices: [
        "建物の中など安全な場所へ移動する",
        "高い木のすぐ下に立つ",
        "広い場所で遊び続ける",
        "金属の遊具で遊び続ける"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「建物の中など安全な場所へ移動する」です。雷が鳴ったら屋外で遊び続けず、できるだけ早く安全な建物の中などへ移動します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】みんなが安全で気持ちよく生活するために、守るよう決められていることを「＿＿」といいます。",
        answer: "ルール",
        acceptableAnswers: ["るーる"],
        explanation: "＿＿に入る言葉は「ルール」です。ルールや決まりを守ることで、みんなが安全で気持ちよく生活しやすくなります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】外へ遊びに行くときから家に帰るまでの安全な行動を、順番に並べましょう。",
        choices: [
        "約束した時刻になったら帰る",
        "家の人に行き先と帰る時刻を伝える",
        "家に帰ったことを家の人に伝える",
        "伝えた場所で安全に遊ぶ"
        ],
        orderedChoices: [
        "家の人に行き先と帰る時刻を伝える",
        "伝えた場所で安全に遊ぶ",
        "約束した時刻になったら帰る",
        "家に帰ったことを家の人に伝える"
        ],
        explanation: "「家の人に行き先と帰る時刻を伝える→伝えた場所で安全に遊ぶ→約束した時刻になったら帰る→家に帰ったことを家の人に伝える」の順です。"
        ),

        QuizQuestion(
        question: "学校で、自分の持ち物に名前を書いておくとよい理由はどれですか？",
        choices: [
        "だれの持ち物か分かるようにするため",
        "持ち物を重くするため",
        "授業の時間を長くするため",
        "持ち物の数を増やすため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「だれの持ち物か分かるようにするため」です。名前を書いておくと、落としたり取り違えたりしたときにも持ち主を確かめやすくなります。"
        ),

        QuizQuestion(
        question: "体育の授業で、運動を始める前に準備運動をする大切な理由はどれですか？",
        choices: [
        "運動する時間をなくすため",
        "服を汚すため",
        "体を動かす準備をして、けがをしにくくするため",
        "教室を暗くするため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「体を動かす準備をして、けがをしにくくするため」です。準備運動をすると、体を安全に動かす準備ができます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】自分の名前を書いて、服などにつける札を「＿＿」といいます。",
        answer: "なふだ",
        acceptableAnswers: ["名札"],
        explanation: "＿＿に入る言葉は「なふだ」です。名札を見ると、その人の名前を確かめることができます。"
        ),

        QuizQuestion.classification(
        question: "【分類】学校で使うものを、「机の上で使うもの」と「体育で使うもの」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ノート", match: "机の上で使うもの"),
        QuizMatchingPair(prompt: "消しゴム", match: "机の上で使うもの"),
        QuizMatchingPair(prompt: "ボール", match: "体育で使うもの"),
        QuizMatchingPair(prompt: "運動用マット", match: "体育で使うもの")
        ],
        categories: [
        "机の上で使うもの",
        "体育で使うもの"
        ],
        explanation: "ノートと消しゴムは「机の上で使うもの」、ボールと運動用マットは「体育で使うもの」です。"
        ),

        QuizQuestion(
        question: "帰る予定の時間より遅くなることが分かったとき、家族に対してどうするのがよいですか？",
        choices: [
        "何も知らせずに帰る",
        "できるだけ早く家族に知らせる",
        "帰る時間をもっと遅くする",
        "知らない人にだけ知らせる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「できるだけ早く家族に知らせる」です。予定が変わったときは家族に連絡すると、家族も安心して予定を立てられます。"
        ),

        QuizQuestion(
        question: "家で熱い鍋を運ぶ必要があるとき、子どもがすることとして最も安全なのはどれですか？",
        choices: [
        "素手ですぐに持つ",
        "走りながら運ぶ",
        "鍋の中をのぞきながら運ぶ",
        "大人に頼んだり、手伝ってもらったりする"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「大人に頼んだり、手伝ってもらったりする」です。熱い鍋はやけどをする危険があるため、無理に子どもだけで運ばないことが大切です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】電話番号など、家族に連絡するために必要な情報を「＿＿」といいます。",
        answer: "れんらくさき",
        acceptableAnswers: ["連絡先"],
        explanation: "＿＿に入る言葉は「れんらくさき」です。家族の連絡先を知っておくと、必要なときに連絡することができます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】災害などに備えて家に用意するものと、その役目を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "懐中電灯", match: "停電のときに明るくする"),
        QuizMatchingPair(prompt: "飲料水", match: "必要なときに飲む"),
        QuizMatchingPair(prompt: "携帯ラジオ", match: "災害の情報を聞く"),
        QuizMatchingPair(prompt: "非常用持ち出し袋", match: "必要な物をまとめて持ち出す")
        ],
        choices: [
        "災害の情報を聞く",
        "必要な物をまとめて持ち出す",
        "停電のときに明るくする",
        "必要なときに飲む"
        ],
        explanation: "「懐中電灯＝停電のときに明るくする」「飲料水＝必要なときに飲む」「携帯ラジオ＝災害の情報を聞く」「非常用持ち出し袋＝必要な物をまとめて持ち出す」が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "商店街とは、どのようなところですか？",
        choices: [
        "電車だけが止まるところ",
        "田んぼだけが続いているところ",
        "いろいろなお店が集まっているところ",
        "学校の教室が集まっているところ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「いろいろなお店が集まっているところ」です。商店街には、さまざまな品物やサービスを扱う店が集まっています。"
        ),

        QuizQuestion(
        question: "地域で働く農家の仕事として、最も合うものはどれですか？",
        choices: [
        "米や野菜などを育てる",
        "電車を運転する",
        "手紙を配達する",
        "本を貸し出す"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「米や野菜などを育てる」です。農家は、田畑などで米や野菜、果物などを育てる仕事をしています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】学校のまわりなどを歩き、店や道、建物などのようすを調べる活動を「＿＿」といいます。",
        answer: "まちたんけん",
        acceptableAnswers: ["町探検", "まち探検"],
        explanation: "＿＿に入る言葉は「まちたんけん」です。まちたんけんでは、身近な地域を歩いて、どんな場所や人がいるかを調べます。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域にある場所を、「ものを作る場所」と「ものを売る場所」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "パン工場", match: "ものを作る場所"),
        QuizMatchingPair(prompt: "自動車工場", match: "ものを作る場所"),
        QuizMatchingPair(prompt: "文房具店", match: "ものを売る場所"),
        QuizMatchingPair(prompt: "本屋", match: "ものを売る場所")
        ],
        categories: [
        "ものを作る場所",
        "ものを売る場所"
        ],
        explanation: "パン工場と自動車工場は「ものを作る場所」、文房具店と本屋は「ものを売る場所」です。"
        ),

        QuizQuestion(
        question: "自転車に乗るとき、頭を守るために身につけるものはどれですか？",
        choices: [
        "長ぐつ",
        "マスク",
        "エプロン",
        "ヘルメット"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「ヘルメット」です。自転車に乗るときは、転んだときなどに頭を守るため、ヘルメットを正しくかぶることが大切です。"
        ),

        QuizQuestion(
        question: "歩道を歩いていて、駐車場の出入り口を通るときに大切なことはどれですか？",
        choices: [
        "目を閉じて通る",
        "いったん注意して、出入りする車がいないか確かめる",
        "急に車道へ出る",
        "友だちを押しながら通る"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「いったん注意して、出入りする車がいないか確かめる」です。駐車場の出入り口では車が歩道を横切ることがあるため、よく確かめて通ります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】乗り物と、乗るために向かう場所を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "電車", match: "駅"),
        QuizMatchingPair(prompt: "路線バス", match: "バス停"),
        QuizMatchingPair(prompt: "船", match: "港"),
        QuizMatchingPair(prompt: "飛行機", match: "空港")
        ],
        choices: [
        "港",
        "空港",
        "駅",
        "バス停"
        ],
        explanation: "「電車＝駅」「路線バス＝バス停」「船＝港」「飛行機＝空港」が正しい組み合わせです。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】駅で電車に安全に乗るときの順番に並べましょう。",
        choices: [
        "降りる人が先に降りるのを待つ",
        "ホームの安全な位置で待つ",
        "順番に電車へ乗る",
        "電車が止まり、ドアが開くのを待つ"
        ],
        orderedChoices: [
        "ホームの安全な位置で待つ",
        "電車が止まり、ドアが開くのを待つ",
        "降りる人が先に降りるのを待つ",
        "順番に電車へ乗る"
        ],
        explanation: "「ホームの安全な位置で待つ→電車が止まり、ドアが開くのを待つ→降りる人が先に降りるのを待つ→順番に電車へ乗る」の順です。"
        ),

        QuizQuestion(
        question: "災害のとき、家にいるのが危険な人などが、しばらく安全に過ごすために開かれる場所はどれですか？",
        choices: [
        "避難所",
        "売店",
        "工場",
        "駐車場"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「避難所」です。避難所は、災害などで自宅にいることが難しい人が、安全に過ごすために開かれる場所です。"
        ),

        QuizQuestion(
        question: "市民ホールで行われることとして、最も合うものはどれですか？",
        choices: [
        "野菜を育てる",
        "自動車を修理する",
        "音楽会や発表会を開く",
        "電車を洗う"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「音楽会や発表会を開く」です。市民ホールは、地域の人が音楽会や発表会などに利用することがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】施設の入り口などにあり、場所や利用のしかたを知らせる板を「＿＿」といいます。",
        answer: "あんないばん",
        acceptableAnswers: ["案内板"],
        explanation: "＿＿に入る言葉は「あんないばん」です。案内板には、施設の場所や利用方法などが書かれています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】みんなが利用する場所と、そこで守るとよいことを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "市民ホール", match: "上演中は静かに見る"),
        QuizMatchingPair(prompt: "市民プール", match: "プールサイドを走らない"),
        QuizMatchingPair(prompt: "公衆トイレ", match: "次の人のためにきれいに使う"),
        QuizMatchingPair(prompt: "駅の待合室", match: "荷物で座席をふさがない")
        ],
        choices: [
        "次の人のためにきれいに使う",
        "荷物で座席をふさがない",
        "上演中は静かに見る",
        "プールサイドを走らない"
        ],
        explanation: "「市民ホール＝上演中は静かに見る」「市民プール＝プールサイドを走らない」「公衆トイレ＝次の人のためにきれいに使う」「駅の待合室＝荷物で座席をふさがない」が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "父の日に、感謝の気持ちを伝えることが多い相手はだれですか？",
        choices: [
        "学校の先生",
        "お父さんや父親",
        "駅員さん",
        "お店の店員さん"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「お父さんや父親」です。父の日には、お父さんや父親に日ごろの感謝を伝えることがあります。"
        ),

        QuizQuestion(
        question: "年末に大そうじをすることがある理由として、最も合うものはどれですか？",
        choices: [
        "夏休みに入るため",
        "運動会を始めるため",
        "授業の時間を増やすため",
        "家などをきれいにして新しい年を迎えるため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「家などをきれいにして新しい年を迎えるため」です。年末には、身のまわりをきれいにして新年を迎えるために大そうじをすることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】学校で、一つの学期が終わるときに行う式を「＿＿」といいます。",
        answer: "しゅうぎょうしき",
        acceptableAnswers: ["終業式"],
        explanation: "＿＿に入る言葉は「しゅうぎょうしき」です。終業式は、一つの学期の終わりに行われる学校の行事です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】学校の一年に関係する行事や休みと、その説明を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "始業式", match: "新しい学期が始まる"),
        QuizMatchingPair(prompt: "学芸会", match: "劇や歌などを発表する"),
        QuizMatchingPair(prompt: "夏休み", match: "夏の長い休み"),
        QuizMatchingPair(prompt: "冬休み", match: "冬の長い休み")
        ],
        choices: [
        "冬の長い休み",
        "劇や歌などを発表する",
        "新しい学期が始まる",
        "夏の長い休み"
        ],
        explanation: "「始業式＝新しい学期が始まる」「学芸会＝劇や歌などを発表する」「夏休み＝夏の長い休み」「冬休み＝冬の長い休み」が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】行事を、「学校で行うことが多い行事」と「家庭や地域で行うことが多い行事」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "始業式", match: "学校で行うことが多い行事"),
        QuizMatchingPair(prompt: "学芸会", match: "学校で行うことが多い行事"),
        QuizMatchingPair(prompt: "お盆", match: "家庭や地域で行うことが多い行事"),
        QuizMatchingPair(prompt: "秋祭り", match: "家庭や地域で行うことが多い行事")
        ],
        categories: [
        "学校で行うことが多い行事",
        "家庭や地域で行うことが多い行事"
        ],
        explanation: "始業式と学芸会は「学校で行うことが多い行事」、お盆と秋祭りは「家庭や地域で行うことが多い行事」です。"
        ),

        QuizQuestion(
        question: "はさみを友だちに渡すとき、安全な渡し方はどれですか？",
        choices: [
        "刃先を相手に向けて投げる",
        "開いたまま机の上をすべらせる",
        "刃を閉じ、持ち手を相手に向けて渡す",
        "刃を開いたまま手渡す"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「刃を閉じ、持ち手を相手に向けて渡す」です。はさみを渡すときは刃を閉じ、相手が安全に持てるようにします。"
        ),

        QuizQuestion(
        question: "コンセントの穴に指や物を入れて遊んではいけない一番の理由はどれですか？",
        choices: [
        "感電などの大きなけがにつながる危険があるから",
        "部屋が広くなるから",
        "時計が早く進むから",
        "鉛筆が短くなるから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「感電などの大きなけがにつながる危険があるから」です。コンセントは電気が流れているため、指や物を入れてはいけません。"
        ),

        QuizQuestion(
        question: "階段を歩くとき、持っている荷物で前が見えなくなりました。どうするのが安全ですか？",
        choices: [
        "そのまま急いで階段を下りる",
        "荷物を持ち直して、前が見えるようにしてから進む",
        "目を閉じて歩く",
        "階段の途中に荷物を置いたまま帰る"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「荷物を持ち直して、前が見えるようにしてから進む」です。階段では足元や前をよく見えるようにして、安全に歩くことが大切です。"
        ),

        QuizQuestion.classification(
        question: "【分類】場面を、「小さな声で話すとよい場面」と「元気な声でもよい場面」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "図書館で本を読む人の近く", match: "小さな声で話すとよい場面"),
        QuizMatchingPair(prompt: "病院の待合室", match: "小さな声で話すとよい場面"),
        QuizMatchingPair(prompt: "校庭で友だちを応援するとき", match: "元気な声でもよい場面"),
        QuizMatchingPair(prompt: "運動会の応援席", match: "元気な声でもよい場面")
        ],
        categories: [
        "小さな声で話すとよい場面",
        "元気な声でもよい場面"
        ],
        explanation: "図書館で本を読む人の近くと病院の待合室では小さな声を心がけます。校庭や運動会で応援するときは、まわりの決まりを守りながら元気な声で応援できます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】公衆トイレを利用するときの基本的な順番に並べましょう。",
        choices: [
        "用をすませたら水を流す",
        "列があれば順番を待つ",
        "最後に手を石けんで洗う",
        "空いたところに入って利用する"
        ],
        orderedChoices: [
        "列があれば順番を待つ",
        "空いたところに入って利用する",
        "用をすませたら水を流す",
        "最後に手を石けんで洗う"
        ],
        explanation: "「列があれば順番を待つ→空いたところに入って利用する→用をすませたら水を流す→最後に手を石けんで洗う」の順です。"
        ),

        QuizQuestion(
        question: "学校のみんなに、スピーカーを使ってお知らせを伝えるものはどれですか？",
        choices: [
        "校内放送",
        "黒板",
        "くつ箱",
        "飼育小屋"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「校内放送」です。校内放送は、学校のみんなにお知らせや連絡を伝えるときに使います。"
        ),

        QuizQuestion(
        question: "学校の中で落とし物を見つけたとき、どうするのがよいですか？",
        choices: [
        "自分の家に持ち帰る",
        "見えない場所にかくす",
        "先生に届ける",
        "足でけって動かす"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「先生に届ける」です。学校で落とし物を見つけたら、持ち主に戻るよう先生に届けます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】学校の出入り口にある門を「＿＿」といいます。",
        answer: "こうもん",
        acceptableAnswers: ["校門"],
        explanation: "＿＿に入る言葉は「こうもん」です。学校に入ったり学校から出たりするときに通る門を校門といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】学校の場所を、「校舎の中」と「校舎の外」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "教室", match: "校舎の中"),
        QuizMatchingPair(prompt: "音楽室", match: "校舎の中"),
        QuizMatchingPair(prompt: "校庭", match: "校舎の外"),
        QuizMatchingPair(prompt: "学校の畑", match: "校舎の外")
        ],
        categories: [
        "校舎の中",
        "校舎の外"
        ],
        explanation: "教室と音楽室は「校舎の中」、校庭と学校の畑は「校舎の外」にあります。"
        ),

        QuizQuestion(
        question: "家族で買い物に行く前、必要な品物を忘れないために用意すると便利なものはどれですか？",
        choices: [
        "家のかぎ",
        "買い物メモ",
        "まくら",
        "体温計"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「買い物メモ」です。必要な品物を書いておくと、買い忘れを減らすことができます。"
        ),

        QuizQuestion(
        question: "ぬいだ汚れた服を、洗うまで入れておくものとして最も合うのはどれですか？",
        choices: [
        "冷蔵庫",
        "本棚",
        "傘立て",
        "洗濯かご"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「洗濯かご」です。洗う衣服は洗濯かごにまとめておくと、洗濯の準備がしやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】学校と家族の間で、予定やお知らせなどを伝えるために使うノートを「＿＿」といいます。",
        answer: "れんらくちょう",
        acceptableAnswers: ["連絡帳"],
        explanation: "＿＿に入る言葉は「れんらくちょう」です。連絡帳は、学校と家庭で予定やお知らせなどを伝えるために使います。"
        ),

        QuizQuestion.related(
        question: "【関連付け】家の場所と、そこで行うことを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "台所", match: "料理の手伝いをする"),
        QuizMatchingPair(prompt: "洗面所", match: "歯をみがく"),
        QuizMatchingPair(prompt: "玄関", match: "靴をそろえる"),
        QuizMatchingPair(prompt: "自分の持ち物を置く場所", match: "持ち物を片づける")
        ],
        choices: [
        "歯をみがく",
        "持ち物を片づける",
        "料理の手伝いをする",
        "靴をそろえる"
        ],
        explanation: "「台所＝料理の手伝いをする」「洗面所＝歯をみがく」「玄関＝靴をそろえる」「自分の持ち物を置く場所＝持ち物を片づける」が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "地域で使われる回覧板は、何のために回すものですか？",
        choices: [
        "電車の運転をするため",
        "給食の味を決めるため",
        "地域のお知らせを順番に読むため",
        "学校の宿題を書くため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「地域のお知らせを順番に読むため」です。回覧板は、地域の連絡や行事のお知らせなどを近所で順番に回して読みます。"
        ),

        QuizQuestion(
        question: "家庭のごみを集積場所に出すとき、正しい行動はどれですか？",
        choices: [
        "地域で決められた日と場所に出す",
        "好きな日に道路へ置く",
        "公園のベンチの横に置く",
        "ほかの家の玄関前に置く"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地域で決められた日と場所に出す」です。ごみは、住んでいる地域の決まりに合わせて出します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】道や建物などの場所を、絵や記号で分かりやすく表したものを「＿＿」といいます。",
        answer: "ちず",
        acceptableAnswers: ["地図"],
        explanation: "＿＿に入る言葉は「ちず」です。地図を見ると、道や建物などがどこにあるか確かめることができます。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域のお店を、「食べ物を売る店」と「食べ物以外を売る店」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "八百屋", match: "食べ物を売る店"),
        QuizMatchingPair(prompt: "魚屋", match: "食べ物を売る店"),
        QuizMatchingPair(prompt: "本屋", match: "食べ物以外を売る店"),
        QuizMatchingPair(prompt: "花屋", match: "食べ物以外を売る店")
        ],
        categories: [
        "食べ物を売る店",
        "食べ物以外を売る店"
        ],
        explanation: "八百屋と魚屋は「食べ物を売る店」、本屋と花屋は「食べ物以外を売る店」です。"
        ),

        QuizQuestion(
        question: "夕方や暗い道を歩くとき、自分の姿を車から見つけてもらいやすくするものはどれですか？",
        choices: [
        "黒い紙",
        "消しゴム",
        "ぬいぐるみ",
        "反射材"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「反射材」です。反射材は車のライトなどを反射するため、暗い道で歩行者の姿を見つけてもらいやすくなります。"
        ),

        QuizQuestion(
        question: "自動車に乗ったら、安全のためにすることはどれですか？",
        choices: [
        "窓から体を出す",
        "シートベルトをしめる",
        "座席の上で立つ",
        "ドアを開けたままにする"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「シートベルトをしめる」です。自動車に乗るときは、シートベルトを正しくしめて安全を守ります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】駅で、電車を待ったり乗り降りしたりする場所を「＿＿」といいます。",
        answer: "ホーム",
        acceptableAnswers: ["プラットホーム"],
        explanation: "＿＿に入る言葉は「ホーム」です。駅のホームでは、安全な位置で電車を待ちます。"
        ),

        QuizQuestion.classification(
        question: "【分類】交通に関係する場所を、「電車に関係する場所」と「自動車に関係する場所」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "駅のホーム", match: "電車に関係する場所"),
        QuizMatchingPair(prompt: "線路", match: "電車に関係する場所"),
        QuizMatchingPair(prompt: "駐車場", match: "自動車に関係する場所"),
        QuizMatchingPair(prompt: "ガソリンスタンド", match: "自動車に関係する場所")
        ],
        categories: [
        "電車に関係する場所",
        "自動車に関係する場所"
        ],
        explanation: "駅のホームと線路は「電車に関係する場所」、駐車場とガソリンスタンドは「自動車に関係する場所」です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】自動車に安全に乗ってから降りるまでの行動を、順番に並べましょう。",
        choices: [
        "シートベルトをしめる",
        "自動車に乗って座席に座る",
        "目的地で自動車が完全に止まるのを待つ",
        "シートベルトを外して安全を確かめて降りる"
        ],
        orderedChoices: [
        "自動車に乗って座席に座る",
        "シートベルトをしめる",
        "目的地で自動車が完全に止まるのを待つ",
        "シートベルトを外して安全を確かめて降りる"
        ],
        explanation: "「自動車に乗って座席に座る→シートベルトをしめる→目的地で自動車が完全に止まるのを待つ→シートベルトを外して安全を確かめて降りる」の順です。"
        ),

        QuizQuestion(
        question: "道に迷って家への帰り方が分からないとき、相談する場所として最も合うのはどれですか？",
        choices: [
        "交番",
        "体育館",
        "博物館",
        "映画館"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「交番」です。道に迷ったときなどは、交番の警察官に相談することができます。"
        ),

        QuizQuestion(
        question: "けがをして診てもらう必要があるとき、行く施設として最も合うのはどれですか？",
        choices: [
        "駅",
        "公民館",
        "病院",
        "郵便局"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「病院」です。けがや病気のときは、病院などで医師に診てもらいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】手紙やはがきを送るときに入れる箱を「ゆうびん＿＿」といいます。",
        answer: "ポスト",
        acceptableAnswers: ["ぽすと"],
        explanation: "＿＿に入る言葉は「ポスト」です。手紙やはがきは、切手など必要な準備をして郵便ポストに入れることができます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】みんなが使う施設と、利用するときに守るとよいことを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "図書館", match: "借りた本を期限までに返す"),
        QuizMatchingPair(prompt: "市民体育館", match: "運動用具を大切に使う"),
        QuizMatchingPair(prompt: "公園", match: "遊具を順番に使う"),
        QuizMatchingPair(prompt: "公民館", match: "使ったいすを元の場所に戻す")
        ],
        choices: [
        "遊具を順番に使う",
        "使ったいすを元の場所に戻す",
        "借りた本を期限までに返す",
        "運動用具を大切に使う"
        ],
        explanation: "「図書館＝借りた本を期限までに返す」「市民体育館＝運動用具を大切に使う」「公園＝遊具を順番に使う」「公民館＝使ったいすを元の場所に戻す」が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "節分に、鬼を追い払って福を願うためにまくものはどれですか？",
        choices: [
        "短冊",
        "豆",
        "こいのぼり",
        "鏡もち"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「豆」です。節分には、鬼を追い払って福を願い、豆まきをすることがあります。"
        ),

        QuizQuestion(
        question: "春に、新しく学校へ入る子どもたちを迎える行事はどれですか？",
        choices: [
        "運動会",
        "終業式",
        "卒業式",
        "入学式"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「入学式」です。入学式は、新しく学校へ入る子どもたちを迎える行事です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】季節の行事と、それに関係の深いものを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "お正月", match: "年賀状"),
        QuizMatchingPair(prompt: "ひなまつり", match: "ひなあられ"),
        QuizMatchingPair(prompt: "こどもの日", match: "かしわもち"),
        QuizMatchingPair(prompt: "七五三", match: "千歳あめ")
        ],
        choices: [
        "かしわもち",
        "千歳あめ",
        "年賀状",
        "ひなあられ"
        ],
        explanation: "「お正月＝年賀状」「ひなまつり＝ひなあられ」「こどもの日＝かしわもち」「七五三＝千歳あめ」が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "お正月に、新しい年を迎えたときのあいさつとして最も合うものはどれですか？",
        choices: [
        "あけましておめでとうございます",
        "いただきます",
        "いってきます",
        "おかえりなさい"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「あけましておめでとうございます」です。新しい年を迎えたときに使う、お正月のあいさつです。"
        ),

        QuizQuestion(
        question: "学校の廊下を移動するとき、安全のために大切なことはどれですか？",
        choices: [
        "友だちと競争して走る",
        "曲がり角で飛び出す",
        "走らずに歩く",
        "床に座りこんで遊ぶ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「走らずに歩く」です。廊下では人とぶつかったり転んだりしないよう、走らずに歩きます。"
        ),

        QuizQuestion(
        question: "エスカレーターに乗るとき、安全な行動はどれですか？",
        choices: [
        "段の上を走る",
        "手すりにつかまり、立って乗る",
        "段に座って乗る",
        "進む向きと反対に歩く"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「手すりにつかまり、立って乗る」です。エスカレーターでは走ったり遊んだりせず、安全な姿勢で乗ります。"
        ),

        QuizQuestion.classification(
        question: "【分類】ものの使い方を、「大切に使う行動」と「むだにする行動」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "冷蔵庫のドアを用がすんだら閉める", match: "大切に使う行動"),
        QuizMatchingPair(prompt: "紙を必要な分だけ使う", match: "大切に使う行動"),
        QuizMatchingPair(prompt: "歯みがきの間ずっと水を出しっぱなしにする", match: "むだにする行動"),
        QuizMatchingPair(prompt: "だれも見ていないテレビをつけたままにする", match: "むだにする行動")
        ],
        categories: [
        "大切に使う行動",
        "むだにする行動"
        ],
        explanation: "冷蔵庫のドアを閉めることと紙を必要な分だけ使うことは「大切に使う行動」です。水を出しっぱなしにすることと、だれも見ていないテレビをつけたままにすることは「むだにする行動」です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】場所や場面と、守るとよいことを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "公園の遊具", match: "こわさないよう大切に使う"),
        QuizMatchingPair(prompt: "電車の中", match: "大きな声を出さない"),
        QuizMatchingPair(prompt: "トイレ", match: "使ったあとに水を流す"),
        QuizMatchingPair(prompt: "食事中", match: "食べ物で遊ばない")
        ],
        choices: [
        "食べ物で遊ばない",
        "使ったあとに水を流す",
        "こわさないよう大切に使う",
        "大きな声を出さない"
        ],
        explanation: "「公園の遊具＝こわさないよう大切に使う」「電車の中＝大きな声を出さない」「トイレ＝使ったあとに水を流す」「食事中＝食べ物で遊ばない」が正しい組み合わせです。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】学校で地震の揺れを感じたあとの基本的な行動を、順番に並べましょう。",
        choices: [
        "先生の指示を聞く",
        "机の下に入り、頭を守る",
        "揺れが収まるまで安全な姿勢で待つ",
        "指示に従って落ち着いて避難場所へ移動する"
        ],
        orderedChoices: [
        "机の下に入り、頭を守る",
        "揺れが収まるまで安全な姿勢で待つ",
        "先生の指示を聞く",
        "指示に従って落ち着いて避難場所へ移動する"
        ],
        explanation: "「机の下に入り、頭を守る→揺れが収まるまで安全な姿勢で待つ→先生の指示を聞く→指示に従って落ち着いて避難場所へ移動する」の順です。"
        ),

        QuizQuestion(
        question: "今日の授業で、何を何時間目に学ぶかを確かめたいとき、見るものはどれですか？",
        choices: [
        "時間割",
        "名札",
        "上ばき",
        "ぞうきん"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「時間割」です。時間割を見ると、その日に学ぶ教科や授業の順番を確かめられます。"
        ),

        QuizQuestion(
        question: "給食当番が、食べ物を清潔に配るために服の上から着るものはどれですか？",
        choices: [
        "赤白帽子",
        "レインコート",
        "給食着",
        "水着"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「給食着」です。給食当番は給食着などを身につけ、清潔に気をつけて配ります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】学校で、外ばきの靴を入れておく場所を「＿＿」といいます。",
        answer: "くつばこ",
        acceptableAnswers: ["靴箱", "げたばこ", "下駄箱"],
        explanation: "＿＿に入る言葉は「くつばこ」です。学校では、外ばきの靴をくつばこに入れます。"
        ),

        QuizQuestion.classification(
        question: "【分類】学校で使うものを、「一人ずつ使うもの」と「みんなで使うもの」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "自分の筆箱", match: "一人ずつ使うもの"),
        QuizMatchingPair(prompt: "自分のハンカチ", match: "一人ずつ使うもの"),
        QuizMatchingPair(prompt: "教室の時計", match: "みんなで使うもの"),
        QuizMatchingPair(prompt: "教室のごみ箱", match: "みんなで使うもの")
        ],
        categories: [
        "一人ずつ使うもの",
        "みんなで使うもの"
        ],
        explanation: "自分の筆箱とハンカチは「一人ずつ使うもの」、教室の時計とごみ箱は「みんなで使うもの」です。"
        ),

        QuizQuestion(
        question: "家族が話している途中で、自分も話したくなりました。どうするのがよいですか？",
        choices: [
        "大きな声で話をさえぎる",
        "話が終わるまで聞く",
        "テレビの音を大きくする",
        "別の部屋へ走っていく"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「話が終わるまで聞く」です。相手の話を最後まで聞いてから話すと、おたがいに気持ちよく話せます。"
        ),

        QuizQuestion(
        question: "家族みんなが使う部屋の通り道に、おもちゃが散らばっています。片づけるとよい一番の理由はどれですか？",
        choices: [
        "おもちゃが新しくなるから",
        "部屋が外になるから",
        "電気を使わなくてよくなるから",
        "みんなが安全に歩けて、気持ちよく使えるから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「みんなが安全に歩けて、気持ちよく使えるから」です。通り道を片づけると、つまずく危険も減らせます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】家族の予定を書きこんで、日にちをみんなで確かめるときに便利なものは「＿＿」です。",
        answer: "カレンダー",
        explanation: "＿＿に入る言葉は「カレンダー」です。カレンダーに予定を書いておくと、家族みんなで日にちを確かめられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】家族との場面と、そのときに使う言葉を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "家を出かけるとき", match: "いってきます"),
        QuizMatchingPair(prompt: "家に帰ったとき", match: "ただいま"),
        QuizMatchingPair(prompt: "手伝ってもらったとき", match: "ありがとう"),
        QuizMatchingPair(prompt: "ぶつかってしまったとき", match: "ごめんなさい")
        ],
        choices: [
        "ありがとう",
        "ただいま",
        "ごめんなさい",
        "いってきます"
        ],
        explanation: "「家を出かけるとき＝いってきます」「家に帰ったとき＝ただいま」「手伝ってもらったとき＝ありがとう」「ぶつかってしまったとき＝ごめんなさい」が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "朝、近所の人と道で会ったときのあいさつとして、いちばん合うものはどれですか？",
        choices: [
        "おやすみなさい",
        "いただきます",
        "おはようございます",
        "ごちそうさま"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「おはようございます」です。朝に近所の人と会ったときは、明るくあいさつすると気持ちよく過ごせます。"
        ),

        QuizQuestion(
        question: "地域で防災訓練をする大切な目的はどれですか？",
        choices: [
        "地震や火事のときに安全に行動できるよう練習するため",
        "道路を広くするため",
        "お店の商品を増やすため",
        "季節を変えるため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地震や火事のときに安全に行動できるよう練習するため」です。防災訓練では、災害のときの動き方や避難のしかたを確かめます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】自分の家の近くや、そのまわりの身近なところを「＿＿」といいます。",
        answer: "きんじょ",
        acceptableAnswers: ["近所"],
        explanation: "＿＿に入る言葉は「きんじょ」です。自分の家の近くや、そのまわりの身近なところを近所といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域で見かける人と、その仕事を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ごみ収集員", match: "ごみを集める"),
        QuizMatchingPair(prompt: "バスの運転手", match: "バスを安全に運転する"),
        QuizMatchingPair(prompt: "店員", match: "品物を売る"),
        QuizMatchingPair(prompt: "配達員", match: "荷物を届ける")
        ],
        choices: [
        "荷物を届ける",
        "品物を売る",
        "ごみを集める",
        "バスを安全に運転する"
        ],
        explanation: "「ごみ収集員＝ごみを集める」「バスの運転手＝バスを安全に運転する」「店員＝品物を売る」「配達員＝荷物を届ける」が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "歩道のある道を歩くとき、歩く場所として正しいのはどれですか？",
        choices: [
        "車道の真ん中",
        "道路の中央線の上",
        "止まっている車の間",
        "歩道"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「歩道」です。歩道がある道では、歩行者は歩道を歩きます。"
        ),

        QuizQuestion(
        question: "止まっている車のすぐ前や後ろから道路を渡ると危ないのはなぜですか？",
        choices: [
        "止まっている車が眠っているから",
        "走ってくる車から自分の姿が見えにくいから",
        "道路が短くなるから",
        "信号の色が変わらなくなるから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「走ってくる車から自分の姿が見えにくいから」です。止まっている車があると、おたがいの姿が見えにくくなるので危険です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】歩道のない道では、できるだけ道路の「＿＿がわ」に寄って歩くのが基本です。",
        answer: "みぎ",
        acceptableAnswers: ["右"],
        explanation: "＿＿に入る言葉は「みぎ」です。歩道のない道では、できるだけ道路の右側に寄って歩くのが基本です。"
        ),

        QuizQuestion.classification(
        question: "【分類】道路や駐車場での行動を、「安全な行動」と「危険な行動」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "青信号でも左右を確かめる", match: "安全な行動"),
        QuizMatchingPair(prompt: "歩道を一列で歩く", match: "安全な行動"),
        QuizMatchingPair(prompt: "歩きながらゲームを見る", match: "危険な行動"),
        QuizMatchingPair(prompt: "駐車場で走り回る", match: "危険な行動")
        ],
        categories: [
        "安全な行動",
        "危険な行動"
        ],
        explanation: "左右を確かめることや歩道を一列で歩くことは安全につながります。歩きながらゲームを見ることや駐車場で走り回ることは危険です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】バスに安全に乗るときの順番に並べましょう。",
        choices: [
        "前の人に続いて落ち着いて乗る",
        "バスが完全に止まるのを待つ",
        "バス停の安全な場所で待つ",
        "降りる人が先に降りるのを待つ"
        ],
        orderedChoices: [
        "バス停の安全な場所で待つ",
        "バスが完全に止まるのを待つ",
        "降りる人が先に降りるのを待つ",
        "前の人に続いて落ち着いて乗る"
        ],
        explanation: "「バス停の安全な場所で待つ→バスが完全に止まるのを待つ→降りる人が先に降りるのを待つ→前の人に続いて落ち着いて乗る」の順です。"
        ),

        QuizQuestion(
        question: "昔の道具や地域の資料などを見学して学ぶことができる施設はどれですか？",
        choices: [
        "博物館",
        "交番",
        "駅",
        "郵便局"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「博物館」です。博物館では、昔の道具や地域の資料などの展示を見て学ぶことができます。"
        ),

        QuizQuestion(
        question: "市役所でしていることとして、いちばん合うものはどれですか？",
        choices: [
        "遊園地の乗り物を動かす",
        "電車の切符を売る",
        "地域のくらしに必要な案内や手続きをする",
        "パンを焼いて売る"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「地域のくらしに必要な案内や手続きをする」です。市役所は、地域のくらしを支えるさまざまな仕事をしています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】公共施設と、そこでできることを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "市民体育館", match: "運動をする"),
        QuizMatchingPair(prompt: "博物館", match: "展示を見て学ぶ"),
        QuizMatchingPair(prompt: "市役所", match: "くらしの案内を受ける"),
        QuizMatchingPair(prompt: "地域センター", match: "地域の集まりに参加する")
        ],
        choices: [
        "地域の集まりに参加する",
        "展示を見て学ぶ",
        "運動をする",
        "くらしの案内を受ける"
        ],
        explanation: "「市民体育館＝運動をする」「博物館＝展示を見て学ぶ」「市役所＝くらしの案内を受ける」「地域センター＝地域の集まりに参加する」が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】公共施設を、「学んだり調べたりする場所」と「体を動かす場所」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "図書館", match: "学んだり調べたりする場所"),
        QuizMatchingPair(prompt: "博物館", match: "学んだり調べたりする場所"),
        QuizMatchingPair(prompt: "市民体育館", match: "体を動かす場所"),
        QuizMatchingPair(prompt: "市民プール", match: "体を動かす場所")
        ],
        categories: [
        "学んだり調べたりする場所",
        "体を動かす場所"
        ],
        explanation: "図書館と博物館は「学んだり調べたりする場所」、市民体育館と市民プールは「体を動かす場所」です。"
        ),

        QuizQuestion(
        question: "七夕で、願いごとを書くことが多いものはどれですか？",
        choices: [
        "絵馬",
        "短冊",
        "年賀状",
        "招待状"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「短冊」です。七夕には、願いごとを短冊に書いて笹に飾ることがあります。"
        ),

        QuizQuestion(
        question: "こどもの日に、子どもの成長を願って飾ることがあるものはどれですか？",
        choices: [
        "門松",
        "ひな人形",
        "すすき",
        "こいのぼり"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「こいのぼり」です。こどもの日には、子どもの健やかな成長を願ってこいのぼりを飾ることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】1月1日を「＿＿」といいます。",
        answer: "がんじつ",
        acceptableAnswers: ["元日"],
        explanation: "＿＿に入る言葉は「がんじつ」です。1月1日のことを元日といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】季節と、その季節に行われることが多い行事や楽しみを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "春", match: "お花見"),
        QuizMatchingPair(prompt: "夏", match: "盆踊り"),
        QuizMatchingPair(prompt: "秋", match: "いもほり"),
        QuizMatchingPair(prompt: "冬", match: "もちつき")
        ],
        choices: [
        "もちつき",
        "お花見",
        "いもほり",
        "盆踊り"
        ],
        explanation: "「春＝お花見」「夏＝盆踊り」「秋＝いもほり」「冬＝もちつき」が、季節の行事や楽しみの代表的な組み合わせです。"
        ),

        QuizQuestion(
        question: "借りていたものを、うっかりこわしてしまいました。どうするのがよいですか？",
        choices: [
        "こわれたことをかくして返す",
        "何も言わずに置いておく",
        "持ち主に正直に伝えて謝る",
        "別の人がこわしたことにする"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「持ち主に正直に伝えて謝る」です。借りたものをこわしてしまったときは、かくさずに伝えることが大切です。"
        ),

        QuizQuestion(
        question: "エレベーターに乗るとき、扉が開いて中から人が降りてきました。どうするのがよいですか？",
        choices: [
        "降りる人を先にしてから乗る",
        "扉の前をふさいで待つ",
        "降りる人より先に走って乗る",
        "エレベーターの中で飛びはねる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「降りる人を先にしてから乗る」です。先に降りる人の通り道をあけてから乗ると、安全で気持ちよく利用できます。"
        ),

        QuizQuestion(
        question: "お店で、まだお金を払っていないお菓子の袋はどうするのがよいですか？",
        choices: [
        "少しだけ中身を食べる",
        "勝手に開けず、買ってから開ける",
        "床に置いて帰る",
        "友だちに投げて渡す"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「勝手に開けず、買ってから開ける」です。お店の商品は、お金を払う前に勝手に開けたり食べたりしません。"
        ),

        QuizQuestion.classification(
        question: "【分類】生活の中の行動を、「守りたい行動」と「してはいけない行動」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "使ったあとの蛇口をしっかり閉める", match: "守りたい行動"),
        QuizMatchingPair(prompt: "使っていない部屋の電気を消す", match: "守りたい行動"),
        QuizMatchingPair(prompt: "人の持ち物を勝手に使う", match: "してはいけない行動"),
        QuizMatchingPair(prompt: "公共の壁に落書きをする", match: "してはいけない行動")
        ],
        categories: [
        "守りたい行動",
        "してはいけない行動"
        ],
        explanation: "蛇口を閉めることや使っていない電気を消すことは守りたい行動です。人の持ち物を勝手に使うことや公共の壁への落書きはしてはいけません。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】お店で品物を買うときの順番に並べましょう。",
        choices: [
        "レジで代金を払う",
        "買いたい品物を選ぶ",
        "品物を受け取る",
        "レジの列に並ぶ"
        ],
        orderedChoices: [
        "買いたい品物を選ぶ",
        "レジの列に並ぶ",
        "レジで代金を払う",
        "品物を受け取る"
        ],
        explanation: "「買いたい品物を選ぶ→レジの列に並ぶ→レジで代金を払う→品物を受け取る」の順です。"
        ),

        QuizQuestion(
        question: "学校で気分が悪くなったとき、休んだり手当を受けたりする部屋はどこですか？",
        choices: [
        "保健室",
        "図工室",
        "音楽室",
        "職員室"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「保健室」です。学校で気分が悪くなったときは、保健室で休んだり手当を受けたりします。"
        ),

        QuizQuestion(
        question: "教室の床をそうじするときに使うものはどれですか？",
        choices: [
        "じょうろ",
        "定規",
        "ほうき",
        "なわとび"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「ほうき」です。ほうきは、教室の床のごみやほこりを集めるときに使います。"
        ),

        QuizQuestion(
        question: "学校で先生たちが打ち合わせや仕事をする部屋はどこですか？",
        choices: [
        "保健室",
        "職員室",
        "図書室",
        "体育館"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「職員室」です。職員室は、先生たちが打ち合わせをしたり仕事をしたりする部屋です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】授業の始まりや終わりを知らせる音を「＿＿」といいます。",
        answer: "チャイム",
        explanation: "＿＿に入る言葉は「チャイム」です。チャイムは、授業の始まりや終わりなどを知らせる合図です。"
        ),

        QuizQuestion.classification(
        question: "【分類】学校にあるものを、主に使う場所で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "黒板", match: "教室"),
        QuizMatchingPair(prompt: "机", match: "教室"),
        QuizMatchingPair(prompt: "鉄棒", match: "校庭"),
        QuizMatchingPair(prompt: "ジャングルジム", match: "校庭")
        ],
        categories: [
        "教室",
        "校庭"
        ],
        explanation: "黒板と机は「教室」、鉄棒とジャングルジムは「校庭」で主に使います。"
        ),

        QuizQuestion(
        question: "家族が家に帰ってきたときに言うあいさつはどれですか？",
        choices: [
        "いただきます",
        "おやすみなさい",
        "さようなら",
        "おかえりなさい"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「おかえりなさい」です。家に帰ってきた家族を迎えるときに使うあいさつです。"
        ),

        QuizQuestion(
        question: "食事のあと、家族のお手伝いとしてよい行動はどれですか？",
        choices: [
        "食器を台所まで運ぶ",
        "食べた食器を床に置く",
        "いすの上に立つ",
        "食べ物を投げる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「食器を台所まで運ぶ」です。食事のあとに食器を運ぶことは、家族のお手伝いになります。"
        ),

        QuizQuestion(
        question: "家族で出かける時間を前もって伝え合うと、どんないいことがありますか？",
        choices: [
        "テレビの音が大きくなる",
        "部屋が広くなる",
        "みんなが予定を知って準備できる",
        "雨が降らなくなる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「みんなが予定を知って準備できる」です。出かける時間を伝え合うと、家族が予定に合わせて準備できます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】家族と食事を始める前に言うあいさつは「＿＿」です。",
        answer: "いただきます",
        explanation: "＿＿に入る言葉は「いただきます」です。食事を始める前のあいさつとして使います。"
        ),

        QuizQuestion.related(
        question: "【関連付け】家族でできるお手伝いと、使うものを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "食器をふく", match: "ふきん"),
        QuizMatchingPair(prompt: "花に水をあげる", match: "じょうろ"),
        QuizMatchingPair(prompt: "ごみを集める", match: "ごみ袋"),
        QuizMatchingPair(prompt: "洗濯物を干す", match: "洗濯ばさみ")
        ],
        choices: [
        "ごみ袋",
        "洗濯ばさみ",
        "ふきん",
        "じょうろ"
        ],
        explanation: "「食器をふく＝ふきん」「花に水をあげる＝じょうろ」「ごみを集める＝ごみ袋」「洗濯物を干す＝洗濯ばさみ」が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "地域の掲示板を見ると、何が分かることがありますか？",
        choices: [
        "外国の天気だけ",
        "地域の行事やお知らせ",
        "ゲームの点数",
        "自分の身長"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「地域の行事やお知らせ」です。地域の掲示板には、行事やくらしに関するお知らせが出ることがあります。"
        ),

        QuizQuestion(
        question: "近所の人たちと道路わきのごみを拾う活動は、何のために行いますか？",
        choices: [
        "車を速く走らせるため",
        "ごみを増やすため",
        "店を閉めるため",
        "地域をきれいにするため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「地域をきれいにするため」です。ごみ拾いは、みんなが気持ちよく暮らせる地域にするための活動です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】家の近くの人や場所をまとめて「＿＿」と呼ぶことがあります。",
        answer: "ちいき",
        acceptableAnswers: ["地域"],
        explanation: "＿＿に入る言葉は「ちいき」です。家の近くの人や場所をまとめて、地域と呼ぶことがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】まちで見つけたものを「しぜん」と「たてもの」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "川", match: "しぜん"),
        QuizMatchingPair(prompt: "大きな木", match: "しぜん"),
        QuizMatchingPair(prompt: "交番", match: "たてもの"),
        QuizMatchingPair(prompt: "パン屋", match: "たてもの")
        ],
        categories: [
        "しぜん",
        "たてもの"
        ],
        explanation: "川と大きな木は「しぜん」、交番とパン屋は「たてもの」に分けられます。"
        ),

        QuizQuestion(
        question: "歩行者用信号が赤のとき、どうしますか？",
        choices: [
        "止まって待つ",
        "急いで渡る",
        "道路で遊ぶ",
        "車の間を走る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「止まって待つ」です。歩行者用信号が赤のときは、渡らずに安全な場所で待ちます。"
        ),

        QuizQuestion(
        question: "遊んでいたボールが道路に転がったとき、まずどうしますか？",
        choices: [
        "すぐに追いかける",
        "道路の真ん中で待つ",
        "道路に飛び出さず、安全な場所で止まる",
        "車が来る前に走って取る"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「道路に飛び出さず、安全な場所で止まる」です。ボールを追って道路へ飛び出すと危険です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】交通の場所と、安全のために気をつけることを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "歩道", match: "車道に出ないで歩く"),
        QuizMatchingPair(prompt: "バス停", match: "道路に出ずに待つ"),
        QuizMatchingPair(prompt: "駐車場", match: "動く車に気をつける"),
        QuizMatchingPair(prompt: "踏切", match: "遮断機が下りたら入らない")
        ],
        choices: [
        "動く車に気をつける",
        "遮断機が下りたら入らない",
        "車道に出ないで歩く",
        "道路に出ずに待つ"
        ],
        explanation: "「歩道＝車道に出ないで歩く」「バス停＝道路に出ずに待つ」「駐車場＝動く車に気をつける」「踏切＝遮断機が下りたら入らない」が正しい組み合わせです。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】道路を安全に渡るときの確認の順番に並べましょう。",
        choices: [
        "左を見る",
        "もう一度右を見て、安全なら渡る",
        "道路の手前で止まる",
        "右を見る"
        ],
        orderedChoices: [
        "道路の手前で止まる",
        "右を見る",
        "左を見る",
        "もう一度右を見て、安全なら渡る"
        ],
        explanation: "「道路の手前で止まる→右を見る→左を見る→もう一度右を見て、安全なら渡る」の順に確認します。"
        ),

        QuizQuestion(
        question: "子どもが遊んだり、工作や行事に参加したりできる公共施設はどれですか？",
        choices: [
        "銀行",
        "児童館",
        "工場",
        "ガソリンスタンド"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「児童館」です。児童館は、子どもが遊んだり、いろいろな活動に参加したりできる公共施設です。"
        ),

        QuizQuestion(
        question: "地域の人たちが集会や講座などで使うことがある施設はどれですか？",
        choices: [
        "コンビニ",
        "郵便ポスト",
        "駐車場",
        "公民館"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「公民館」です。公民館は、地域の人たちが集会や学習などに使うことがある施設です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】火事のときに消防車が出動する施設は「＿＿」です。",
        answer: "しょうぼうしょ",
        acceptableAnswers: ["消防署"],
        explanation: "＿＿に入る言葉は「しょうぼうしょ」です。消防署から消防車が出動し、火事の消火や救助に向かいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】場所を「公共施設」と「お店」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "市役所", match: "公共施設"),
        QuizMatchingPair(prompt: "児童館", match: "公共施設"),
        QuizMatchingPair(prompt: "パン屋", match: "お店"),
        QuizMatchingPair(prompt: "コンビニ", match: "お店")
        ],
        categories: [
        "公共施設",
        "お店"
        ],
        explanation: "市役所と児童館は「公共施設」、パン屋とコンビニは「お店」に分けられます。"
        ),

        QuizQuestion(
        question: "5月5日の行事はどれですか？",
        choices: [
        "ひなまつり",
        "七夕",
        "こどもの日",
        "節分"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「こどもの日」です。こどもの日は5月5日です。"
        ),

        QuizQuestion(
        question: "7月7日の行事はどれですか？",
        choices: [
        "七夕",
        "お正月",
        "こどもの日",
        "敬老の日"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「七夕」です。七夕は7月7日の行事です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】季節の行事と、よく見られるものを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "お正月", match: "かがみもち"),
        QuizMatchingPair(prompt: "ひなまつり", match: "ひな人形"),
        QuizMatchingPair(prompt: "お月見", match: "すすき"),
        QuizMatchingPair(prompt: "大みそか", match: "年越しそば")
        ],
        choices: [
        "すすき",
        "年越しそば",
        "かがみもち",
        "ひな人形"
        ],
        explanation: "「お正月＝かがみもち」「ひなまつり＝ひな人形」「お月見＝すすき」「大みそか＝年越しそば」が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】行事を、行われる月に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "節分", match: "2月"),
        QuizMatchingPair(prompt: "母の日", match: "5月"),
        QuizMatchingPair(prompt: "敬老の日", match: "9月"),
        QuizMatchingPair(prompt: "七五三", match: "11月")
        ],
        categories: [
        "2月",
        "5月",
        "9月",
        "11月"
        ],
        explanation: "節分は「2月」、母の日は「5月」、敬老の日は「9月」、七五三は「11月」に行われます。"
        ),

        QuizQuestion(
        question: "使ったおもちゃや道具は、使い終わったらどうするとよいですか？",
        choices: [
        "そのまま床に置く",
        "もとの場所に片づける",
        "外に投げる",
        "人の机に置く"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「もとの場所に片づける」です。使ったものを元の場所に戻すと、次に使う人も使いやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ごみは、決められた「＿＿」に捨てます。",
        answer: "ごみばこ",
        acceptableAnswers: ["ごみ箱"],
        explanation: "＿＿に入る言葉は「ごみばこ」です。ごみは、決められたごみ箱に捨てます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】場面と、守るとよい行動を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "人の話を聞くとき", match: "おしゃべりをやめて聞く"),
        QuizMatchingPair(prompt: "せきやくしゃみが出るとき", match: "口をおおう"),
        QuizMatchingPair(prompt: "借りたものを使い終えたとき", match: "持ち主に返す"),
        QuizMatchingPair(prompt: "列に並ぶとき", match: "前の人を押さない")
        ],
        choices: [
        "持ち主に返す",
        "前の人を押さない",
        "口をおおう",
        "おしゃべりをやめて聞く"
        ],
        explanation: "「人の話を聞くとき＝おしゃべりをやめて聞く」「せきやくしゃみが出るとき＝口をおおう」「借りたものを使い終えたとき＝持ち主に返す」「列に並ぶとき＝前の人を押さない」が正しい組み合わせです。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】石けんで手を洗うときの順番に並べましょう。",
        choices: [
        "石けんをつける",
        "水でよく洗い流す",
        "手を水でぬらす",
        "手のひらや指の間をよくこする"
        ],
        orderedChoices: [
        "手を水でぬらす",
        "石けんをつける",
        "手のひらや指の間をよくこする",
        "水でよく洗い流す"
        ],
        explanation: "「手を水でぬらす→石けんをつける→手のひらや指の間をよくこする→水でよく洗い流す」の順です。"
        ),

    ]
        
    @State private var shuffledQuizList: [QuizQuestion]
    private var authManager = AuthManager()
    private var audioManager = AudioManager.shared

    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
        _shuffledQuizList = State(initialValue: sociallyBalancedShuffledQuizList(quizBeginnerList))
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
