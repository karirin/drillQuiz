//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Shakai4ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.chronological(
            question: "【年代順に並べる】出来事を 古い順に 並べましょう。",
            choices: ["江戸幕府が はじまる", "平安京に 都を うつす", "室町幕府が はじまる", "鎌倉幕府が はじまる"],
            orderedChoices: ["平安京に 都を うつす", "鎌倉幕府が はじまる", "室町幕府が はじまる", "江戸幕府が はじまる"],
            explanation: "平安京、鎌倉幕府、室町幕府、江戸幕府の順に 時代が 進みます。"
        ),

        QuizQuestion.related(
            question: "【関連付け】都道府県と 県庁所在地が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "大阪府", match: "大阪市"),
                QuizMatchingPair(prompt: "北海道", match: "札幌市"),
                QuizMatchingPair(prompt: "沖縄県", match: "那覇市")
            ],
            choices: ["札幌市", "那覇市", "大阪市"],
            explanation: "大阪府の 県庁所在地は 大阪市、北海道は 札幌市、沖縄県は 那覇市です。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】人口が 多い順に 並べましょう。",
            choices: ["北海道", "東京都", "大阪府"],
            rankedChoices: ["東京都", "大阪府", "北海道"],
            explanation: "人口が 一番 多いのは 東京都で、その次が 大阪府です。"
        ),

        QuizQuestion.related(
            question: "【関連付け】地方と そこに 含まれる都道府県が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "関東地方", match: "東京都"),
                QuizMatchingPair(prompt: "東北地方", match: "宮城県"),
                QuizMatchingPair(prompt: "近畿地方", match: "大阪府")
            ],
            choices: ["東京都", "宮城県", "大阪府"],
            explanation: "東京都は 関東、宮城県は 東北、大阪府は 近畿地方に 含まれます。"
        ),

        QuizQuestion.classification(
            question: "【分類】都道府県を 地方で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "宮城県", match: "東北地方"),
                QuizMatchingPair(prompt: "千葉県", match: "関東地方"),
                QuizMatchingPair(prompt: "京都府", match: "近畿地方")
            ],
            categories: ["東北地方", "関東地方", "近畿地方"],
            explanation: "宮城県は 東北、千葉県は 関東、京都府は 近畿地方に 含まれます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】面積が 広い順に 並べましょう。",
            choices: ["北海道", "大阪府", "東京都"],
            rankedChoices: ["北海道", "東京都", "大阪府"],
            explanation: "面積が いちばん 広いのは 北海道で、その次が 東京都、大阪府です。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】歴史の出来事を 古い順に 並べましょう。",
            choices: ["明治維新", "室町幕府が はじまる", "鎌倉幕府が はじまる", "江戸幕府が はじまる"],
            orderedChoices: ["鎌倉幕府が はじまる", "室町幕府が はじまる", "江戸幕府が はじまる", "明治維新"],
            explanation: "鎌倉、室町、江戸、明治の順に 時代が 進みます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】地方を 東から 西の 順に 並べましょう。",
            choices: ["中部地方", "近畿地方", "関東地方"],
            rankedChoices: ["関東地方", "中部地方", "近畿地方"],
            explanation: "東から見ていくと、関東地方、中部地方、近畿地方の順です。"
        ),

        QuizQuestion.related(
            question: "【関連付け】歴史人物と したことが 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "聖徳太子", match: "十七条の憲法"),
                QuizMatchingPair(prompt: "源頼朝", match: "鎌倉幕府"),
                QuizMatchingPair(prompt: "徳川家康", match: "江戸幕府")
            ],
            choices: ["十七条の憲法", "鎌倉幕府", "江戸幕府"],
            explanation: "聖徳太子は 十七条の憲法、源頼朝は 鎌倉幕府、徳川家康は 江戸幕府と 関わります。"
        ),

        QuizQuestion.classification(
            question: "【分類】出来事を 時代で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "平安京に 都を 移す", match: "古代"),
                QuizMatchingPair(prompt: "鎌倉幕府が 始まる", match: "中世"),
                QuizMatchingPair(prompt: "明治維新", match: "近代")
            ],
            categories: ["古代", "中世", "近代"],
            explanation: "平安京は 古代、鎌倉幕府は 中世、明治維新は 近代の 出来事です。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】人物を 活躍した順に 並べましょう。",
            choices: ["徳川家康", "源頼朝", "聖徳太子"],
            orderedChoices: ["聖徳太子", "源頼朝", "徳川家康"],
            explanation: "活躍した順に、聖徳太子、源頼朝、徳川家康です。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】湖の 面積が 広い順に 並べましょう。",
            choices: ["猪苗代湖", "琵琶湖", "霞ヶ浦"],
            rankedChoices: ["琵琶湖", "霞ヶ浦", "猪苗代湖"],
            explanation: "湖の 面積は、琵琶湖、霞ヶ浦、猪苗代湖の順に 広いです。"
        ),

        QuizQuestion.related(
            question: "【関連付け】歴史人物と したことが 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "卑弥呼", match: "邪馬台国"),
                QuizMatchingPair(prompt: "聖武天皇", match: "東大寺の 大仏"),
                QuizMatchingPair(prompt: "福沢諭吉", match: "学問を 広める")
            ],
            choices: ["東大寺の 大仏", "学問を 広める", "邪馬台国"],
            explanation: "卑弥呼は 邪馬台国、聖武天皇は 東大寺の大仏、福沢諭吉は 学問を広めたことで 知られています。"
        ),

        QuizQuestion.classification(
            question: "【分類】出来事を 時代で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "大仏が 作られる", match: "古代"),
                QuizMatchingPair(prompt: "鎌倉幕府が 始まる", match: "中世"),
                QuizMatchingPair(prompt: "江戸幕府が 始まる", match: "近世")
            ],
            categories: ["古代", "中世", "近世"],
            explanation: "大仏が作られたのは 古代、鎌倉幕府は 中世、江戸幕府は 近世の 出来事です。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】出来事を 古い順に 並べましょう。",
            choices: ["鎌倉幕府が 始まる", "平安京に 都を 移す", "東京が 都の 中心に なる"],
            orderedChoices: ["平安京に 都を 移す", "鎌倉幕府が 始まる", "東京が 都の 中心に なる"],
            explanation: "平安京、鎌倉幕府、東京の順に 時代が 進みます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】都道府県を 北から 南の 順に 並べましょう。",
            choices: ["沖縄県", "宮城県", "静岡県"],
            rankedChoices: ["宮城県", "静岡県", "沖縄県"],
            explanation: "北から見ると、宮城県、静岡県、沖縄県の順です。"
        ),

        QuizQuestion(
            question: "織田信長が活躍した時代はどれですか？",
            choices: [
                "戦国時代",
                "江戸時代",
                "平安時代",
                "昭和時代"
            ],
            correctAnswerIndex: 0,
            explanation: "織田信長は戦国時代の武将で、日本の統一に貢献しました。"
        ),
        QuizQuestion(
            question: "明治時代に日本の近代化を進めた人物は誰ですか？",
            choices: [
                "徳川家康",
                "西郷隆盛",
                "伊藤博文",
                "足利尊氏"
            ],
            correctAnswerIndex: 2,
            explanation: "伊藤博文は明治時代に日本の近代化を進めた重要な人物です。"
        ),
        QuizQuestion(
            question: "江戸幕府を開いたのは誰ですか？",
            choices: [
                "織田信長",
                "豊臣秀吉",
                "徳川家康",
                "武田信玄"
            ],
            correctAnswerIndex: 2,
            explanation: "徳川家康は江戸幕府を開き、260年間の安定した時代を築きました。"
        ),
        QuizQuestion(
            question: "日本の一番高い山はどれですか？",
            choices: [
                "富士山",
                "白馬岳",
                "槍ヶ岳",
                "北岳"
            ],
            correctAnswerIndex: 0,
            explanation: "富士山は日本一高い山で、標高は約3,776メートルです。"
        ),
        QuizQuestion(
            question: "戦国時代に全国統一を目指した武将は誰ですか？",
            choices: [
                "武田信玄",
                "豊臣秀吉",
                "上杉謙信",
                "北条氏康"
            ],
            correctAnswerIndex: 1,
            explanation: "豊臣秀吉は全国統一を目指し、大名を従える力を持っていました。"
        ),
        QuizQuestion(
            question: "京都府の県庁所在地はどこですか？",
            choices: [
                "奈良市",
                "大阪市",
                "京都市",
                "神戸市"
            ],
            correctAnswerIndex: 2,
            explanation: "京都府の県庁所在地は京都市です。"
        ),
        QuizQuestion(
            question: "日本で一番面積が広い都道府県はどこですか？",
            choices: [
                "東京都",
                "北海道",
                "青森県",
                "岩手県"
            ],
            correctAnswerIndex: 1,
            explanation: "北海道は日本で一番面積が広い都道府県です。"
        ),
        QuizQuestion(
            question: "鎌倉幕府を開いたのは誰ですか？",
            choices: [
                "徳川家康",
                "織田信長",
                "足利尊氏",
                "源頼朝"
            ],
            correctAnswerIndex: 3,
            explanation: "源頼朝は鎌倉幕府を開いた武将です。"
        ),
        QuizQuestion(
            question: "広島県の県庁所在地はどこですか？",
            choices: [
                "広島市",
                "呉市",
                "尾道市",
                "福山市"
            ],
            correctAnswerIndex: 0,
            explanation: "広島県の県庁所在地は広島市です。"
        ),
        QuizQuestion(
            question: "日本の総人口が一番多い都道府県はどこですか？",
            choices: [
                "大阪府",
                "東京都",
                "神奈川県",
                "愛知県"
            ],
            correctAnswerIndex: 1,
            explanation: "東京都は日本の都道府県の中で最も人口が多いです。"
        ),
        QuizQuestion(
            question: "明治維新で日本の近代化を進めた政策はどれですか？",
            choices: [
                "武家諸法度",
                "遣唐使",
                "五箇条の御誓文",
                "鎖国令"
            ],
            correctAnswerIndex: 2,
            explanation: "五箇条の御誓文は明治維新の一環として発布され、日本の近代化を進めました。"
        ),
        QuizQuestion(
            question: "愛知県の県庁所在地はどこですか？",
            choices: [
                "名古屋市",
                "豊田市",
                "岡崎市",
                "一宮市"
            ],
            correctAnswerIndex: 0,
            explanation: "愛知県の県庁所在地は名古屋市です。"
        ),
        QuizQuestion(
            question: "江戸時代に日本を統治したのはどの一族ですか？",
            choices: [
                "徳川家",
                "織田家",
                "豊臣家",
                "上杉家"
            ],
            correctAnswerIndex: 0,
            explanation: "江戸時代は徳川家が日本を統治しました。"
        ),
        QuizQuestion(
            question: "日本で一番長い川はどれですか？",
            choices: [
                "利根川",
                "信濃川",
                "木曽川",
                "四万十川"
            ],
            correctAnswerIndex: 1,
            explanation: "信濃川は日本で最も長い川で、全長は約367kmです。"
        ),
        QuizQuestion(
            question: "新潟県の県庁所在地はどこですか？",
            choices: [
                "長岡市",
                "上越市",
                "新潟市",
                "佐渡市"
            ],
            correctAnswerIndex: 2,
            explanation: "新潟県の県庁所在地は新潟市です。"
        ),
        QuizQuestion(
            question: "日本で一番小さい面積を持つ都道府県はどこですか？",
            choices: [
                "香川県",
                "大阪府",
                "東京都",
                "沖縄県"
            ],
            correctAnswerIndex: 0,
            explanation: "香川県は日本で最も面積が小さい都道府県です。"
        ),
        QuizQuestion(
            question: "戦国時代の終わりに天下統一を果たした武将は誰ですか？",
            choices: [
                "豊臣秀吉",
                "織田信長",
                "徳川家康",
                "武田信玄"
            ],
            correctAnswerIndex: 0,
            explanation: "豊臣秀吉は戦国時代の終わりに天下統一を果たしました。"
        ),
        QuizQuestion(
            question: "山梨県の県庁所在地はどこですか？",
            choices: [
                "甲府市",
                "富士吉田市",
                "都留市",
                "山中湖村"
            ],
            correctAnswerIndex: 0,
            explanation: "山梨県の県庁所在地は甲府市です。"
        ),
        QuizQuestion(
            question: "江戸時代に禁止されたキリスト教の信仰は、いつ再び許されましたか？",
            choices: [
                "明治時代",
                "平安時代",
                "昭和時代",
                "戦国時代"
            ],
            correctAnswerIndex: 0,
            explanation: "江戸時代に禁止されたキリスト教は、明治時代に再び許されました。"
        ),
        QuizQuestion(
            question: "兵庫県の県庁所在地はどこですか？",
            choices: [
                "神戸市",
                "姫路市",
                "西宮市",
                "尼崎市"
            ],
            correctAnswerIndex: 0,
            explanation: "兵庫県の県庁所在地は神戸市です。"
        ),
        QuizQuestion(
            question: "日本で最も大きな湖はどれですか？",
            choices: [
                "十和田湖",
                "霞ヶ浦",
                "琵琶湖",
                "猪苗代湖"
            ],
            correctAnswerIndex: 2,
            explanation: "琵琶湖は日本最大の湖で、滋賀県にあります。"
        ),
        QuizQuestion(
            question: "平安時代に京都に作られた宮殿の名前は何ですか？",
            choices: [
                "平城京",
                "平安京",
                "大内裏",
                "紫宸殿"
            ],
            correctAnswerIndex: 1,
            explanation: "平安時代に作られた京都の宮殿は平安京です。"
        ),
        QuizQuestion(
            question: "長野県の県庁所在地はどこですか？",
            choices: [
                "松本市",
                "長野市",
                "諏訪市",
                "伊那市"
            ],
            correctAnswerIndex: 1,
            explanation: "長野県の県庁所在地は長野市です。"
        ),
        QuizQuestion(
            question: "平安時代に日本全国を巡りながら信仰を広めた僧侶は誰ですか？",
            choices: [
                "最澄",
                "空海",
                "法然",
                "親鸞"
            ],
            correctAnswerIndex: 1,
            explanation: "空海は平安時代の僧侶で、日本全国を巡りながら信仰を広めました。"
        ),
        QuizQuestion(
            question: "静岡県の県庁所在地はどこですか？",
            choices: [
                "静岡市",
                "浜松市",
                "富士市",
                "熱海市"
            ],
            correctAnswerIndex: 0,
            explanation: "静岡県の県庁所在地は静岡市です。"
        ),
        QuizQuestion(
            question: "日本の気候に大きな影響を与える山脈はどれですか？",
            choices: [
                "阿蘇山",
                "北アルプス",
                "中央アルプス",
                "日本アルプス"
            ],
            correctAnswerIndex: 3,
            explanation: "日本アルプスは本州中央部に位置し、日本の気候に大きな影響を与えています。"
        ),
        QuizQuestion(
            question: "奈良時代に成立した日本最古の正史はどれですか？",
            choices: [
                "古事記",
                "日本書紀",
                "万葉集",
                "源氏物語"
            ],
            correctAnswerIndex: 1,
            explanation: "日本書紀は奈良時代に成立した日本最古の正史です。"
        ),
        QuizQuestion(
            question: "宮城県の県庁所在地はどこですか？",
            choices: [
                "仙台市",
                "石巻市",
                "気仙沼市",
                "名取市"
            ],
            correctAnswerIndex: 0,
            explanation: "宮城県の県庁所在地は仙台市です。"
        ),
        QuizQuestion(
            question: "日本の最南端にある島はどこですか？",
            choices: [
                "与那国島",
                "沖ノ鳥島",
                "石垣島",
                "屋久島"
            ],
            correctAnswerIndex: 1,
            explanation: "沖ノ鳥島は日本の最南端に位置する小さな島です。"
        ),
        QuizQuestion(
            question: "奈良県の県庁所在地はどこですか？",
            choices: [
                "奈良市",
                "天理市",
                "橿原市",
                "桜井市"
            ],
            correctAnswerIndex: 0,
            explanation: "奈良県の県庁所在地は奈良市です。"
        ),
        QuizQuestion(
            question: "平安時代に最も栄えた文化は何ですか？",
            choices: [
                "鎌倉文化",
                "国風文化",
                "天平文化",
                "江戸文化"
            ],
            correctAnswerIndex: 1,
            explanation: "平安時代には、国風文化が最も栄えました。"
        ),
        QuizQuestion(
            question: "佐賀県の県庁所在地はどこですか？",
            choices: [
                "唐津市",
                "佐賀市",
                "伊万里市",
                "鳥栖市"
            ],
            correctAnswerIndex: 1,
            explanation: "佐賀県の県庁所在地は佐賀市です。"
        ),
        QuizQuestion(
            question: "明治時代に日本初の鉄道が開通した区間はどこですか？",
            choices: [
                "東京～横浜",
                "京都～大阪",
                "東京～名古屋",
                "大阪～神戸"
            ],
            correctAnswerIndex: 0,
            explanation: "日本初の鉄道は明治時代に東京から横浜の区間で開通しました。"
        ),
        QuizQuestion(
            question: "島根県の県庁所在地はどこですか？",
            choices: [
                "松江市",
                "出雲市",
                "益田市",
                "浜田市"
            ],
            correctAnswerIndex: 0,
            explanation: "島根県の県庁所在地は松江市です。"
        ),
        QuizQuestion(
            question: "長崎県の県庁所在地はどこですか？",
            choices: [
                "長崎市",
                "佐世保市",
                "大村市",
                "島原市"
            ],
            correctAnswerIndex: 0,
            explanation: "長崎県の県庁所在地は長崎市です。"
        ),
        QuizQuestion(
            question: "福島県の県庁所在地はどこですか？",
            choices: [
                "会津若松市",
                "郡山市",
                "福島市",
                "白河市"
            ],
            correctAnswerIndex: 2,
            explanation: "福島県の県庁所在地は福島市です。"
        ),
        QuizQuestion(
            question: "日本で一番長いトンネルはどれですか？",
            choices: [
                "関越トンネル",
                "青函トンネル",
                "飛騨トンネル",
                "中央道トンネル"
            ],
            correctAnswerIndex: 1,
            explanation: "青函トンネルは日本で一番長いトンネルで、北海道と本州を結んでいます。"
        ),
        QuizQuestion(
            question: "日本の四季の中で、田植えが最も行われる季節はどれですか？",
            choices: [
                "春",
                "夏",
                "秋",
                "冬"
            ],
            correctAnswerIndex: 0,
            explanation: "田植えは日本で主に春に行われます。"
        ),
        QuizQuestion(
            question: "鳥取県の県庁所在地はどこですか？",
            choices: [
                "鳥取市",
                "倉吉市",
                "米子市",
                "境港市"
            ],
            correctAnswerIndex: 0,
            explanation: "鳥取県の県庁所在地は鳥取市です。"
        ),
        QuizQuestion(
            question: "和歌山県の県庁所在地はどこですか？",
            choices: [
                "田辺市",
                "新宮市",
                "和歌山市",
                "海南市"
            ],
            correctAnswerIndex: 2,
            explanation: "和歌山県の県庁所在地は和歌山市です。"
        ),
        QuizQuestion(
            question: "明治時代に発布された、日本初の近代憲法はどれですか？",
            choices: [
                "日本国憲法",
                "五箇条の御誓文",
                "大日本帝国憲法",
                "鎖国令"
            ],
            correctAnswerIndex: 2,
            explanation: "大日本帝国憲法は明治時代に発布された日本初の近代憲法です。"
        ),
        QuizQuestion(
            question: "群馬県の県庁所在地はどこですか？",
            choices: [
                "高崎市",
                "前橋市",
                "伊勢崎市",
                "太田市"
            ],
            correctAnswerIndex: 1,
            explanation: "群馬県の県庁所在地は前橋市です。"
        ),
        QuizQuestion(
            question: "四国地方で最も面積が広い県はどこですか？",
            choices: [
                "愛媛県",
                "徳島県",
                "高知県",
                "香川県"
            ],
            correctAnswerIndex: 2,
            explanation: "四国地方で最も面積が広いのは高知県です。"
        ),
        QuizQuestion(
            question: "第二次世界大戦後、1947年に施行された日本の現行憲法はどれですか？",
            choices: [
                "日本国憲法",
                "大日本帝国憲法",
                "明治憲法",
                "五箇条の御誓文"
            ],
            correctAnswerIndex: 0,
            explanation: "1947年に施行された日本の現行憲法は日本国憲法です。"
        ),
        QuizQuestion(
            question: "岡山県の県庁所在地はどこですか？",
            choices: [
                "岡山市",
                "倉敷市",
                "津山市",
                "笠岡市"
            ],
            correctAnswerIndex: 0,
            explanation: "岡山県の県庁所在地は岡山市です。"
        ),
        QuizQuestion(
            question: "岩手県の県庁所在地はどこですか？",
            choices: [
                "盛岡市",
                "花巻市",
                "一関市",
                "宮古市"
            ],
            correctAnswerIndex: 0,
            explanation: "岩手県の県庁所在地は盛岡市です。"
        ),
        QuizQuestion(
            question: "日本で最も大きい島はどこですか？",
            choices: [
                "九州",
                "四国",
                "本州",
                "北海道"
            ],
            correctAnswerIndex: 2,
            explanation: "本州は日本で最も大きい島です。"
        ),
        QuizQuestion(
            question: "第二次世界大戦中、日本に原子爆弾が投下された都市はどこですか？",
            choices: [
                "広島市",
                "京都市",
                "大阪市",
                "福岡市"
            ],
            correctAnswerIndex: 0,
            explanation: "第二次世界大戦中、広島市と長崎市に原子爆弾が投下されました。"
        ),
        QuizQuestion(
            question: "日本の国花は何ですか？",
            choices: [
                "梅",
                "桜",
                "菊",
                "牡丹"
            ],
            correctAnswerIndex: 1,
            explanation: "桜は日本の国花として広く知られています。"
        ),
        QuizQuestion(
            question: "秋田県の県庁所在地はどこですか？",
            choices: [
                "秋田市",
                "横手市",
                "大館市",
                "能代市"
            ],
            correctAnswerIndex: 0,
            explanation: "秋田県の県庁所在地は秋田市です。"
        ),
        QuizQuestion(
            question: "戦国時代に最も力を持った武将の一人、上杉謙信はどの地域を支配していましたか？",
            choices: [
                "越後",
                "甲斐",
                "近江",
                "伊達"
            ],
            correctAnswerIndex: 0,
            explanation: "上杉謙信は越後の大名で、戦国時代に大きな力を持っていました。"
        ),
        QuizQuestion(
            question: "北海道で有名な観光地である、五稜郭がある都市はどこですか？",
            choices: [
                "札幌市",
                "函館市",
                "小樽市",
                "旭川市"
            ],
            correctAnswerIndex: 1,
            explanation: "五稜郭は函館市にあり、幕末に建てられた要塞です。"
        ),
        QuizQuestion(
            question: "岐阜県の県庁所在地はどこですか？",
            choices: [
                "岐阜市",
                "大垣市",
                "高山市",
                "多治見市"
            ],
            correctAnswerIndex: 0,
            explanation: "岐阜県の県庁所在地は岐阜市です。"
        ),
        QuizQuestion(
            question: "日本で最も高い山はどれですか？",
            choices: [
                "北岳",
                "槍ヶ岳",
                "富士山",
                "白馬岳"
            ],
            correctAnswerIndex: 2,
            explanation: "富士山は日本で最も高い山で、標高は約3,776メートルです。"
        ),
        QuizQuestion(
            question: "山口県の県庁所在地はどこですか？",
            choices: [
                "宇部市",
                "下関市",
                "山口市",
                "防府市"
            ],
            correctAnswerIndex: 2,
            explanation: "山口県の県庁所在地は山口市です。"
        ),
        QuizQuestion(
            question: "愛媛県の県庁所在地はどこですか？",
            choices: [
                "松山市",
                "今治市",
                "宇和島市",
                "大洲市"
            ],
            correctAnswerIndex: 0,
            explanation: "愛媛県の県庁所在地は松山市です。"
        ),
        QuizQuestion(
            question: "徳島県の県庁所在地はどこですか？",
            choices: [
                "阿南市",
                "徳島市",
                "鳴門市",
                "美馬市"
            ],
            correctAnswerIndex: 1,
            explanation: "徳島県の県庁所在地は徳島市です。"
        ),
        QuizQuestion(
            question: "高知県の県庁所在地はどこですか？",
            choices: [
                "高知市",
                "四万十市",
                "宿毛市",
                "土佐市"
            ],
            correctAnswerIndex: 0,
            explanation: "高知県の県庁所在地は高知市です。"
        ),
        QuizQuestion(
            question: "栃木県の県庁所在地はどこですか？",
            choices: [
                "宇都宮市",
                "小山市",
                "栃木市",
                "足利市"
            ],
            correctAnswerIndex: 0,
            explanation: "栃木県の県庁所在地は宇都宮市です。"
        ),
        QuizQuestion(
            question: "千葉県の県庁所在地はどこですか？",
            choices: [
                "千葉市",
                "船橋市",
                "市川市",
                "柏市"
            ],
            correctAnswerIndex: 0,
            explanation: "千葉県の県庁所在地は千葉市です。"
        ),
        QuizQuestion(
            question: "佐賀県で有名な焼き物はどれですか？",
            choices: [
                "萩焼",
                "有田焼",
                "九谷焼",
                "益子焼"
            ],
            correctAnswerIndex: 1,
            explanation: "有田焼は佐賀県で有名な伝統的な焼き物です。"
        ),
        QuizQuestion(
            question: "日本最古の木造建築が残る寺院はどこですか？",
            choices: [
                "東大寺",
                "清水寺",
                "法隆寺",
                "金閣寺"
            ],
            correctAnswerIndex: 2,
            explanation: "法隆寺は日本最古の木造建築が残る寺院で、世界遺産にも登録されています。"
        ),
        QuizQuestion(
            question: "日本で有名な火山で、毎年噴火することが多いのはどれですか？",
            choices: [
                "富士山",
                "桜島",
                "阿蘇山",
                "御嶽山"
            ],
            correctAnswerIndex: 1,
            explanation: "桜島は鹿児島県にあり、毎年のように噴火する活火山です。"
        ),
        QuizQuestion(
            question: "日本の最西端に位置する島はどこですか？",
            choices: [
                "与那国島",
                "沖ノ鳥島",
                "石垣島",
                "屋久島"
            ],
            correctAnswerIndex: 0,
            explanation: "与那国島は日本の最西端に位置する島です。"
        ),
        QuizQuestion(
            question: "青森県の県庁所在地はどこですか？",
            choices: [
                "八戸市",
                "弘前市",
                "青森市",
                "十和田市"
            ],
            correctAnswerIndex: 2,
            explanation: "青森県の県庁所在地は青森市です。"
        ),
        QuizQuestion(
            question: "三重県の県庁所在地はどこですか？",
            choices: [
                "伊勢市",
                "津市",
                "四日市市",
                "松阪市"
            ],
            correctAnswerIndex: 1,
            explanation: "三重県の県庁所在地は津市です。"
        ),
        QuizQuestion(
            question: "日本で最も多くの温泉がある都道府県はどこですか？",
            choices: [
                "鹿児島県",
                "大分県",
                "北海道",
                "新潟県"
            ],
            correctAnswerIndex: 1,
            explanation: "大分県は温泉の数と湧出量が日本一で、別府温泉などが有名です。"
        ),
        QuizQuestion(
            question: "島根県で有名な神社はどこですか？",
            choices: [
                "出雲大社",
                "伊勢神宮",
                "住吉大社",
                "平安神宮"
            ],
            correctAnswerIndex: 0,
            explanation: "出雲大社は島根県にあり、縁結びの神様として有名です。"
        ),
        QuizQuestion(
            question: "東京都の中で最も人口が多い区はどこですか？",
            choices: [
                "渋谷区",
                "新宿区",
                "港区",
                "世田谷区"
            ],
            correctAnswerIndex: 3,
            explanation: "世田谷区は東京都の中で最も人口が多い区です。"
        ),
        QuizQuestion(
            question: "長野県にある日本一標高が高い駅はどこですか？",
            choices: [
                "新宿駅",
                "軽井沢駅",
                "大月駅",
                "野辺山駅"
            ],
            correctAnswerIndex: 3,
            explanation: "野辺山駅は日本で一番標高が高い駅で、長野県にあります。"
        ),
        QuizQuestion(
            question: "山梨県で有名な観光名所はどこですか？",
            choices: [
                "箱根温泉",
                "白川郷",
                "富士山",
                "厳島神社"
            ],
            correctAnswerIndex: 2,
            explanation: "富士山は山梨県と静岡県の境に位置し、世界遺産にも登録されています。"
        ),
        QuizQuestion(
            question: "福井県の県庁所在地はどこですか？",
            choices: [
                "福井市",
                "敦賀市",
                "小浜市",
                "坂井市"
            ],
            correctAnswerIndex: 0,
            explanation: "福井県の県庁所在地は福井市です。"
        ),
        QuizQuestion(
            question: "石川県の県庁所在地はどこですか？",
            choices: [
                "小松市",
                "金沢市",
                "加賀市",
                "七尾市"
            ],
            correctAnswerIndex: 1,
            explanation: "石川県の県庁所在地は金沢市です。"
        ),
        QuizQuestion(
            question: "戦国時代に活躍した武将、織田信長が居城としていた城はどれですか？",
            choices: [
                "姫路城",
                "大阪城",
                "安土城",
                "熊本城"
            ],
            correctAnswerIndex: 2,
            explanation: "織田信長は安土城を居城としていました。"
        ),
        QuizQuestion(
            question: "京都府で有名な寺院、金閣寺の正式名称はどれですか？",
            choices: [
                "東福寺",
                "清水寺",
                "鹿苑寺",
                "知恩院"
            ],
            correctAnswerIndex: 2,
            explanation: "金閣寺の正式名称は鹿苑寺です。"
        ),
        QuizQuestion(
            question: "沖縄県の県庁所在地はどこですか？",
            choices: [
                "那覇市",
                "宜野湾市",
                "石垣市",
                "浦添市"
            ],
            correctAnswerIndex: 0,
            explanation: "沖縄県の県庁所在地は那覇市です。"
        ),
        QuizQuestion(
            question: "静岡県にある世界文化遺産はどれですか？",
            choices: [
                "富士山",
                "日光東照宮",
                "姫路城",
                "厳島神社"
            ],
            correctAnswerIndex: 0,
            explanation: "富士山は静岡県と山梨県にまたがり、世界文化遺産に登録されています。"
        ),
        QuizQuestion(
            question: "宮崎県の県庁所在地はどこですか？",
            choices: [
                "宮崎市",
                "都城市",
                "延岡市",
                "日南市"
            ],
            correctAnswerIndex: 0,
            explanation: "宮崎県の県庁所在地は宮崎市です。"
        ),
        QuizQuestion(
            question: "愛知県にある有名な名古屋城は誰が築城した城ですか？",
            choices: [
                "徳川家康",
                "織田信長",
                "豊臣秀吉",
                "伊達政宗"
            ],
            correctAnswerIndex: 0,
            explanation: "名古屋城は徳川家康が築いた城です。"
        ),
        QuizQuestion(
            question: "香川県で有名なうどんの種類は何ですか？",
            choices: [
                "稲庭うどん",
                "讃岐うどん",
                "五島うどん",
                "博多うどん"
            ],
            correctAnswerIndex: 1,
            explanation: "讃岐うどんは香川県で有名なうどんの種類です。"
        ),
        QuizQuestion(
            question: "東京都にある日本の最高裁判所の建物はどこにありますか？",
            choices: [
                "千代田区",
                "港区",
                "渋谷区",
                "新宿区"
            ],
            correctAnswerIndex: 0,
            explanation: "日本の最高裁判所は東京都千代田区にあります。"
        ),
        QuizQuestion(
            question: "広島県で有名な世界遺産の神社はどれですか？",
            choices: [
                "厳島神社",
                "伊勢神宮",
                "平安神宮",
                "明治神宮"
            ],
            correctAnswerIndex: 0,
            explanation: "厳島神社は広島県にあり、世界遺産にも登録されています。"
        ),
        QuizQuestion(
            question: "奈良県で有名な大仏がある寺院はどこですか？",
            choices: [
                "法隆寺",
                "興福寺",
                "東大寺",
                "唐招提寺"
            ],
            correctAnswerIndex: 2,
            explanation: "奈良県の東大寺には有名な大仏があります。"
        ),
        QuizQuestion(
            question: "新潟県にある日本一長い河川はどれですか？",
            choices: [
                "阿武隈川",
                "信濃川",
                "利根川",
                "筑後川"
            ],
            correctAnswerIndex: 1,
            explanation: "信濃川は日本一長い河川で、新潟県を流れています。"
        ),
        QuizQuestion(
            question: "福岡県で有名なラーメンの種類は何ですか？",
            choices: [
                "味噌ラーメン",
                "塩ラーメン",
                "豚骨ラーメン",
                "醤油ラーメン"
            ],
            correctAnswerIndex: 2,
            explanation: "豚骨ラーメンは福岡県で有名なラーメンの種類です。"
        ),
        QuizQuestion(
            question: "北海道の有名な観光地、函館市で毎年行われるイベントは何ですか？",
            choices: [
                "さっぽろ雪まつり",
                "函館港まつり",
                "ねぶた祭",
                "阿波踊り"
            ],
            correctAnswerIndex: 1,
            explanation: "函館港まつりは、北海道の函館市で毎年開催されるイベントです。"
        ),
        QuizQuestion(
            question: "兵庫県にある世界遺産の城はどれですか？",
            choices: [
                "大阪城",
                "名古屋城",
                "姫路城",
                "松本城"
            ],
            correctAnswerIndex: 2,
            explanation: "姫路城は兵庫県にあり、世界遺産にも登録されています。"
        ),
        QuizQuestion(
            question: "熊本県の県庁所在地はどこですか？",
            choices: [
                "熊本市",
                "阿蘇市",
                "八代市",
                "人吉市"
            ],
            correctAnswerIndex: 0,
            explanation: "熊本県の県庁所在地は熊本市です。"
        ),
        QuizQuestion(
            question: "山形県で有名な温泉地はどこですか？",
            choices: [
                "草津温泉",
                "有馬温泉",
                "蔵王温泉",
                "湯布院"
            ],
            correctAnswerIndex: 2,
            explanation: "蔵王温泉は山形県で有名な温泉地です。"
        ),
        QuizQuestion(
            question: "滋賀県にある日本最大の湖はどれですか？",
            choices: [
                "琵琶湖",
                "猪苗代湖",
                "霞ヶ浦",
                "洞爺湖"
            ],
            correctAnswerIndex: 0,
            explanation: "琵琶湖は滋賀県にあり、日本最大の湖です。"
        ),
        QuizQuestion(
            question: "秋田県で毎年開催される有名な祭りはどれですか？",
            choices: [
                "ねぶた祭",
                "竿燈祭り",
                "祇園祭",
                "阿波踊り"
            ],
            correctAnswerIndex: 1,
            explanation: "竿燈祭りは秋田県で毎年開催される有名な祭りです。"
        ),
        QuizQuestion(
            question: "長崎県にある世界遺産の教会はどれですか？",
            choices: [
                "浦上天主堂",
                "大浦天主堂",
                "平和大聖堂",
                "出津教会"
            ],
            correctAnswerIndex: 1,
            explanation: "大浦天主堂は長崎県にあり、世界遺産にも登録されています。"
        ),
        QuizQuestion(
            question: "岐阜県で有名な合掌造りの集落はどこですか？",
            choices: [
                "五箇山",
                "白川郷",
                "美濃加茂",
                "飛騨高山"
            ],
            correctAnswerIndex: 1,
            explanation: "白川郷は岐阜県にあり、合掌造りの集落として有名です。"
        ),
        QuizQuestion(
            question: "奈良県の世界遺産に登録されている寺院はどれですか？",
            choices: [
                "金閣寺",
                "清水寺",
                "東大寺",
                "龍安寺"
            ],
            correctAnswerIndex: 2,
            explanation: "東大寺は奈良県にあり、世界遺産に登録されています。"
        ),

        QuizQuestion(
        question: "日本の都道府県はいくつありますか？",
        choices: [
        "47",
        "43",
        "50",
        "52"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「47」です。日本は1都1道2府43県、合わせて47都道府県から成り立っています。"
        ),

        QuizQuestion(
        question: "北海道が属する地方はどれですか？",
        choices: [
        "北海道地方",
        "東北地方",
        "関東地方",
        "中部地方"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「北海道地方」です。北海道は一つの道で北海道地方を構成しています。"
        ),

        QuizQuestion(
        question: "青森県・岩手県・宮城県などが属する地方はどれですか？",
        choices: [
        "東北地方",
        "関東地方",
        "近畿地方",
        "中国地方"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「東北地方」です。東北地方には青森県、岩手県、宮城県、秋田県、山形県、福島県があります。"
        ),

        QuizQuestion(
        question: "東京都が属する地方はどれですか？",
        choices: [
        "関東地方",
        "中部地方",
        "近畿地方",
        "九州地方"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「関東地方」です。東京都は関東地方にあります。"
        ),

        QuizQuestion(
        question: "愛知県が属する地方はどれですか？",
        choices: [
        "中部地方",
        "東北地方",
        "中国地方",
        "四国地方"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「中部地方」です。愛知県は中部地方にあります。"
        ),

        QuizQuestion(
        question: "大阪府・京都府・兵庫県などが属する地方はどれですか？",
        choices: [
        "近畿地方",
        "関東地方",
        "中国地方",
        "九州地方"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「近畿地方」です。近畿地方には大阪府、京都府、兵庫県などがあります。"
        ),

        QuizQuestion(
        question: "広島県が属する地方はどれですか？",
        choices: [
        "中国地方",
        "四国地方",
        "近畿地方",
        "中部地方"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「中国地方」です。広島県は中国地方にあります。"
        ),

        QuizQuestion(
        question: "香川県が属する地方はどれですか？",
        choices: [
        "四国地方",
        "中国地方",
        "九州地方",
        "東北地方"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「四国地方」です。香川県は四国地方にあります。"
        ),

        QuizQuestion(
        question: "福岡県が属する地方はどれですか？",
        choices: [
        "九州地方",
        "中国地方",
        "近畿地方",
        "関東地方"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「九州地方」です。福岡県は九州地方にあります。"
        ),

        QuizQuestion(
        question: "沖縄県が位置するのは、日本のどのあたりですか？",
        choices: [
        "南西部",
        "北東部",
        "本州の中央",
        "北海道の東"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「南西部」です。沖縄県は日本列島の南西部に位置します。"
        ),

        QuizQuestion(
        question: "県庁が置かれている都市を何といいますか？",
        choices: [
        "県庁所在地",
        "国会所在地",
        "市境",
        "工業地域"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「県庁所在地」です。県の行政の中心となる県庁が置かれている都市を県庁所在地といいます。"
        ),

        QuizQuestion(
        question: "宮城県の県庁所在地はどこですか？",
        choices: [
        "仙台市",
        "盛岡市",
        "福島市",
        "山形市"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「仙台市」です。宮城県の県庁所在地は仙台市です。"
        ),

        QuizQuestion(
        question: "愛知県の県庁所在地はどこですか？",
        choices: [
        "名古屋市",
        "豊田市",
        "岐阜市",
        "静岡市"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「名古屋市」です。愛知県の県庁所在地は名古屋市です。"
        ),

        QuizQuestion(
        question: "広島県の県庁所在地はどこですか？",
        choices: [
        "広島市",
        "岡山市",
        "松江市",
        "山口市"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「広島市」です。広島県の県庁所在地は広島市です。"
        ),

        QuizQuestion(
        question: "地図で北・南・東・西を表すものを何といいますか？",
        choices: [
        "方位",
        "縮尺",
        "標高",
        "人口"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「方位」です。地図では方位を使って方向を表します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】日本は、1都1道2府43県、合わせて ＿＿ 都道府県あります。",
        answer: "47",
        acceptableAnswers: ["四十七"],
        explanation: "＿＿に入るのは「47」です。日本には47の都道府県があります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】東京都・神奈川県・埼玉県などが属する地方を「＿＿地方」といいます。",
        answer: "関東",
        acceptableAnswers: ["関東地方"],
        explanation: "＿＿に入るのは「関東」です。東京都などは関東地方に属します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】大阪府や京都府が属する地方を「＿＿地方」といいます。",
        answer: "近畿",
        acceptableAnswers: ["近畿地方", "関西地方"],
        explanation: "＿＿に入るのは「近畿」です。大阪府、京都府などは近畿地方に属します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】都道府県の行政の中心となる役所を、都では都庁、道では道庁、府県では「＿＿」といいます。",
        answer: "県庁",
        acceptableAnswers: ["けんちょう"],
        explanation: "＿＿に入るのは「県庁」です。県の行政の中心となる役所です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地図で実際の距離を一定の割合で小さく表した割合を「＿＿」といいます。",
        answer: "縮尺",
        acceptableAnswers: ["しゅくしゃく"],
        explanation: "＿＿に入るのは「縮尺」です。縮尺を見ると、地図上の長さから実際の距離を考えられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地方と、そこにある都道府県を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "東北地方", match: "宮城県"),
        QuizMatchingPair(prompt: "関東地方", match: "東京都"),
        QuizMatchingPair(prompt: "四国地方", match: "香川県"),
        QuizMatchingPair(prompt: "九州地方", match: "福岡県")
        ],
        choices: ["福岡県", "東京都", "宮城県", "香川県"],
        explanation: "宮城県は東北地方、東京都は関東地方、香川県は四国地方、福岡県は九州地方にあります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】都道府県と県庁所在地を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "宮城県", match: "仙台市"),
        QuizMatchingPair(prompt: "愛知県", match: "名古屋市"),
        QuizMatchingPair(prompt: "広島県", match: "広島市"),
        QuizMatchingPair(prompt: "福岡県", match: "福岡市")
        ],
        choices: ["広島市", "福岡市", "仙台市", "名古屋市"],
        explanation: "宮城県は仙台市、愛知県は名古屋市、広島県は広島市、福岡県は福岡市が県庁所在地です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地図の記号や表し方と意味を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "方位", match: "方向を表す"),
        QuizMatchingPair(prompt: "縮尺", match: "実際の距離との割合を表す"),
        QuizMatchingPair(prompt: "凡例", match: "地図記号や色の意味を示す"),
        QuizMatchingPair(prompt: "等高線", match: "同じ高さの地点を結んで表す")
        ],
        choices: ["同じ高さの地点を結んで表す", "方向を表す", "地図記号や色の意味を示す", "実際の距離との割合を表す"],
        explanation: "方位は方向、縮尺は距離の割合、凡例は記号や色の意味、等高線は同じ高さの地点を表します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】海と、その海に面する地域の例を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "太平洋", match: "関東地方の東側"),
        QuizMatchingPair(prompt: "日本海", match: "北陸地方の西側"),
        QuizMatchingPair(prompt: "瀬戸内海", match: "中国地方と四国地方の間"),
        QuizMatchingPair(prompt: "東シナ海", match: "九州地方の西側")
        ],
        choices: ["九州地方の西側", "関東地方の東側", "中国地方と四国地方の間", "北陸地方の西側"],
        explanation: "太平洋、日本海、瀬戸内海、東シナ海はそれぞれ日本の周りに広がる海です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地形と説明を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "平野", match: "広く平らな土地"),
        QuizMatchingPair(prompt: "盆地", match: "周りを山地に囲まれた平らな土地"),
        QuizMatchingPair(prompt: "半島", match: "海へ細長く突き出た土地"),
        QuizMatchingPair(prompt: "島", match: "周りを水に囲まれた土地")
        ],
        choices: ["周りを水に囲まれた土地", "広く平らな土地", "海へ細長く突き出た土地", "周りを山地に囲まれた平らな土地"],
        explanation: "平野、盆地、半島、島にはそれぞれ異なる地形上の特徴があります。"
        ),

        QuizQuestion.classification(
        question: "【分類】都道府県を、「海に面している」「海に面していない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "千葉県", match: "海に面している"),
        QuizMatchingPair(prompt: "高知県", match: "海に面している"),
        QuizMatchingPair(prompt: "長野県", match: "海に面していない"),
        QuizMatchingPair(prompt: "奈良県", match: "海に面していない")
        ],
        categories: ["海に面している", "海に面していない"],
        explanation: "千葉県と高知県は海に面し、長野県と奈良県は海に面していません。"
        ),

        QuizQuestion.classification(
        question: "【分類】都道府県を地方ごとに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "秋田県", match: "東北地方"),
        QuizMatchingPair(prompt: "栃木県", match: "関東地方"),
        QuizMatchingPair(prompt: "石川県", match: "中部地方"),
        QuizMatchingPair(prompt: "徳島県", match: "四国地方")
        ],
        categories: ["東北地方", "関東地方", "中部地方", "四国地方"],
        explanation: "秋田県は東北、栃木県は関東、石川県は中部、徳島県は四国地方です。"
        ),

        QuizQuestion.classification(
        question: "【分類】地図から読み取れる情報を、「自然」「人々のくらし」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "山地の広がり", match: "自然"),
        QuizMatchingPair(prompt: "川の流れ", match: "自然"),
        QuizMatchingPair(prompt: "鉄道路線", match: "人々のくらし"),
        QuizMatchingPair(prompt: "市街地の広がり", match: "人々のくらし")
        ],
        categories: ["自然", "人々のくらし"],
        explanation: "山地や川は自然の様子、鉄道や市街地は人々のくらしに関わる情報です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】人口が最も多い市を答えましょう。",
        answer: "A市",
        acceptableAnswers: ["A"],
        referenceTitle: "4つの市の人口（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A市", value: "92万人"),
        QuizReferenceRow(label: "B市", value: "48万人"),
        QuizReferenceRow(label: "C市", value: "63万人"),
        QuizReferenceRow(label: "D市", value: "35万人")
        ],
        explanation: "最も人口が多いのは92万人のA市です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】面積が最も広い県を答えましょう。",
        answer: "D県",
        acceptableAnswers: ["D"],
        referenceTitle: "4県の面積（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A県", value: "5,200km²"),
        QuizReferenceRow(label: "B県", value: "7,100km²"),
        QuizReferenceRow(label: "C県", value: "4,800km²"),
        QuizReferenceRow(label: "D県", value: "8,600km²")
        ],
        explanation: "最も面積が広いのは8,600km²のD県です。"
        ),

        QuizQuestion(
        question: "家庭で使う水は、主にどこで安全にしてから送られてきますか？",
        choices: [
        "浄水場",
        "消防署",
        "図書館",
        "発電所"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「浄水場」です。浄水場では川などから取り入れた水をきれいにして家庭へ送ります。"
        ),

        QuizQuestion(
        question: "浄水場で水をきれいにする主な目的はどれですか？",
        choices: [
        "安心して使える水にするため",
        "海水にするため",
        "水を赤くするため",
        "水の量をゼロにするため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「安心して使える水にするため」です。浄水場では水からにごりや汚れなどを取り除きます。"
        ),

        QuizQuestion(
        question: "家庭で使った水をきれいにして川や海へ戻す施設はどれですか？",
        choices: [
        "下水処理場",
        "清掃工場",
        "交番",
        "市場"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「下水処理場」です。下水処理場では家庭や工場などから出た汚れた水を処理します。"
        ),

        QuizQuestion(
        question: "水道管の役割として最も適切なものはどれですか？",
        choices: [
        "水を家庭や施設へ送る",
        "ごみを運ぶ",
        "電気をつくる",
        "道路を照らす"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「水を家庭や施設へ送る」です。水道管は浄水場などから水を送るための管です。"
        ),

        QuizQuestion(
        question: "水を大切に使う行動として適切なのはどれですか？",
        choices: [
        "歯みがき中は水を出しっぱなしにしない",
        "蛇口を開けたまま外出する",
        "必要なくても大量の水を流す",
        "水道の漏れを放置する"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「歯みがき中は水を出しっぱなしにしない」です。必要な分だけ水を使うことが節水につながります。"
        ),

        QuizQuestion(
        question: "燃やせるごみを集めて処理する施設として代表的なのはどれですか？",
        choices: [
        "清掃工場",
        "学校",
        "郵便局",
        "駅"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「清掃工場」です。清掃工場では燃やせるごみを焼却するなどして処理します。"
        ),

        QuizQuestion(
        question: "びん・缶・ペットボトルなどを分けて出す主な理由はどれですか？",
        choices: [
        "資源として再利用しやすくするため",
        "ごみを重くするため",
        "収集日をなくすため",
        "道に置き続けるため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「資源として再利用しやすくするため」です。分別すると資源をリサイクルしやすくなります。"
        ),

        QuizQuestion(
        question: "ごみを出す日や種類を確認するときに役立つものはどれですか？",
        choices: [
        "ごみ収集カレンダー",
        "時刻表",
        "献立表",
        "座席表"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「ごみ収集カレンダー」です。地域ごとの収集日や分別方法を確認できます。"
        ),

        QuizQuestion(
        question: "ごみを減らすための行動として適切なのはどれですか？",
        choices: [
        "まだ使える物を長く使う",
        "使える物もすぐ捨てる",
        "必要以上に包装する",
        "食べ物を毎回大量に残す"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「まだ使える物を長く使う」です。物を大切に使うことはごみを減らすことにつながります。"
        ),

        QuizQuestion(
        question: "生ごみを減らすためにできることはどれですか？",
        choices: [
        "食べきれる量を考えて買う",
        "食べ物をすぐ捨てる",
        "冷蔵庫の中身を確認しない",
        "毎日多く買いすぎる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「食べきれる量を考えて買う」です。食品ロスを減らすことが生ごみの削減につながります。"
        ),

        QuizQuestion(
        question: "ごみを燃やしたあとの灰などを最終的に埋め立てる場所を何といいますか？",
        choices: [
        "最終処分場",
        "浄水場",
        "ダム",
        "消防署"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「最終処分場」です。処理後に残ったものなどを埋め立てる場所です。"
        ),

        QuizQuestion(
        question: "清掃工場でごみを燃やすときに発生する熱を利用する例として適切なのはどれですか？",
        choices: [
        "発電や温水利用",
        "道路を雪で覆う",
        "川をせき止める",
        "電車を止める"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「発電や温水利用」です。ごみを燃やした熱を有効に利用する施設があります。"
        ),

        QuizQuestion(
        question: "下水道が整備されている大きな利点はどれですか？",
        choices: [
        "汚れた水を集めて処理できる",
        "雨を降らせられる",
        "海水を増やせる",
        "すべての川をなくせる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「汚れた水を集めて処理できる」です。下水道は生活環境や水環境を守る役割があります。"
        ),

        QuizQuestion(
        question: "水源を守るために大切なことはどれですか？",
        choices: [
        "森林や川を大切にする",
        "川にごみを捨てる",
        "水源の周りを汚す",
        "木をすべて切る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「森林や川を大切にする」です。水源周辺の環境を守ることは安全な水につながります。"
        ),

        QuizQuestion(
        question: "家庭で水道から水が出るまでの流れとして最も適切なのはどれですか？",
        choices: [
        "水源→浄水場→配水施設→家庭",
        "家庭→学校→川→浄水場",
        "海→ごみ処理場→家庭→川",
        "消防署→駅→家庭→海"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「水源→浄水場→配水施設→家庭」です。水は浄水場できれいにされた後、配水施設などを通って家庭へ届きます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】川などから取り入れた水をきれいにして、水道水にする施設を「＿＿」といいます。",
        answer: "浄水場",
        acceptableAnswers: ["じょうすいじょう"],
        explanation: "＿＿に入るのは「浄水場」です。浄水場は水を安全に使えるよう処理します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】家庭などで使った水を集めてきれいにする施設を「＿＿」といいます。",
        answer: "下水処理場",
        acceptableAnswers: ["げすいしょりじょう"],
        explanation: "＿＿に入るのは「下水処理場」です。汚れた水を処理して川や海へ戻します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ごみを種類ごとに分けて出すことを「ごみの＿＿」といいます。",
        answer: "分別",
        acceptableAnswers: ["ぶんべつ"],
        explanation: "＿＿に入るのは「分別」です。ごみの分別は適切な処理やリサイクルに役立ちます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】使い終わった物を資源としてもう一度利用することを「＿＿」といいます。",
        answer: "リサイクル",
        acceptableAnswers: ["再生利用"],
        explanation: "＿＿に入るのは「リサイクル」です。資源をくり返し利用する取り組みです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ごみをできるだけ出さないようにすることを「リデュース」、くり返し使うことを「＿＿」といいます。",
        answer: "リユース",
        acceptableAnswers: ["再使用"],
        explanation: "＿＿に入るのは「リユース」です。まだ使える物をくり返し使うことを表します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】施設と役割を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "浄水場", match: "水をきれいにする"),
        QuizMatchingPair(prompt: "下水処理場", match: "使った水を処理する"),
        QuizMatchingPair(prompt: "清掃工場", match: "ごみを処理する"),
        QuizMatchingPair(prompt: "最終処分場", match: "処理後に残ったものなどを埋め立てる")
        ],
        choices: ["ごみを処理する", "水をきれいにする", "処理後に残ったものなどを埋め立てる", "使った水を処理する"],
        explanation: "それぞれの施設は、水やごみを安全に処理してくらしを支えています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】3Rと説明を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "リデュース", match: "ごみそのものを減らす"),
        QuizMatchingPair(prompt: "リユース", match: "くり返し使う"),
        QuizMatchingPair(prompt: "リサイクル", match: "資源として再利用する"),
        QuizMatchingPair(prompt: "分別", match: "種類ごとに分ける")
        ],
        choices: ["くり返し使う", "種類ごとに分ける", "資源として再利用する", "ごみそのものを減らす"],
        explanation: "3Rはリデュース、リユース、リサイクルです。分別も資源を生かすために大切です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】水に関わる設備と役割を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ダム", match: "水をためる"),
        QuizMatchingPair(prompt: "取水口", match: "川などから水を取り入れる"),
        QuizMatchingPair(prompt: "配水池", match: "水をためて送る量を調節する"),
        QuizMatchingPair(prompt: "水道管", match: "家庭などへ水を送る")
        ],
        choices: ["家庭などへ水を送る", "水をためる", "川などから水を取り入れる", "水をためて送る量を調節する"],
        explanation: "ダム、取水口、配水池、水道管は水道の仕組みを支える設備です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】ごみの種類と出し方の例を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "古紙", match: "紙の資源として分ける"),
        QuizMatchingPair(prompt: "ペットボトル", match: "資源回収に出す"),
        QuizMatchingPair(prompt: "生ごみ", match: "地域のルールに従って可燃ごみなどに出す"),
        QuizMatchingPair(prompt: "乾電池", match: "地域の決められた回収方法で出す")
        ],
        choices: ["地域の決められた回収方法で出す", "資源回収に出す", "紙の資源として分ける", "地域のルールに従って可燃ごみなどに出す"],
        explanation: "ごみは地域のルールに従って種類ごとに分けることが大切です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】節水の工夫と効果を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "蛇口をこまめに閉める", match: "使う水を減らす"),
        QuizMatchingPair(prompt: "風呂の残り湯を活用する", match: "水をもう一度役立てる"),
        QuizMatchingPair(prompt: "漏水を修理する", match: "むだに流れる水を減らす"),
        QuizMatchingPair(prompt: "雨水を植物への水やりに使う", match: "水道水の使用を減らす")
        ],
        choices: ["水道水の使用を減らす", "むだに流れる水を減らす", "使う水を減らす", "水をもう一度役立てる"],
        explanation: "身近な工夫を積み重ねることで水を大切に使えます。"
        ),

        QuizQuestion.classification(
        question: "【分類】行動を「ごみを減らす」「ごみを増やしやすい」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "マイバッグを使う", match: "ごみを減らす"),
        QuizMatchingPair(prompt: "必要な分だけ買う", match: "ごみを減らす"),
        QuizMatchingPair(prompt: "使える物をすぐ捨てる", match: "ごみを増やしやすい"),
        QuizMatchingPair(prompt: "食べ物を多く残す", match: "ごみを増やしやすい")
        ],
        categories: ["ごみを減らす", "ごみを増やしやすい"],
        explanation: "物や食べ物を大切に使うことはごみの削減につながります。"
        ),

        QuizQuestion.classification(
        question: "【分類】水の流れを「使う前」「使った後」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "浄水場", match: "使う前"),
        QuizMatchingPair(prompt: "配水池", match: "使う前"),
        QuizMatchingPair(prompt: "下水管", match: "使った後"),
        QuizMatchingPair(prompt: "下水処理場", match: "使った後")
        ],
        categories: ["使う前", "使った後"],
        explanation: "水は使う前に浄水され、使った後は下水道を通って処理されます。"
        ),

        QuizQuestion.classification(
        question: "【分類】ごみを「資源になりやすいもの」「そのままでは資源回収しにくいもの」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "新聞紙", match: "資源になりやすいもの"),
        QuizMatchingPair(prompt: "アルミ缶", match: "資源になりやすいもの"),
        QuizMatchingPair(prompt: "汚れたティッシュ", match: "そのままでは資源回収しにくいもの"),
        QuizMatchingPair(prompt: "食べ残し", match: "そのままでは資源回収しにくいもの")
        ],
        categories: ["資源になりやすいもの", "そのままでは資源回収しにくいもの"],
        explanation: "古紙や缶などは資源として回収されます。汚れた紙や食べ残しは地域のルールに従って処理します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】水が家庭へ届くまでの主な流れを並べましょう。",
        choices: ["家庭へ送る", "川などから水を取り入れる", "浄水場できれいにする", "配水池などにためる"],
        orderedChoices: ["川などから水を取り入れる", "浄水場できれいにする", "配水池などにためる", "家庭へ送る"],
        explanation: "水は取水、浄水、配水を経て家庭へ届きます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】1人1日あたりの水使用量が最も少ない月を答えましょう。",
        answer: "4月",
        acceptableAnswers: ["四月"],
        referenceTitle: "1人1日あたりの水使用量（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "4月", value: "220L"),
        QuizReferenceRow(label: "7月", value: "260L"),
        QuizReferenceRow(label: "10月", value: "235L"),
        QuizReferenceRow(label: "1月", value: "245L")
        ],
        explanation: "最も少ないのは220Lの4月です。"
        ),

        QuizQuestion(
        question: "大雨で川の水が増え、あふれる災害を何といいますか？",
        choices: [
        "洪水",
        "地震",
        "津波",
        "噴火"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「洪水」です。大雨などで川の水が増え、周りにあふれることを洪水といいます。"
        ),

        QuizQuestion(
        question: "強い地震のあと、海岸付近で特に注意する必要がある災害はどれですか？",
        choices: [
        "津波",
        "雪崩",
        "干ばつ",
        "黄砂"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「津波」です。海底で大きな地震が起こると津波が発生することがあります。"
        ),

        QuizQuestion(
        question: "山の斜面の土や石が大雨などで一気に崩れる災害はどれですか？",
        choices: [
        "土砂災害",
        "高潮",
        "津波",
        "竜巻だけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「土砂災害」です。大雨などでがけ崩れや土石流が起こることがあります。"
        ),

        QuizQuestion(
        question: "災害時に危険な場所や避難場所を確認するのに役立つ地図はどれですか？",
        choices: [
        "ハザードマップ",
        "路線図",
        "献立表",
        "座席表"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「ハザードマップ」です。災害の危険がある場所や避難場所などを確認できます。"
        ),

        QuizQuestion(
        question: "地震が起きたとき、教室でまず行う行動として適切なのはどれですか？",
        choices: [
        "机の下などで頭を守る",
        "窓から飛び出す",
        "階段へ一斉に走る",
        "エレベーターに急いで乗る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「机の下などで頭を守る」です。落下物などから身を守ることが大切です。"
        ),

        QuizQuestion(
        question: "津波のおそれがあるとき、海岸近くでとる行動として適切なのはどれですか？",
        choices: [
        "できるだけ早く高い場所へ避難する",
        "海を見に行く",
        "港で待つ",
        "川の河口へ近づく"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「できるだけ早く高い場所へ避難する」です。津波からは海岸や川から離れ、高い場所へ避難します。"
        ),

        QuizQuestion(
        question: "台風が近づく前に確認しておくとよいものはどれですか？",
        choices: [
        "気象情報や避難情報",
        "昨日の給食",
        "教室の座席順",
        "テレビ番組の感想"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「気象情報や避難情報」です。台風の進路や大雨、避難情報を確認して備えます。"
        ),

        QuizQuestion(
        question: "避難所の役割として最も適切なのはどれですか？",
        choices: [
        "災害時に避難した人が安全を確保する場所",
        "ごみを燃やす場所",
        "電車を修理する場所",
        "商品を売る場所"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「災害時に避難した人が安全を確保する場所」です。学校や公民館などが避難所になることがあります。"
        ),

        QuizQuestion(
        question: "防災倉庫に備えておくものとして適切なのはどれですか？",
        choices: [
        "飲料水や毛布など",
        "ゲーム機だけ",
        "飾り物だけ",
        "教科書だけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「飲料水や毛布など」です。災害時に必要となる物資を備蓄します。"
        ),

        QuizQuestion(
        question: "消防署が24時間交代で勤務する大きな理由はどれですか？",
        choices: [
        "火災や救急はいつ起こるかわからないから",
        "夜は道路が消えるから",
        "昼は水が使えないから",
        "休日は電話が使えないから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「火災や救急はいつ起こるかわからないから」です。いつでも対応できるよう交代で勤務します。"
        ),

        QuizQuestion(
        question: "119番に電話するのは主にどんなときですか？",
        choices: [
        "火事や救急車が必要なとき",
        "道を聞きたいとき",
        "本を借りたいとき",
        "電車の時刻を知りたいとき"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「火事や救急車が必要なとき」です。119番は消防・救急の緊急通報です。"
        ),

        QuizQuestion(
        question: "110番に電話するのは主にどんなときですか？",
        choices: [
        "事件や事故で警察の緊急対応が必要なとき",
        "火事だけ",
        "水道の使用量を知りたいとき",
        "図書館の開館時間を聞くとき"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「事件や事故で警察の緊急対応が必要なとき」です。110番は警察への緊急通報です。"
        ),

        QuizQuestion(
        question: "地域の防災訓練を行う主な目的はどれですか？",
        choices: [
        "災害時の行動を練習しておくため",
        "災害を発生させるため",
        "避難所をなくすため",
        "警報を聞かないようにするため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「災害時の行動を練習しておくため」です。避難方法や役割分担を確認しておくことが大切です。"
        ),

        QuizQuestion(
        question: "家で家具を固定することは、地震のどんな危険を減らすことにつながりますか？",
        choices: [
        "家具の転倒",
        "雨の量",
        "川の流れ",
        "津波の高さ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「家具の転倒」です。家具を固定すると地震の揺れで倒れる危険を減らせます。"
        ),

        QuizQuestion(
        question: "非常持ち出し袋を準備する主な理由はどれですか？",
        choices: [
        "避難するときに必要な物をすぐ持ち出せるようにするため",
        "毎日学校に置くため",
        "ごみを増やすため",
        "水を捨てるため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「避難するときに必要な物をすぐ持ち出せるようにするため」です。飲料水、ライト、携帯ラジオなどを備える例があります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】災害の危険がある場所や避難場所などを示した地図を「＿＿」といいます。",
        answer: "ハザードマップ",
        acceptableAnswers: ["防災マップ"],
        explanation: "＿＿に入るのは「ハザードマップ」です。地域の災害リスクを確認できます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】災害が起きたときなどに、安全な場所へ移動することを「＿＿」といいます。",
        answer: "避難",
        acceptableAnswers: ["ひなん"],
        explanation: "＿＿に入るのは「避難」です。危険から離れて安全を確保する行動です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】火事や救急の緊急通報に使う電話番号は「＿＿番」です。",
        answer: "119",
        acceptableAnswers: ["１１９"],
        explanation: "＿＿に入るのは「119」です。消防・救急の緊急通報番号です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】事件や事故で警察の緊急対応が必要なときの電話番号は「＿＿番」です。",
        answer: "110",
        acceptableAnswers: ["１１０"],
        explanation: "＿＿に入るのは「110」です。警察への緊急通報番号です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】災害に備えて食料や水などをあらかじめ用意しておくことを「＿＿」といいます。",
        answer: "備蓄",
        acceptableAnswers: ["びちく"],
        explanation: "＿＿に入るのは「備蓄」です。災害時に必要な物資を前もって準備します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】災害と備えを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "地震", match: "家具を固定する"),
        QuizMatchingPair(prompt: "洪水", match: "川の増水情報を確認する"),
        QuizMatchingPair(prompt: "津波", match: "高い場所への避難経路を確認する"),
        QuizMatchingPair(prompt: "大雪", match: "積雪や交通情報を確認する")
        ],
        choices: ["積雪や交通情報を確認する", "家具を固定する", "高い場所への避難経路を確認する", "川の増水情報を確認する"],
        explanation: "災害の種類に合わせて日ごろから備えることが大切です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】防災設備と役割を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "消火栓", match: "消火に使う水を取る"),
        QuizMatchingPair(prompt: "防火水槽", match: "消火用の水をためる"),
        QuizMatchingPair(prompt: "非常口", match: "緊急時に避難する出口を示す"),
        QuizMatchingPair(prompt: "火災報知器", match: "火災を知らせる")
        ],
        choices: ["火災を知らせる", "緊急時に避難する出口を示す", "消火用の水をためる", "消火に使う水を取る"],
        explanation: "防災設備は火災などから人々の安全を守るために備えられています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】組織と主な役割を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "消防署", match: "消火・救急・救助"),
        QuizMatchingPair(prompt: "警察署", match: "事件や事故への対応"),
        QuizMatchingPair(prompt: "市役所", match: "避難情報の発信や避難所運営の調整"),
        QuizMatchingPair(prompt: "気象台", match: "気象情報や警報を発表する")
        ],
        choices: ["事件や事故への対応", "気象情報や警報を発表する", "消火・救急・救助", "避難情報の発信や避難所運営の調整"],
        explanation: "災害時には複数の機関が役割を分担しながら人々の安全を守ります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】情報と確認できることを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "大雨警報", match: "大雨による災害への警戒"),
        QuizMatchingPair(prompt: "洪水警報", match: "川の増水などへの警戒"),
        QuizMatchingPair(prompt: "避難情報", match: "避難行動をとる必要性"),
        QuizMatchingPair(prompt: "ハザードマップ", match: "地域の危険箇所や避難場所")
        ],
        choices: ["地域の危険箇所や避難場所", "避難行動をとる必要性", "川の増水などへの警戒", "大雨による災害への警戒"],
        explanation: "防災情報を正しく確認し、早めに行動することが重要です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】避難所にある物と用途を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "毛布", match: "体を冷やさないようにする"),
        QuizMatchingPair(prompt: "飲料水", match: "水分をとる"),
        QuizMatchingPair(prompt: "非常用トイレ", match: "断水時などのトイレに使う"),
        QuizMatchingPair(prompt: "発電機", match: "停電時の電力確保に使う")
        ],
        choices: ["断水時などのトイレに使う", "停電時の電力確保に使う", "体を冷やさないようにする", "水分をとる"],
        explanation: "避難所では生活を支えるためのさまざまな備蓄や設備が用意されることがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】行動を「地震時に安全につながる」「危険につながりやすい」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "頭を守る", match: "地震時に安全につながる"),
        QuizMatchingPair(prompt: "出口を確認する", match: "地震時に安全につながる"),
        QuizMatchingPair(prompt: "あわてて階段へ走る", match: "危険につながりやすい"),
        QuizMatchingPair(prompt: "落下物の近くに立つ", match: "危険につながりやすい")
        ],
        categories: ["地震時に安全につながる", "危険につながりやすい"],
        explanation: "地震時は落ち着いて身を守り、周りの安全を確認して行動します。"
        ),

        QuizQuestion.classification(
        question: "【分類】災害を「水に関係が深い災害」「地面の動きに関係が深い災害」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "洪水", match: "水に関係が深い災害"),
        QuizMatchingPair(prompt: "高潮", match: "水に関係が深い災害"),
        QuizMatchingPair(prompt: "地震", match: "地面の動きに関係が深い災害"),
        QuizMatchingPair(prompt: "地すべり", match: "地面の動きに関係が深い災害")
        ],
        categories: ["水に関係が深い災害", "地面の動きに関係が深い災害"],
        explanation: "洪水や高潮は水、地震や地すべりは地面の動きと深く関係します。"
        ),

        QuizQuestion.classification(
        question: "【分類】ものを「日ごろの備え」「災害発生後に受け取る情報」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "非常持ち出し袋", match: "日ごろの備え"),
        QuizMatchingPair(prompt: "家具の固定", match: "日ごろの備え"),
        QuizMatchingPair(prompt: "避難指示", match: "災害発生後に受け取る情報"),
        QuizMatchingPair(prompt: "気象警報", match: "災害発生後に受け取る情報")
        ],
        categories: ["日ごろの備え", "災害発生後に受け取る情報"],
        explanation: "備えと情報の両方が災害から身を守るために重要です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】避難訓練の基本的な流れを並べましょう。",
        choices: ["避難場所で人数を確認する", "放送や指示を聞く", "安全な経路で避難する", "身を守る行動をとる"],
        orderedChoices: ["放送や指示を聞く", "身を守る行動をとる", "安全な経路で避難する", "避難場所で人数を確認する"],
        explanation: "訓練では指示を聞き、身を守り、安全に避難して人数を確認します。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】降水量が最も多い月を答えましょう。",
        answer: "9月",
        acceptableAnswers: ["九月"],
        referenceTitle: "月別降水量（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "6月", value: "210mm"),
        QuizReferenceRow(label: "7月", value: "180mm"),
        QuizReferenceRow(label: "8月", value: "140mm"),
        QuizReferenceRow(label: "9月", value: "260mm")
        ],
        explanation: "最も降水量が多いのは260mmの9月です。"
        ),

        QuizQuestion(
        question: "地域で昔から受けつがれてきた工芸品を何といいますか？",
        choices: [
        "伝統的工芸品",
        "輸入品",
        "工業原料",
        "自然災害"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「伝統的工芸品」です。地域の材料や技術を生かし、長く受けつがれてきた工芸品があります。"
        ),

        QuizQuestion(
        question: "地域の祭りが長く続いている理由として最も適切なのはどれですか？",
        choices: [
        "地域の人々が大切に受けついでいるから",
        "毎年同じ天気になるから",
        "道路がなくなるから",
        "学校だけが行うから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地域の人々が大切に受けついでいるから」です。祭りは地域の歴史や願いと結びついています。"
        ),

        QuizQuestion(
        question: "伝統工芸の職人が技術を次の世代に教えることの意味はどれですか？",
        choices: [
        "技術や文化を受けつぐことにつながる",
        "製品を作れなくする",
        "地域の歴史を消す",
        "材料を使えなくする"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「技術や文化を受けつぐことにつながる」です。後継者に技術を伝えることが伝統の継承につながります。"
        ),

        QuizQuestion(
        question: "有田焼で知られる都道府県はどこですか？",
        choices: [
        "佐賀県",
        "青森県",
        "長野県",
        "千葉県"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「佐賀県」です。有田焼は佐賀県有田町周辺で発展した陶磁器です。"
        ),

        QuizQuestion(
        question: "輪島塗で知られる都道府県はどこですか？",
        choices: [
        "石川県",
        "宮崎県",
        "群馬県",
        "北海道"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「石川県」です。輪島塗は石川県輪島市周辺で受けつがれてきた漆器です。"
        ),

        QuizQuestion(
        question: "南部鉄器で知られる地域がある都道府県はどこですか？",
        choices: [
        "岩手県",
        "沖縄県",
        "奈良県",
        "鳥取県"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「岩手県」です。南部鉄器は岩手県の盛岡市や奥州市などで作られています。"
        ),

        QuizQuestion(
        question: "西陣織で知られる都市はどこですか？",
        choices: [
        "京都市",
        "札幌市",
        "福岡市",
        "那覇市"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「京都市」です。西陣織は京都市の西陣地域を中心に発展した織物です。"
        ),

        QuizQuestion(
        question: "伝統的な祭りを調べるとき、特に確かめるとよいことはどれですか？",
        choices: [
        "祭りの由来や人々の願い",
        "明日の給食",
        "教室の席順",
        "テレビの視聴率"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「祭りの由来や人々の願い」です。祭りには地域の歴史や願いが表れていることがあります。"
        ),

        QuizQuestion(
        question: "文化財を守るための行動として適切なのはどれですか？",
        choices: [
        "決められたルールを守って見学する",
        "落書きをする",
        "持ち帰る",
        "壊して新しくする"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「決められたルールを守って見学する」です。文化財は地域や国の大切な文化を伝えるものです。"
        ),

        QuizQuestion(
        question: "地域の特産品が生まれる理由として考えられるものはどれですか？",
        choices: [
        "気候や材料、昔からの技術を生かしているから",
        "どの地域も同じ条件だから",
        "運ぶことが禁止されているから",
        "すべて外国で作るから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「気候や材料、昔からの技術を生かしているから」です。地域の特色を生かした産業が発展することがあります。"
        ),

        QuizQuestion(
        question: "地場産業とはどのような産業ですか？",
        choices: [
        "地域の材料や技術などを生かして発展した産業",
        "国会だけが行う産業",
        "海の上だけで行う産業",
        "どの地域にも全く同じ産業"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地域の材料や技術などを生かして発展した産業」です。地域の特色と結びついている産業を地場産業といいます。"
        ),

        QuizQuestion(
        question: "伝統工芸品の販売にインターネットを活用する利点はどれですか？",
        choices: [
        "遠くの人にも知ってもらいやすい",
        "製品を作れなくする",
        "地域の名前を隠す",
        "材料をなくす"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「遠くの人にも知ってもらいやすい」です。情報発信によって販路が広がることがあります。"
        ),

        QuizQuestion(
        question: "地域の祭りで観光客が増えることで期待できることはどれですか？",
        choices: [
        "地域の文化を知ってもらう機会が増える",
        "祭りの意味が必ず消える",
        "道路がなくなる",
        "地域の人が参加できなくなる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地域の文化を知ってもらう機会が増える」です。祭りは地域の魅力を伝える機会にもなります。"
        ),

        QuizQuestion(
        question: "昔からの建物や町並みを保存する理由として適切なのはどれですか？",
        choices: [
        "地域の歴史や文化を伝えるため",
        "新しい道路を作れなくするため",
        "住民を減らすため",
        "地図を使わなくするため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地域の歴史や文化を伝えるため」です。歴史的な建物や町並みは地域の歩みを知る手がかりです。"
        ),

        QuizQuestion(
        question: "職人が製品の質をそろえるために大切にすることはどれですか？",
        choices: [
        "材料や工程を確かめながら丁寧に作る",
        "毎回作り方を全部変える",
        "完成品を確認しない",
        "道具を使わない"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「材料や工程を確かめながら丁寧に作る」です。伝統的な技術は品質を支える大切な要素です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域で昔から受けつがれてきた工芸品を「＿＿工芸品」といいます。",
        answer: "伝統的",
        acceptableAnswers: ["伝統的工芸品"],
        explanation: "＿＿に入るのは「伝統的」です。伝統的工芸品には地域の技術や文化が生かされています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域の材料や技術などを生かして発展した産業を「＿＿産業」といいます。",
        answer: "地場",
        acceptableAnswers: ["地場産業"],
        explanation: "＿＿に入るのは「地場」です。地場産業は地域の特色と結びついて発展します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】昔から受けつがれてきた行事や技術を次の世代へ伝えることを「＿＿」といいます。",
        answer: "継承",
        acceptableAnswers: ["けいしょう"],
        explanation: "＿＿に入るのは「継承」です。文化や技術を受けついでいくことを表します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】佐賀県の有田町周辺で発展した陶磁器を「＿＿」といいます。",
        answer: "有田焼",
        acceptableAnswers: ["ありたやき"],
        explanation: "＿＿に入るのは「有田焼」です。佐賀県を代表する伝統的な陶磁器の一つです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】石川県輪島市周辺で受けつがれてきた漆器を「＿＿」といいます。",
        answer: "輪島塗",
        acceptableAnswers: ["わじまぬり"],
        explanation: "＿＿に入るのは「輪島塗」です。石川県を代表する伝統工芸の一つです。"
        ),

        QuizQuestion.related(
        question: "【関連付け】伝統工芸品と地域を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "有田焼", match: "佐賀県"),
        QuizMatchingPair(prompt: "輪島塗", match: "石川県"),
        QuizMatchingPair(prompt: "南部鉄器", match: "岩手県"),
        QuizMatchingPair(prompt: "西陣織", match: "京都府")
        ],
        choices: ["岩手県", "京都府", "佐賀県", "石川県"],
        explanation: "有田焼は佐賀県、輪島塗は石川県、南部鉄器は岩手県、西陣織は京都府で知られています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】文化を守る取り組みと目的を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "祭りの記録を残す", match: "行事の様子を後世に伝える"),
        QuizMatchingPair(prompt: "職人が弟子を育てる", match: "技術を受けつぐ"),
        QuizMatchingPair(prompt: "古い建物を修理する", match: "歴史的な建物を保存する"),
        QuizMatchingPair(prompt: "案内板を設置する", match: "文化の意味を見学者に伝える")
        ],
        choices: ["技術を受けつぐ", "歴史的な建物を保存する", "行事の様子を後世に伝える", "文化の意味を見学者に伝える"],
        explanation: "記録、技術継承、保存、情報発信などの取り組みが文化を守ることにつながります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域の特色と産業の例を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "良質な粘土がとれる", match: "陶磁器づくり"),
        QuizMatchingPair(prompt: "森林資源が豊か", match: "木工品づくり"),
        QuizMatchingPair(prompt: "養蚕や織物の技術が受けつがれる", match: "織物づくり"),
        QuizMatchingPair(prompt: "漆を使う技術が発達", match: "漆器づくり")
        ],
        choices: ["漆器づくり", "陶磁器づくり", "織物づくり", "木工品づくり"],
        explanation: "地域の材料や歴史、技術が地場産業の発展と結びついています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】祭りで見られるものと役割の例を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "山車", match: "祭りで町を練り歩く飾りや車"),
        QuizMatchingPair(prompt: "みこし", match: "神社の祭りなどで担ぐもの"),
        QuizMatchingPair(prompt: "太鼓", match: "祭りの音や合図に使われる"),
        QuizMatchingPair(prompt: "法被", match: "参加者が着ることのある衣服")
        ],
        choices: ["祭りの音や合図に使われる", "参加者が着ることのある衣服", "神社の祭りなどで担ぐもの", "祭りで町を練り歩く飾りや車"],
        explanation: "祭りには地域ごとにさまざまな道具や衣装があります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】伝統工芸の工程と内容を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "材料を選ぶ", match: "製品に合う素材を用意する"),
        QuizMatchingPair(prompt: "形を整える", match: "道具を使って形を作る"),
        QuizMatchingPair(prompt: "仕上げる", match: "表面や細部を整える"),
        QuizMatchingPair(prompt: "検品する", match: "完成品の状態を確かめる")
        ],
        choices: ["完成品の状態を確かめる", "道具を使って形を作る", "製品に合う素材を用意する", "表面や細部を整える"],
        explanation: "伝統工芸品は多くの工程を経て丁寧に作られます。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域の文化を「形のある文化」「行事や技術」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "古い寺院", match: "形のある文化"),
        QuizMatchingPair(prompt: "歴史的な町家", match: "形のある文化"),
        QuizMatchingPair(prompt: "地域の祭り", match: "行事や技術"),
        QuizMatchingPair(prompt: "伝統工芸の技法", match: "行事や技術")
        ],
        categories: ["形のある文化", "行事や技術"],
        explanation: "建物など形のある文化と、祭りや技術のように人々が受けつぐ文化があります。"
        ),

        QuizQuestion.classification(
        question: "【分類】取り組みを「文化を受けつぐ」「文化を広く伝える」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "後継者を育てる", match: "文化を受けつぐ"),
        QuizMatchingPair(prompt: "作り方を記録する", match: "文化を受けつぐ"),
        QuizMatchingPair(prompt: "観光パンフレットで紹介する", match: "文化を広く伝える"),
        QuizMatchingPair(prompt: "ウェブサイトで発信する", match: "文化を広く伝える")
        ],
        categories: ["文化を受けつぐ", "文化を広く伝える"],
        explanation: "継承と情報発信の両方が地域文化を未来へつなぐ助けになります。"
        ),

        QuizQuestion.classification(
        question: "【分類】品物を「焼き物」「織物」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "有田焼", match: "焼き物"),
        QuizMatchingPair(prompt: "益子焼", match: "焼き物"),
        QuizMatchingPair(prompt: "西陣織", match: "織物"),
        QuizMatchingPair(prompt: "結城紬", match: "織物")
        ],
        categories: ["焼き物", "織物"],
        explanation: "有田焼や益子焼は焼き物、西陣織や結城紬は織物です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】地域の祭りを調べて発表する流れを並べましょう。",
        choices: ["調べたことを発表する", "祭りについて疑問を出す", "資料や聞き取りで調べる", "内容を整理する"],
        orderedChoices: ["祭りについて疑問を出す", "資料や聞き取りで調べる", "内容を整理する", "調べたことを発表する"],
        explanation: "疑問をもち、調べ、整理し、発表する流れで学習を進めます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】見学者数が最も多い月を答えましょう。",
        answer: "8月",
        acceptableAnswers: ["八月"],
        referenceTitle: "伝統工芸館の月別見学者数（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "5月", value: "1,200人"),
        QuizReferenceRow(label: "6月", value: "980人"),
        QuizReferenceRow(label: "7月", value: "1,450人"),
        QuizReferenceRow(label: "8月", value: "1,900人")
        ],
        explanation: "最も見学者数が多いのは1,900人の8月です。"
        ),

        QuizQuestion(
        question: "昔、農業用の水が不足する地域で用水路をつくる大きな目的はどれですか？",
        choices: [
        "田畑へ水を送るため",
        "海水を増やすため",
        "道路をなくすため",
        "山を高くするため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「田畑へ水を送るため」です。用水路は川などの水を田畑へ運び、農業を支えます。"
        ),

        QuizQuestion(
        question: "川の流れを整える工事を行う目的として適切なのはどれですか？",
        choices: [
        "洪水の被害を減らし水を利用しやすくするため",
        "雨を止めるため",
        "川を道路にするため",
        "魚をすべてなくすため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「洪水の被害を減らし水を利用しやすくするため」です。治水の工事はくらしや農業を守ることにつながります。"
        ),

        QuizQuestion(
        question: "地域の発展に尽くした先人について調べるとき、大切な視点はどれですか？",
        choices: [
        "どんな問題をどのように解決したか",
        "好きな食べ物だけ",
        "身長だけ",
        "使った鉛筆の数だけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「どんな問題をどのように解決したか」です。人々の願いや工夫、努力に注目して調べます。"
        ),

        QuizQuestion(
        question: "新しい道路や橋ができることで期待される変化はどれですか？",
        choices: [
        "人や物の移動がしやすくなる",
        "地域へ行けなくなる",
        "農地が必ずすべてなくなる",
        "川が必ず消える"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「人や物の移動がしやすくなる」です。交通の整備は地域間の交流や産業に影響します。"
        ),

        QuizQuestion(
        question: "鉄道が開通すると、地域にどのような変化が起こることがありますか？",
        choices: [
        "人や物を遠くへ運びやすくなる",
        "道路がすべて使えなくなる",
        "地域の人口が必ずゼロになる",
        "地図が必要なくなる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「人や物を遠くへ運びやすくなる」です。交通網の発達は地域のくらしや産業に影響します。"
        ),

        QuizQuestion(
        question: "干拓とはどのような取り組みですか？",
        choices: [
        "浅い海や湖などを堤防で囲み水を抜いて土地にする",
        "山をすべて削る",
        "川を空へ流す",
        "道路を海に沈める"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「浅い海や湖などを堤防で囲み水を抜いて土地にする」です。農地などをつくるために行われてきました。"
        ),

        QuizQuestion(
        question: "埋め立てによって土地をつくる目的の例として適切なのはどれですか？",
        choices: [
        "港や工場、住宅などに使う土地を増やす",
        "海を完全になくす",
        "雨を止める",
        "山を高くする"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「港や工場、住宅などに使う土地を増やす」です。海岸部で土地を広げる方法として行われることがあります。"
        ),

        QuizQuestion(
        question: "昔の人が長い用水路をつくるときに必要だったことはどれですか？",
        choices: [
        "土地の高さや水の流れを調べること",
        "毎日同じ場所だけ掘ること",
        "水を上向きに自然に流すこと",
        "地図を見ないこと"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「土地の高さや水の流れを調べること」です。水が流れるように勾配などを考える必要がありました。"
        ),

        QuizQuestion(
        question: "地域の先人の働きを今に伝えるものとして適切なのはどれですか？",
        choices: [
        "記念碑や資料館、古い記録",
        "明日の天気だけ",
        "教室の座席表だけ",
        "テレビ番組だけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「記念碑や資料館、古い記録」です。地域の歴史を知る手がかりになります。"
        ),

        QuizQuestion(
        question: "先人が地域のために行った事業を調べるとき、昔の地図と今の地図を比べる利点はどれですか？",
        choices: [
        "土地の使われ方や交通の変化を読み取れる",
        "天気を正確に予想できる",
        "人の名前がすべてわかる",
        "未来の人口が必ずわかる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「土地の使われ方や交通の変化を読み取れる」です。地図の比較は地域の変化を調べるのに役立ちます。"
        ),

        QuizQuestion(
        question: "用水路が完成したことで農地が広がった場合、地域にはどんな変化が考えられますか？",
        choices: [
        "農作物を育てやすくなる",
        "水が使えなくなる",
        "田畑が必ず消える",
        "道路がすべて閉鎖される"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「農作物を育てやすくなる」です。安定して水を使えることで農業が発展する場合があります。"
        ),

        QuizQuestion(
        question: "川に堤防をつくる主な目的はどれですか？",
        choices: [
        "洪水から周辺の土地を守る",
        "海水を飲み水にする",
        "山を作る",
        "電車を走らせる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「洪水から周辺の土地を守る」です。堤防は川の水があふれる危険を減らすために設けられます。"
        ),

        QuizQuestion(
        question: "先人の事業が長い年月をかけて完成した理由として考えられることはどれですか？",
        choices: [
        "多くの人の協力や工事の難しさがあったから",
        "一人で一日でできるから",
        "材料が不要だから",
        "計画が必要ないから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「多くの人の協力や工事の難しさがあったから」です。大規模な事業には計画、技術、協力が必要でした。"
        ),

        QuizQuestion(
        question: "地域の発展を考えるとき、便利さだけでなく環境にも目を向ける理由はどれですか？",
        choices: [
        "くらしと自然の両方を大切にする必要があるから",
        "自然は地域と関係ないから",
        "便利さだけで必ず問題がなくなるから",
        "環境を調べる必要がないから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「くらしと自然の両方を大切にする必要があるから」です。地域づくりでは環境との調和も重要です。"
        ),

        QuizQuestion(
        question: "昔の工事に使われた道具を資料館で見ると、何を考える手がかりになりますか？",
        choices: [
        "当時の技術や人々の苦労",
        "明日の交通量",
        "未来の天気",
        "現在の給食"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「当時の技術や人々の苦労」です。道具は当時の工事や生活を知る資料になります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】田畑へ水を運ぶためにつくられた水路を「＿＿」といいます。",
        answer: "用水路",
        acceptableAnswers: ["ようすいろ"],
        explanation: "＿＿に入るのは「用水路」です。農業用水などを運ぶために使われます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】川の洪水を防いだり水を利用しやすくしたりする取り組みを「＿＿」といいます。",
        answer: "治水",
        acceptableAnswers: ["ちすい"],
        explanation: "＿＿に入るのは「治水」です。川を整え洪水の被害を減らす取り組みです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】川の水があふれないよう、川に沿って土などを高く盛ったものを「＿＿」といいます。",
        answer: "堤防",
        acceptableAnswers: ["ていぼう"],
        explanation: "＿＿に入るのは「堤防」です。洪水から周辺を守るために設けられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】浅い海や湖などを堤防で囲み、水を抜いて新しい土地をつくることを「＿＿」といいます。",
        answer: "干拓",
        acceptableAnswers: ["かんたく"],
        explanation: "＿＿に入るのは「干拓」です。農地などをつくるために行われてきました。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】海などに土や砂を入れて土地を広げることを「＿＿」といいます。",
        answer: "埋め立て",
        acceptableAnswers: ["埋立て", "うめたて"],
        explanation: "＿＿に入るのは「埋め立て」です。港や工場用地などをつくるために行われることがあります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域を変えた事業と目的を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "用水路", match: "田畑へ水を送る"),
        QuizMatchingPair(prompt: "堤防", match: "洪水の被害を減らす"),
        QuizMatchingPair(prompt: "橋", match: "川を越えて行き来しやすくする"),
        QuizMatchingPair(prompt: "鉄道", match: "人や物を遠くへ運ぶ")
        ],
        choices: ["人や物を遠くへ運ぶ", "川を越えて行き来しやすくする", "田畑へ水を送る", "洪水の被害を減らす"],
        explanation: "用水路、堤防、橋、鉄道はそれぞれ地域のくらしや産業を支える役割があります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】歴史を調べる資料と、わかることを組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "昔の地図", match: "土地の使われ方"),
        QuizMatchingPair(prompt: "古い写真", match: "当時の町の様子"),
        QuizMatchingPair(prompt: "工事の記録", match: "工事の方法や時期"),
        QuizMatchingPair(prompt: "聞き取り", match: "地域の人の経験や思い")
        ],
        choices: ["工事の方法や時期", "土地の使われ方", "地域の人の経験や思い", "当時の町の様子"],
        explanation: "複数の資料を組み合わせると地域の変化をより詳しく調べられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】事業による変化の例を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "用水路の完成", match: "農業用水が安定する"),
        QuizMatchingPair(prompt: "道路の開通", match: "移動時間が短くなる"),
        QuizMatchingPair(prompt: "橋の建設", match: "対岸へ渡りやすくなる"),
        QuizMatchingPair(prompt: "鉄道の開通", match: "遠くとの交流が増える")
        ],
        choices: ["対岸へ渡りやすくなる", "農業用水が安定する", "遠くとの交流が増える", "移動時間が短くなる"],
        explanation: "地域の施設整備は人々のくらしや産業に大きな変化をもたらします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工事で必要な工夫と理由を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "測量する", match: "土地の高さや位置を調べる"),
        QuizMatchingPair(prompt: "計画図を作る", match: "工事の進め方を考える"),
        QuizMatchingPair(prompt: "人手を集める", match: "大きな工事を進める"),
        QuizMatchingPair(prompt: "維持管理する", match: "完成後も安全に使えるようにする")
        ],
        choices: ["大きな工事を進める", "完成後も安全に使えるようにする", "土地の高さや位置を調べる", "工事の進め方を考える"],
        explanation: "大規模な事業は調査、計画、施工、維持管理を重ねて支えられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域の変化と調べ方を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "道路の変化", match: "昔と今の地図を比べる"),
        QuizMatchingPair(prompt: "人口の変化", match: "統計資料を比べる"),
        QuizMatchingPair(prompt: "人々の思い", match: "インタビューする"),
        QuizMatchingPair(prompt: "建物の変化", match: "昔と今の写真を比べる")
        ],
        choices: ["昔と今の写真を比べる", "インタビューする", "昔と今の地図を比べる", "統計資料を比べる"],
        explanation: "調べたい内容に合った資料や方法を選ぶことが大切です。"
        ),

        QuizQuestion.classification(
        question: "【分類】施設を「水を利用するため」「交通を便利にするため」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "用水路", match: "水を利用するため"),
        QuizMatchingPair(prompt: "ため池", match: "水を利用するため"),
        QuizMatchingPair(prompt: "橋", match: "交通を便利にするため"),
        QuizMatchingPair(prompt: "鉄道", match: "交通を便利にするため")
        ],
        categories: ["水を利用するため", "交通を便利にするため"],
        explanation: "用水路やため池は水利用、橋や鉄道は交通を支えます。"
        ),

        QuizQuestion.classification(
        question: "【分類】資料を「文字中心」「写真・地図中心」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "工事日記", match: "文字中心"),
        QuizMatchingPair(prompt: "古文書の記録", match: "文字中心"),
        QuizMatchingPair(prompt: "昔の写真", match: "写真・地図中心"),
        QuizMatchingPair(prompt: "古い地図", match: "写真・地図中心")
        ],
        categories: ["文字中心", "写真・地図中心"],
        explanation: "文字資料と写真・地図資料は、それぞれ異なる情報を伝えます。"
        ),

        QuizQuestion.classification(
        question: "【分類】変化を「くらしの変化」「産業の変化」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "通学しやすくなった", match: "くらしの変化"),
        QuizMatchingPair(prompt: "病院へ行きやすくなった", match: "くらしの変化"),
        QuizMatchingPair(prompt: "農作物を多く出荷できるようになった", match: "産業の変化"),
        QuizMatchingPair(prompt: "工場へ材料を運びやすくなった", match: "産業の変化")
        ],
        categories: ["くらしの変化", "産業の変化"],
        explanation: "交通や水利の整備はくらしと産業の両方に影響します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】地域の先人について調べる学習の流れを並べましょう。",
        choices: ["調べた内容をまとめる", "疑問を出す", "資料や聞き取りで調べる", "発表して考えを交流する"],
        orderedChoices: ["疑問を出す", "資料や聞き取りで調べる", "調べた内容をまとめる", "発表して考えを交流する"],
        explanation: "疑問をもち、調べ、まとめ、交流する流れで先人の働きを考えます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】用水路完成後に米の収穫量が最も増えた地区を答えましょう。",
        answer: "C地区",
        acceptableAnswers: ["C"],
        referenceTitle: "用水路完成前後の米収穫量（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A地区", value: "前80t→後110t"),
        QuizReferenceRow(label: "B地区", value: "前90t→後125t"),
        QuizReferenceRow(label: "C地区", value: "前70t→後120t"),
        QuizReferenceRow(label: "D地区", value: "前100t→後130t")
        ],
        explanation: "増加量はA30t、B35t、C50t、D30tなので、最も増えたのはC地区です。"
        ),

        QuizQuestion(
        question: "市役所や町役場の仕事として適切なのはどれですか？",
        choices: [
        "住民票などの手続きや地域の行政を行う",
        "国会で法律を決める",
        "全国の裁判を行う",
        "外国との条約を結ぶ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「住民票などの手続きや地域の行政を行う」です。市役所や町役場は地域のくらしを支える行政を行います。"
        ),

        QuizQuestion(
        question: "地域の人々の意見を行政に生かす方法の例はどれですか？",
        choices: [
        "アンケートや意見募集",
        "道路への落書き",
        "資料を捨てる",
        "会議を禁止する"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「アンケートや意見募集」です。住民の声を聞いて地域づくりに生かす取り組みがあります。"
        ),

        QuizQuestion(
        question: "市議会や町議会の主な役割はどれですか？",
        choices: [
        "地域の決まりや予算について話し合い決める",
        "全国の天気を決める",
        "学校の時間割だけを作る",
        "すべての裁判を行う"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地域の決まりや予算について話し合い決める」です。地方議会は地域の行政について議論し議決します。"
        ),

        QuizQuestion(
        question: "地域の公共施設に図書館や公民館がある理由として適切なのはどれですか？",
        choices: [
        "住民の学習や交流を支えるため",
        "ごみを燃やすためだけ",
        "川をせき止めるため",
        "空港を作るため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「住民の学習や交流を支えるため」です。公共施設は地域のさまざまな活動を支えます。"
        ),

        QuizQuestion(
        question: "隣り合う市町村が協力してごみ処理施設を使うことがある理由はどれですか？",
        choices: [
        "広い地域で効率よく施設を利用するため",
        "すべてのごみを道路に置くため",
        "市町村の境をなくすため",
        "住民を移動させるため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「広い地域で効率よく施設を利用するため」です。複数の自治体が協力して公共サービスを行うことがあります。"
        ),

        QuizQuestion(
        question: "地域のバス路線を維持するために自治体が支援することがあるのはなぜですか？",
        choices: [
        "通学や通院など住民の移動を支えるため",
        "車を一台も使えなくするため",
        "道路を閉鎖するため",
        "駅をすべてなくすため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「通学や通院など住民の移動を支えるため」です。公共交通は地域の生活に重要な役割をもちます。"
        ),

        QuizQuestion(
        question: "公園を整備する目的として適切なのはどれですか？",
        choices: [
        "住民が休んだり遊んだりできる場所をつくる",
        "住宅を必ずなくす",
        "川を汚す",
        "学校を閉鎖する"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「住民が休んだり遊んだりできる場所をつくる」です。公園は地域の人が利用する公共の場所です。"
        ),

        QuizQuestion(
        question: "地域の環境を守るための取り組みとして適切なのはどれですか？",
        choices: [
        "川や道路の清掃活動",
        "ごみを川に捨てる",
        "緑地をすべてなくす",
        "水を汚す"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「川や道路の清掃活動」です。地域の人や自治体が協力して環境を守ることがあります。"
        ),

        QuizQuestion(
        question: "地域の防犯活動に住民が参加する利点はどれですか？",
        choices: [
        "地域の安全をみんなで見守れる",
        "事件を増やす",
        "街灯を消す",
        "通学路をなくす"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地域の安全をみんなで見守れる」です。地域の見守りは子どもや住民の安全につながります。"
        ),

        QuizQuestion(
        question: "少子高齢化が進む地域で必要になることの例はどれですか？",
        choices: [
        "高齢者の移動や生活を支えるサービス",
        "すべての公共施設を閉める",
        "病院をなくす",
        "バスを必ず廃止する"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「高齢者の移動や生活を支えるサービス」です。地域の人口構成に合わせた行政サービスが必要になります。"
        ),

        QuizQuestion(
        question: "地域の観光を発展させる取り組みとして適切なのはどれですか？",
        choices: [
        "地域の自然や文化を紹介する",
        "文化財を壊す",
        "案内表示をなくす",
        "観光地への道を閉鎖する"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地域の自然や文化を紹介する」です。地域の魅力を発信することが観光の振興につながります。"
        ),

        QuizQuestion(
        question: "自治体が災害時に避難所を開設する目的はどれですか？",
        choices: [
        "住民の安全を確保する",
        "ごみを増やす",
        "道路を閉じるだけ",
        "観光客を集める"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「住民の安全を確保する」です。避難所は災害時に安全な場所や生活の場を提供します。"
        ),

        QuizQuestion(
        question: "市の予算とは何ですか？",
        choices: [
        "市が1年間にどのようにお金を集め使うかの計画",
        "市内の天気の記録",
        "学校の時間割",
        "駅の時刻表"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「市が1年間にどのようにお金を集め使うかの計画」です。予算は行政サービスを進めるための重要な計画です。"
        ),

        QuizQuestion(
        question: "市民が公共施設を利用するときに大切なことはどれですか？",
        choices: [
        "ルールを守りみんなが使いやすいようにする",
        "設備を壊す",
        "ごみを置いて帰る",
        "他の人を入れない"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「ルールを守りみんなが使いやすいようにする」です。公共施設は多くの人が利用する場所です。"
        ),

        QuizQuestion(
        question: "地域の課題を解決するとき、行政と住民が協力することのよさはどれですか？",
        choices: [
        "それぞれの立場や力を生かせる",
        "意見を聞かなくてよくなる",
        "地域の情報が減る",
        "活動ができなくなる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「それぞれの立場や力を生かせる」です。地域づくりでは行政、住民、団体などの協力が大切です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】市や町など、地域の行政を行う組織を「地方＿＿」といいます。",
        answer: "公共団体",
        acceptableAnswers: ["地方公共団体"],
        explanation: "＿＿に入るのは「公共団体」です。市町村や都道府県は地方公共団体です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】市の行政の中心となる役所を「＿＿」といいます。",
        answer: "市役所",
        acceptableAnswers: ["しやくしょ"],
        explanation: "＿＿に入るのは「市役所」です。市民の手続きや地域の行政を行います。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】市町村の議会で話し合い、地域の決まりとして定めるものを「＿＿」といいます。",
        answer: "条例",
        acceptableAnswers: ["じょうれい"],
        explanation: "＿＿に入るのは「条例」です。地方公共団体が地域のルールとして定めます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】自治体が1年間に使うお金などの計画を「＿＿」といいます。",
        answer: "予算",
        acceptableAnswers: ["よさん"],
        explanation: "＿＿に入るのは「予算」です。行政サービスや施設整備などに使うお金を計画します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域の人々が協力して住みよい地域をつくる活動を「＿＿づくり」と表すことがあります。",
        answer: "まち",
        acceptableAnswers: ["町", "街"],
        explanation: "＿＿に入るのは「まち」です。まちづくりには行政や住民など多くの人が関わります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】公共施設と主な役割を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "図書館", match: "本や資料を利用できる"),
        QuizMatchingPair(prompt: "公民館", match: "学習や地域活動に利用できる"),
        QuizMatchingPair(prompt: "保健センター", match: "健康相談や健診などを行う"),
        QuizMatchingPair(prompt: "市役所", match: "行政手続きや地域の行政を行う")
        ],
        choices: ["健康相談や健診などを行う", "行政手続きや地域の行政を行う", "学習や地域活動に利用できる", "本や資料を利用できる"],
        explanation: "公共施設はそれぞれ異なる役割で地域のくらしを支えています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域の課題と取り組みの例を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "交通が不便", match: "コミュニティバスを運行する"),
        QuizMatchingPair(prompt: "空き家が増える", match: "活用や管理の方法を考える"),
        QuizMatchingPair(prompt: "ごみが多い", match: "分別や減量を進める"),
        QuizMatchingPair(prompt: "防災が課題", match: "避難訓練や備蓄を進める")
        ],
        choices: ["分別や減量を進める", "避難訓練や備蓄を進める", "活用や管理の方法を考える", "コミュニティバスを運行する"],
        explanation: "地域の課題に応じてさまざまな対策が行われます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】行政の仕事と具体例を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "福祉", match: "高齢者や障害のある人の生活を支える"),
        QuizMatchingPair(prompt: "教育", match: "学校や学習環境を整える"),
        QuizMatchingPair(prompt: "防災", match: "避難所や防災情報を整える"),
        QuizMatchingPair(prompt: "環境", match: "ごみ処理や自然環境を守る")
        ],
        choices: ["学校や学習環境を整える", "ごみ処理や自然環境を守る", "避難所や防災情報を整える", "高齢者や障害のある人の生活を支える"],
        explanation: "地方公共団体は住民の生活に関わる幅広い仕事を行います。"
        ),

        QuizQuestion.related(
        question: "【関連付け】住民が意見を伝える方法と内容を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "アンケート", match: "多くの住民から意見を集める"),
        QuizMatchingPair(prompt: "住民説明会", match: "計画の説明を聞き意見を伝える"),
        QuizMatchingPair(prompt: "パブリックコメント", match: "計画案などへの意見を提出する"),
        QuizMatchingPair(prompt: "地域会議", match: "地域の課題を話し合う")
        ],
        choices: ["地域の課題を話し合う", "多くの住民から意見を集める", "計画案などへの意見を提出する", "計画の説明を聞き意見を伝える"],
        explanation: "自治体はさまざまな方法で住民の意見を聞くことがあります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域の協力と目的を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "複数市町村でごみ処理", match: "施設を共同で効率よく使う"),
        QuizMatchingPair(prompt: "合同防災訓練", match: "広い地域で災害に備える"),
        QuizMatchingPair(prompt: "観光ルートづくり", match: "地域をまたいで魅力を発信する"),
        QuizMatchingPair(prompt: "河川の清掃活動", match: "流域全体の環境を守る")
        ],
        choices: ["流域全体の環境を守る", "地域をまたいで魅力を発信する", "広い地域で災害に備える", "施設を共同で効率よく使う"],
        explanation: "地域を越えた課題では複数の自治体や住民が協力することがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】仕事を「市役所などの行政」「住民や地域団体の活動」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "住民票を発行する", match: "市役所などの行政"),
        QuizMatchingPair(prompt: "道路を整備する", match: "市役所などの行政"),
        QuizMatchingPair(prompt: "町内の清掃活動に参加する", match: "住民や地域団体の活動"),
        QuizMatchingPair(prompt: "登下校の見守りをする", match: "住民や地域団体の活動")
        ],
        categories: ["市役所などの行政", "住民や地域団体の活動"],
        explanation: "行政と住民のそれぞれの活動が地域のくらしを支えています。"
        ),

        QuizQuestion.classification(
        question: "【分類】施設を「学習・交流」「健康・福祉」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "図書館", match: "学習・交流"),
        QuizMatchingPair(prompt: "公民館", match: "学習・交流"),
        QuizMatchingPair(prompt: "保健センター", match: "健康・福祉"),
        QuizMatchingPair(prompt: "福祉センター", match: "健康・福祉")
        ],
        categories: ["学習・交流", "健康・福祉"],
        explanation: "公共施設には学習・交流を支えるものと健康・福祉を支えるものがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】取り組みを「環境を守る」「地域の安全を守る」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "川の清掃", match: "環境を守る"),
        QuizMatchingPair(prompt: "資源回収", match: "環境を守る"),
        QuizMatchingPair(prompt: "防犯パトロール", match: "地域の安全を守る"),
        QuizMatchingPair(prompt: "避難訓練", match: "地域の安全を守る")
        ],
        categories: ["環境を守る", "地域の安全を守る"],
        explanation: "環境保全と安全確保はどちらも住みよい地域づくりに欠かせません。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】地域の課題を解決するための学習の流れを並べましょう。",
        choices: ["解決策を考える", "地域の課題を見つける", "資料や聞き取りで原因を調べる", "考えたことを発表する"],
        orderedChoices: ["地域の課題を見つける", "資料や聞き取りで原因を調べる", "解決策を考える", "考えたことを発表する"],
        explanation: "課題を見つけ、調べ、解決策を考え、発表する流れで地域について考えます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】市の予算で最も多く使われている分野を答えましょう。",
        answer: "福祉",
        acceptableAnswers: ["福祉費"],
        referenceTitle: "市の支出割合（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "福祉", value: "36%"),
        QuizReferenceRow(label: "教育", value: "18%"),
        QuizReferenceRow(label: "道路・公園", value: "16%"),
        QuizReferenceRow(label: "ごみ・環境", value: "12%")
        ],
        explanation: "最も割合が大きいのは36%の福祉です。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai4, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Shakai4ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai4ListView(isPresenting: .constant(false))
    }
}
