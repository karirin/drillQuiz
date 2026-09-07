//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Shakai3ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.related(
            question: "【関連付け】県名と 特産品が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "青森県", match: "りんご"),
                QuizMatchingPair(prompt: "新潟県", match: "米"),
                QuizMatchingPair(prompt: "沖縄県", match: "さとうきび")
            ],
            choices: ["米", "さとうきび", "りんご"],
            explanation: "青森県は りんご、新潟県は 米、沖縄県は さとうきびで よく知られています。"
        ),

        QuizQuestion.classification(
            question: "【分類】仕事や とれるものを 産業の 仲間で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "りんご", match: "農業"),
                QuizMatchingPair(prompt: "まぐろ", match: "水産業"),
                QuizMatchingPair(prompt: "自動車", match: "工業")
            ],
            categories: ["農業", "水産業", "工業"],
            explanation: "りんごは 農業、まぐろは 水産業、自動車は 工業に 関係します。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】山の 高い順に 並べましょう。",
            choices: ["北岳", "富士山", "奥穂高岳"],
            rankedChoices: ["富士山", "北岳", "奥穂高岳"],
            explanation: "いちばん 高いのは 富士山で、その次が 北岳、奥穂高岳です。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】りんごの 生産量が 多い順に 並べましょう。",
            choices: ["岩手県", "青森県", "長野県"],
            rankedChoices: ["青森県", "長野県", "岩手県"],
            explanation: "一番 多いのは 青森県、その次が 長野県、岩手県です。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】地方を 北から 南の 順に 並べましょう。",
            choices: ["関東地方", "九州地方", "北海道"],
            rankedChoices: ["北海道", "関東地方", "九州地方"],
            explanation: "北海道が いちばん 北、そのあと 関東地方、九州地方の順です。"
        ),

        QuizQuestion.related(
            question: "【関連付け】県名と 県庁所在地が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "北海道", match: "札幌市"),
                QuizMatchingPair(prompt: "宮城県", match: "仙台市"),
                QuizMatchingPair(prompt: "福岡県", match: "福岡市")
            ],
            choices: ["福岡市", "札幌市", "仙台市"],
            explanation: "北海道は 札幌市、宮城県は 仙台市、福岡県は 福岡市です。"
        ),

        QuizQuestion.classification(
            question: "【分類】都道府県を 地方で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "青森県", match: "東北地方"),
                QuizMatchingPair(prompt: "東京都", match: "関東地方"),
                QuizMatchingPair(prompt: "福岡県", match: "九州地方")
            ],
            categories: ["東北地方", "関東地方", "九州地方"],
            explanation: "青森県は 東北、東京都は 関東、福岡県は 九州の 仲間です。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】川の 長い順に 並べましょう。",
            choices: ["石狩川", "利根川", "信濃川"],
            rankedChoices: ["信濃川", "利根川", "石狩川"],
            explanation: "いちばん 長いのは 信濃川で、その次が 利根川、石狩川です。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】米作りの 流れを 並べましょう。",
            choices: ["稲刈り", "田植え", "出荷"],
            orderedChoices: ["田植え", "稲刈り", "出荷"],
            explanation: "米は 田植えをしてから 育て、稲刈りをして 出荷されます。"
        ),

        QuizQuestion.related(
            question: "【関連付け】都道府県と 名産が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "北海道", match: "じゃがいも"),
                QuizMatchingPair(prompt: "静岡県", match: "茶"),
                QuizMatchingPair(prompt: "千葉県", match: "落花生")
            ],
            choices: ["茶", "落花生", "じゃがいも"],
            explanation: "北海道は じゃがいも、静岡県は 茶、千葉県は 落花生で 知られています。"
        ),

        QuizQuestion.classification(
            question: "【分類】仕事を 産業で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "みかんを 育てる", match: "農業"),
                QuizMatchingPair(prompt: "魚を とる", match: "水産業"),
                QuizMatchingPair(prompt: "車を 作る", match: "工業")
            ],
            categories: ["農業", "水産業", "工業"],
            explanation: "みかんを 育てるのは 農業、魚を とるのは 水産業、車を 作るのは 工業です。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】島の 大きい順に 並べましょう。",
            choices: ["九州", "本州", "北海道"],
            rankedChoices: ["本州", "北海道", "九州"],
            explanation: "島の 大きさは、本州、北海道、九州の順です。"
        ),

        QuizQuestion.related(
            question: "【関連付け】地形の 名前と 説明が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "平野", match: "広く平らな 土地"),
                QuizMatchingPair(prompt: "盆地", match: "山に 囲まれた 土地"),
                QuizMatchingPair(prompt: "台地", match: "まわりより 少し高い 平らな 土地")
            ],
            choices: ["山に 囲まれた 土地", "まわりより 少し高い 平らな 土地", "広く平らな 土地"],
            explanation: "平野、盆地、台地は 土地の形の ちがいを 表すことばです。"
        ),

        QuizQuestion.classification(
            question: "【分類】土地の 使われ方を 産業で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "田んぼ", match: "農業"),
                QuizMatchingPair(prompt: "漁港", match: "水産業"),
                QuizMatchingPair(prompt: "工場", match: "工業")
            ],
            categories: ["農業", "水産業", "工業"],
            explanation: "田んぼは 農業、漁港は 水産業、工場は 工業に 関係します。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】野菜が 店に 並ぶまでの 流れを 並べましょう。",
            choices: ["出荷する", "収穫する", "種を まく"],
            orderedChoices: ["種を まく", "収穫する", "出荷する"],
            explanation: "野菜は 種を まいて 育て、収穫してから 店へ 出荷されます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】都道府県を 北から 南の 順に 並べましょう。",
            choices: ["沖縄県", "北海道", "東京都"],
            rankedChoices: ["北海道", "東京都", "沖縄県"],
            explanation: "北から見ると、北海道、東京都、沖縄県の順です。"
        ),

        QuizQuestion(
            question: "日本で一番高い山はどれですか？",
            choices: [
                "富士山",
                "白山",
                "阿蘇山",
                "高尾山"
            ],
            correctAnswerIndex: 0,
            explanation: "日本で最も高い山は富士山で、標高は3,776メートルです。"
        ),

        QuizQuestion(
            question: "日本で最も長い川はどれですか？",
            choices: [
                "信濃川",
                "利根川",
                "四万十川",
                "天竜川"
            ],
            correctAnswerIndex: 0,
            explanation: "信濃川は日本で最も長い川で、全長は367キロメートルです。"
        ),

        QuizQuestion(
            question: "りんごの生産が盛んな県はどこですか？",
            choices: [
                "青森県",
                "大阪府",
                "福岡県",
                "神奈川県"
            ],
            correctAnswerIndex: 0,
            explanation: "青森県はりんごの生産量が日本一で有名です。"
        ),
        QuizQuestion(
            question: "日本で一番大きな湖はどれですか？",
            choices: [
                "霞ヶ浦",
                "琵琶湖",
                "猪苗代湖",
                "中禅寺湖"
            ],
            correctAnswerIndex: 1,
            explanation: "琵琶湖は日本最大の湖で、滋賀県にあります。"
        ),

        QuizQuestion(
            question: "日本で一番南にある県はどこですか？",
            choices: [
                "沖縄県",
                "鹿児島県",
                "宮崎県",
                "熊本県"
            ],
            correctAnswerIndex: 0,
            explanation: "沖縄県は日本の最南端に位置する県です。"
        ),

        QuizQuestion(
            question: "米の生産が盛んな県はどこですか？",
            choices: [
                "新潟県",
                "北海道",
                "長野県",
                "秋田県"
            ],
            correctAnswerIndex: 0,
            explanation: "新潟県は米の生産が非常に盛んな地域で、特にコシヒカリが有名です。"
        ),
        QuizQuestion(
            question: "日本で一番面積が大きい都道府県はどれですか？",
            choices: [
                "北海道",
                "青森県",
                "岩手県",
                "福島県"
            ],
            correctAnswerIndex: 0,
            explanation: "北海道は日本で最も面積が大きい都道府県です。"
        ),

        QuizQuestion(
            question: "日本で一番降水量が多い地域はどこですか？",
            choices: [
                "屋久島",
                "富士山",
                "東京",
                "京都"
            ],
            correctAnswerIndex: 0,
            explanation: "屋久島は日本でも特に降水量が多い地域として知られています。"
        ),

        QuizQuestion(
            question: "日本で最も大きな島はどれですか？",
            choices: [
                "本州",
                "九州",
                "四国",
                "北海道"
            ],
            correctAnswerIndex: 0,
            explanation: "本州は日本で最も大きな島で、国土の大部分を占めています。"
        ),

        QuizQuestion(
            question: "日本で一番面積が小さい都道府県はどこですか？",
            choices: [
                "香川県",
                "徳島県",
                "大阪府",
                "沖縄県"
            ],
            correctAnswerIndex: 0,
            explanation: "香川県は日本で最も面積が小さい都道府県です。"
        ),

        QuizQuestion(
            question: "日本で最も北にある島はどこですか？",
            choices: [
                "沖縄本島",
                "佐渡島",
                "利尻島",
                "礼文島"
            ],
            correctAnswerIndex: 3,
            explanation: "礼文島は日本で最も北に位置する有人島です。"
        ),

        QuizQuestion(
            question: "日本で有名な火山である桜島がある県はどこですか？",
            choices: [
                "鹿児島県",
                "熊本県",
                "宮崎県",
                "大分県"
            ],
            correctAnswerIndex: 0,
            explanation: "桜島は鹿児島県にあり、活動が活発な火山です。"
        ),

        QuizQuestion(
            question: "日本で最も深い湖はどれですか？",
            choices: [
                "田沢湖",
                "琵琶湖",
                "摩周湖",
                "猪苗代湖"
            ],
            correctAnswerIndex: 0,
            explanation: "田沢湖は日本で最も深い湖で、最大水深は約423メートルです。"
        ),
        QuizQuestion(
            question: "日本で最も早く日の出を迎える地域はどこですか？",
            choices: [
                "北海道",
                "沖縄県",
                "東京都",
                "千葉県"
            ],
            correctAnswerIndex: 0,
            explanation: "日本で最も早く日の出を迎えるのは、北海道の根室市です。"
        ),

        QuizQuestion(
            question: "日本で最も漁獲量が多い県はどこですか？",
            choices: [
                "北海道",
                "宮城県",
                "青森県",
                "長崎県"
            ],
            correctAnswerIndex: 0,
            explanation: "北海道は日本で最も漁獲量が多い県で、特にサケやカニが有名です。"
        ),

        QuizQuestion(
            question: "日本で最も面積が広い湖はどれですか？",
            choices: [
                "霞ヶ浦",
                "猪苗代湖",
                "琵琶湖",
                "中禅寺湖"
            ],
            correctAnswerIndex: 2,
            explanation: "琵琶湖は日本で最も面積が広い湖です。"
        ),

        QuizQuestion(
            question: "日本で最も多くの雪が降る地域はどこですか？",
            choices: [
                "富山県",
                "北海道",
                "新潟県",
                "青森県"
            ],
            correctAnswerIndex: 3,
            explanation: "青森県は日本で最も多くの雪が降る地域のひとつです。"
        ),
        QuizQuestion(
            question: "日本で最も多くの温泉がある都市はどこですか？",
            choices: [
                "別府市",
                "箱根町",
                "草津町",
                "湯布院町"
            ],
            correctAnswerIndex: 0,
            explanation: "別府市は温泉の数が非常に多く、日本を代表する温泉地です。"
        ),

        QuizQuestion(
            question: "日本で最も南に位置する島はどれですか？",
            choices: [
                "与那国島",
                "沖縄本島",
                "石垣島",
                "奄美大島"
            ],
            correctAnswerIndex: 0,
            explanation: "与那国島は日本で最も南に位置する島です。"
        ),

        QuizQuestion(
            question: "日本で最も有名な陶磁器の産地はどこですか？",
            choices: [
                "佐賀県",
                "京都府",
                "岐阜県",
                "長崎県"
            ],
            correctAnswerIndex: 0,
            explanation: "佐賀県有田町は有田焼で有名な陶磁器の産地です。"
        ),

        QuizQuestion(
            question: "日本で最も降雪量が多い都市はどこですか？",
            choices: [
                "新潟市",
                "札幌市",
                "富山市",
                "青森市"
            ],
            correctAnswerIndex: 3,
            explanation: "青森市は日本で最も降雪量が多い都市として知られています。"
        ),
        QuizQuestion(
            question: "日本で最も大きな平野はどれですか？",
            choices: [
                "関東平野",
                "濃尾平野",
                "石狩平野",
                "越後平野"
            ],
            correctAnswerIndex: 0,
            explanation: "関東平野は日本で最も大きな平野で、東京や埼玉などが含まれます。"
        ),

        QuizQuestion(
            question: "日本で最も古い木造建築はどこにありますか？",
            choices: [
                "奈良県",
                "京都府",
                "東京都",
                "和歌山県"
            ],
            correctAnswerIndex: 0,
            explanation: "奈良県にある法隆寺は、世界最古の木造建築として知られています。"
        ),

        QuizQuestion(
            question: "日本で最も多くのリンゴが生産される県はどこですか？",
            choices: [
                "青森県",
                "長野県",
                "山形県",
                "秋田県"
            ],
            correctAnswerIndex: 0,
            explanation: "青森県は日本で最も多くのリンゴが生産される県です。"
        ),

        QuizQuestion(
            question: "日本で最も面積の大きな国立公園はどこですか？",
            choices: [
                "阿寒摩周国立公園",
                "大雪山国立公園",
                "知床国立公園",
                "富士箱根伊豆国立公園"
            ],
            correctAnswerIndex: 1,
            explanation: "大雪山国立公園は、日本で最も面積が大きい国立公園です。"
        ),

        QuizQuestion(
            question: "日本で一番標高の高い湖はどれですか？",
            choices: [
                "中禅寺湖",
                "田沢湖",
                "芦ノ湖",
                "摩周湖"
            ],
            correctAnswerIndex: 0,
            explanation: "中禅寺湖は、日本で最も標高が高い湖で、日光に位置します。"
        ),

        QuizQuestion(
            question: "日本で最も栽培されているお米の品種はどれですか？",
            choices: [
                "ひとめぼれ",
                "コシヒカリ",
                "あきたこまち",
                "つや姫"
            ],
            correctAnswerIndex: 1,
            explanation: "コシヒカリは、日本で最も多く栽培されているお米の品種です。"
        ),

        QuizQuestion(
            question: "日本で最も多くの台風が上陸する地域はどこですか？",
            choices: [
                "沖縄県",
                "鹿児島県",
                "高知県",
                "宮崎県"
            ],
            correctAnswerIndex: 1,
            explanation: "鹿児島県は、日本で最も多くの台風が上陸する都道府県です。"
        ),

        QuizQuestion(
            question: "日本で最も歴史のあるお祭りはどれですか？",
            choices: [
                "祇園祭",
                "青森ねぶた祭",
                "博多どんたく",
                "三社祭"
            ],
            correctAnswerIndex: 0,
            explanation: "祇園祭は京都で行われるお祭りで、日本で最も歴史のあるお祭りです。"
        ),
        QuizQuestion(
            question: "日本で最も大きな港はどれですか？",
            choices: [
                "神戸港",
                "横浜港",
                "名古屋港",
                "大阪港"
            ],
            correctAnswerIndex: 2,
            explanation: "名古屋港は日本で最も大きな港として知られています。"
        ),

        QuizQuestion(
            question: "日本で最も西にある島はどれですか？",
            choices: [
                "与那国島",
                "沖縄本島",
                "宮古島",
                "石垣島"
            ],
            correctAnswerIndex: 0,
            explanation: "与那国島は日本で最も西に位置する島です。"
        ),

        QuizQuestion(
            question: "日本で最も高いビルはどれですか？",
            choices: [
                "あべのハルカス",
                "麻布台ヒルズ森JPタワー",
                "ランドマークタワー",
                "六本木ヒルズ"
            ],
            correctAnswerIndex: 1,
            explanation: "麻布台ヒルズ森JPタワーは高さ約330メートルで、2023年に日本で最も高いビルになりました。"
        ),

        QuizQuestion(
            question: "日本で最も多くの車が生産されている県はどこですか？",
            choices: [
                "愛知県",
                "静岡県",
                "栃木県",
                "群馬県"
            ],
            correctAnswerIndex: 0,
            explanation: "愛知県は日本で最も多くの車が生産されている地域で、特にトヨタ自動車が有名です。"
        ),

        QuizQuestion(
            question: "日本で最も古い大学はどれですか？",
            choices: [
                "京都大学",
                "東京大学",
                "慶應義塾大学",
                "早稲田大学"
            ],
            correctAnswerIndex: 1,
            explanation: "東京大学は日本最古の大学で、1877年に創立されました。"
        ),

        QuizQuestion(
            question: "日本で最も多くの城（城跡）がある県はどこですか？",
            choices: [
                "愛知県",
                "兵庫県",
                "長野県",
                "福岡県"
            ],
            correctAnswerIndex: 1,
            explanation: "兵庫県は城跡の数が日本で最も多い県として知られています。"
        ),

        QuizQuestion(
            question: "日本で最も長いトンネルはどれですか？",
            choices: [
                "関門トンネル",
                "青函トンネル",
                "山手トンネル",
                "首都高速湾岸線トンネル"
            ],
            correctAnswerIndex: 1,
            explanation: "青函トンネルは日本で最も長いトンネルで、全長は53.85キロメートルです。"
        ),

        QuizQuestion(
            question: "日本で最も大きな動物園はどれですか？",
            choices: [
                "旭山動物園",
                "上野動物園",
                "東山動植物園",
                "天王寺動物園"
            ],
            correctAnswerIndex: 2,
            explanation: "東山動植物園は日本で最も面積が広い動物園です。"
        ),
        QuizQuestion(
            question: "日本で最も長い橋はどれですか？",
            choices: [
                "瀬戸大橋",
                "明石海峡大橋",
                "レインボーブリッジ",
                "大鳴門橋"
            ],
            correctAnswerIndex: 0,
            explanation: "瀬戸大橋は全長約13.1キロメートルで、日本で最も長い橋です（明石海峡大橋は世界最長の吊り橋です）。"
        ),

        QuizQuestion(
            question: "日本で最も大きな祭りはどれですか？",
            choices: [
                "祇園祭",
                "ねぶた祭",
                "博多祇園山笠",
                "三社祭"
            ],
            correctAnswerIndex: 0,
            explanation: "祇園祭は京都で行われ、日本三大祭りの一つです。"
        ),

        QuizQuestion(
            question: "日本で最も漁獲量が多い魚はどれですか？",
            choices: [
                "マグロ",
                "サバ",
                "イワシ",
                "サケ"
            ],
            correctAnswerIndex: 2,
            explanation: "イワシは日本で最も多く漁獲される魚の一つです。"
        ),

        QuizQuestion(
            question: "日本で最も大きな島はどれですか？",
            choices: [
                "九州",
                "四国",
                "本州",
                "北海道"
            ],
            correctAnswerIndex: 2,
            explanation: "本州は日本で最も大きな島で、国土の約60%を占めています。"
        ),

        QuizQuestion(
            question: "日本で最も歴史のあるお寺はどれですか？",
            choices: [
                "東大寺",
                "清水寺",
                "法隆寺",
                "金閣寺"
            ],
            correctAnswerIndex: 2,
            explanation: "法隆寺は世界最古の木造建築で、奈良県にあります。"
        ),

        QuizQuestion(
            question: "日本で最も広い都道府県はどこですか？",
            choices: [
                "北海道",
                "長野県",
                "新潟県",
                "青森県"
            ],
            correctAnswerIndex: 0,
            explanation: "北海道は日本で最も広い都道府県です。"
        ),

        QuizQuestion(
            question: "日本で最も人気のある観光地はどこですか？",
            choices: [
                "東京タワー",
                "金閣寺",
                "富士山",
                "厳島神社"
            ],
            correctAnswerIndex: 2,
            explanation: "富士山は日本を代表する観光地で、多くの国内外からの観光客が訪れます。"
        ),

        QuizQuestion(
            question: "日本で最も多くのうどんが生産されている県はどこですか？",
            choices: [
                "香川県",
                "愛知県",
                "大阪府",
                "福岡県"
            ],
            correctAnswerIndex: 0,
            explanation: "香川県は「うどん県」としても知られ、日本で最も多くのうどんが生産されています。"
        ),
        QuizQuestion(
            question: "日本で最も長い川はどれですか？",
            choices: [
                "利根川",
                "四万十川",
                "信濃川",
                "木曽川"
            ],
            correctAnswerIndex: 2,
            explanation: "信濃川は日本で最も長い川で、全長は367キロメートルです。"
        ),

        QuizQuestion(
            question: "日本で最も多くの電車が通る駅はどこですか？",
            choices: [
                "渋谷駅",
                "新宿駅",
                "東京駅",
                "品川駅"
            ],
            correctAnswerIndex: 1,
            explanation: "新宿駅は世界で最も多くの電車が発着する駅として知られています。"
        ),

        QuizQuestion(
            question: "日本で最も広い砂丘はどこにありますか？",
            choices: [
                "鳥取砂丘",
                "九十九里浜",
                "湘南海岸",
                "遠州灘"
            ],
            correctAnswerIndex: 0,
            explanation: "鳥取砂丘は日本で最も広い砂丘で、鳥取県にあります。"
        ),

        QuizQuestion(
            question: "日本で最も高い木造建築はどれですか？",
            choices: [
                "東大寺大仏殿",
                "五重塔（法隆寺）",
                "金閣寺",
                "スカイツリー"
            ],
            correctAnswerIndex: 0,
            explanation: "東大寺大仏殿は、世界最大の木造建築物として知られています。"
        ),

        QuizQuestion(
            question: "日本で最も多くのお茶が生産されている県はどこですか？",
            choices: [
                "静岡県",
                "鹿児島県",
                "京都府",
                "愛知県"
            ],
            correctAnswerIndex: 0,
            explanation: "静岡県は日本で最もお茶の生産が盛んな地域です。"
        ),

        QuizQuestion(
            question: "日本で最も高い気温が記録された場所はどこですか？",
            choices: [
                "浜松市",
                "熊谷市",
                "高知市",
                "館林市"
            ],
            correctAnswerIndex: 1,
            explanation: "埼玉県熊谷市は、過去に日本で最も高い41.1度が記録された場所です。"
        ),

        QuizQuestion(
            question: "日本で最も多くの木材が生産されている地域はどこですか？",
            choices: [
                "北海道",
                "青森県",
                "長野県",
                "岐阜県"
            ],
            correctAnswerIndex: 0,
            explanation: "北海道は日本で最も木材の生産が盛んな地域です。"
        ),

        QuizQuestion(
            question: "日本で最も有名な桜の名所はどこですか？",
            choices: [
                "上野公園",
                "吉野山",
                "円山公園",
                "兼六園"
            ],
            correctAnswerIndex: 1,
            explanation: "吉野山は日本有数の桜の名所として知られています。"
        ),
        QuizQuestion(
            question: "日本で最も人口が多い都道府県はどこですか？",
            choices: [
                "大阪府",
                "東京都",
                "神奈川県",
                "愛知県"
            ],
            correctAnswerIndex: 1,
            explanation: "東京都は日本で最も人口が多い都道府県です。"
        ),

        QuizQuestion(
            question: "日本で最も長い半島はどこですか？",
            choices: [
                "能登半島",
                "紀伊半島",
                "三浦半島",
                "渥美半島"
            ],
            correctAnswerIndex: 1,
            explanation: "紀伊半島は日本で最も長い半島です。"
        ),

        QuizQuestion(
            question: "日本で最も多くの火山がある地域はどこですか？",
            choices: [
                "九州",
                "北海道",
                "東北",
                "中部"
            ],
            correctAnswerIndex: 0,
            explanation: "九州には多くの火山があり、特に活発な火山活動が見られます。"
        ),

        QuizQuestion(
            question: "日本で最も広い山地はどれですか？",
            choices: [
                "飛騨山脈",
                "阿蘇山",
                "奥羽山脈",
                "六甲山"
            ],
            correctAnswerIndex: 2,
            explanation: "奥羽山脈は日本で最も広い山脈で、東北地方を縦断しています。"
        ),

        QuizQuestion(
            question: "日本で最も多くの島々からなる県はどこですか？",
            choices: [
                "沖縄県",
                "鹿児島県",
                "長崎県",
                "広島県"
            ],
            correctAnswerIndex: 2,
            explanation: "長崎県は多くの島々から成り立っており、五島列島や壱岐・対馬が有名です。"
        ),

        QuizQuestion(
            question: "日本で最も大きな空港はどれですか？",
            choices: [
                "成田国際空港",
                "関西国際空港",
                "羽田空港",
                "中部国際空港"
            ],
            correctAnswerIndex: 2,
            explanation: "羽田空港は国内外の旅客数が最も多い、日本最大の空港です。"
        ),

        QuizQuestion(
            question: "日本で最も降水量が少ない地域はどこですか？",
            choices: [
                "香川県",
                "福井県",
                "愛知県",
                "山梨県"
            ],
            correctAnswerIndex: 0,
            explanation: "香川県は日本で最も降水量が少ない地域で、水不足が問題となることがあります。"
        ),

        QuizQuestion(
            question: "日本で最も高い温泉地はどこですか？",
            choices: [
                "草津温泉",
                "登別温泉",
                "白骨温泉",
                "奥飛騨温泉"
            ],
            correctAnswerIndex: 3,
            explanation: "奥飛騨温泉は標高が高い場所にあり、自然豊かな温泉地として知られています。"
        ),
        QuizQuestion(
            question: "日本で最も古い神社はどこですか？",
            choices: [
                "伊勢神宮",
                "出雲大社",
                "春日大社",
                "鹿島神宮"
            ],
            correctAnswerIndex: 1,
            explanation: "出雲大社は日本で最も古い神社の一つとして知られています。"
        ),

        QuizQuestion(
            question: "日本で最も広い湖はどれですか？",
            choices: [
                "琵琶湖",
                "霞ヶ浦",
                "猪苗代湖",
                "洞爺湖"
            ],
            correctAnswerIndex: 0,
            explanation: "琵琶湖は日本で最も広い湖で、滋賀県に位置しています。"
        ),

        QuizQuestion(
            question: "日本で最も有名な城はどれですか？",
            choices: [
                "姫路城",
                "松本城",
                "大阪城",
                "名古屋城"
            ],
            correctAnswerIndex: 0,
            explanation: "姫路城はその美しさから「白鷺城」とも呼ばれ、世界遺産にも登録されています。"
        ),

        QuizQuestion(
            question: "日本で最も長い国道はどれですか？",
            choices: [
                "国道1号",
                "国道4号",
                "国道6号",
                "国道8号"
            ],
            correctAnswerIndex: 1,
            explanation: "国道4号は東京から青森までを結び、日本で最も長い国道です。"
        ),

        QuizQuestion(
            question: "日本で最も大きな都市公園はどこですか？",
            choices: [
                "代々木公園",
                "鶴見緑地",
                "昭和記念公園",
                "国営ひたち海浜公園"
            ],
            correctAnswerIndex: 2,
            explanation: "昭和記念公園は東京都にあり、広大な敷地を持つ都市公園です。"
        ),

        QuizQuestion(
            question: "日本で最も多くの温泉宿がある地域はどこですか？",
            choices: [
                "箱根",
                "別府",
                "草津",
                "道後"
            ],
            correctAnswerIndex: 1,
            explanation: "別府は温泉の数が多く、温泉宿が数多く存在します。"
        ),

        QuizQuestion(
            question: "日本で最も標高が高い鉄道駅はどこですか？",
            choices: [
                "野辺山駅",
                "清里駅",
                "大月駅",
                "軽井沢駅"
            ],
            correctAnswerIndex: 0,
            explanation: "野辺山駅はJRで最も標高が高い駅で、標高1,345メートルに位置しています。"
        ),

        QuizQuestion(
            question: "日本で最も有名な歌舞伎役者は誰ですか？",
            choices: [
                "市川海老蔵",
                "坂東玉三郎",
                "中村勘三郎",
                "松本幸四郎"
            ],
            correctAnswerIndex: 0,
            explanation: "市川海老蔵は現代の歌舞伎役者として広く知られています。"
        ),

        QuizQuestion(
        question: "市の地図に書かれている「市境」は、何を表していますか？",
        choices: [
        "市と隣の市や町との境",
        "道路と歩道との境",
        "学校と運動場との境",
        "店と駐車場との境"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「市と隣の市や町との境」です。市境は、市の区域がどこまでかを表す境界です。"
        ),

        QuizQuestion(
        question: "果物を育てる農家が、育っている実に袋をかけることがある主な理由はどれですか？",
        choices: [
        "実を土の中で育てるため",
        "虫や傷などから実を守るため",
        "木から実をすぐに落とすため",
        "果物の木を小さくするため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「虫や傷などから実を守るため」です。袋かけには、果実を虫や傷などから守り、品質を保つ目的があります。"
        ),

        QuizQuestion(
        question: "工場で作業手順を文や図にして決めておく主な理由はどれですか？",
        choices: [
        "製品の値段を毎日変えるため",
        "工場の場所を覚えるため",
        "決められた方法で安全に作業しやすくするため",
        "原料を使わずに製品を作るため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「決められた方法で安全に作業しやすくするため」です。作業手順を決めておくことで、作業のしかたをそろえ、安全や品質を守りやすくなります。"
        ),

        QuizQuestion(
        question: "店が売り場の通路を広めにする工夫には、どのようなよさがありますか？",
        choices: [
        "商品の値段が自動で下がる",
        "店の営業時間が長くなる",
        "商品を冷やさなくてよくなる",
        "車いすやカートなどでも通りやすくなる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「車いすやカートなどでも通りやすくなる」です。広い通路は、さまざまな人が安全に買い物をしやすくする工夫です。"
        ),

        QuizQuestion(
        question: "消防署の職員が建物を訪れ、消火設備や避難経路などを確認する主な目的はどれですか？",
        choices: [
        "火事を防ぎ、火事が起きたときの被害を小さくするため",
        "建物の商品を買うため",
        "建物の住所を変更するため",
        "道路の名前を決めるため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「火事を防ぎ、火事が起きたときの被害を小さくするため」です。消防では、建物の防火設備などを確認し、火災予防に役立てています。"
        ),

        QuizQuestion(
        question: "警察官が事件の現場に規制線を張ることがあります。その主な理由はどれですか？",
        choices: [
        "見物する人を集めるため",
        "関係のない人が入るのを防ぎ、現場を守るため",
        "道路を新しく作るため",
        "事件現場を店として使うため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「関係のない人が入るのを防ぎ、現場を守るため」です。現場への立ち入りを制限することは、安全を確保し、事件の手がかりなどを守ることにつながります。"
        ),

        QuizQuestion(
        question: "昔のローラーが付いた洗濯機では、ローラーを主に何のために使いましたか？",
        choices: [
        "衣服を温めるため",
        "洗剤を作るため",
        "洗った衣服の水をしぼるため",
        "衣服を縫うため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「洗った衣服の水をしぼるため」です。昔の洗濯機には、衣服をローラーの間に通して水をしぼるものがありました。"
        ),

        QuizQuestion(
        question: "昔は工場だった場所に、今は住宅や公園ができています。このことからわかる変化はどれですか？",
        choices: [
        "地域の土地がすべて農地になった",
        "工場の数が必ず増えた",
        "公園が工場になった",
        "土地の使われ方が変わった"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「土地の使われ方が変わった」です。工場として使われていた土地が住宅や公園に変わったため、土地利用が変化したとわかります。"
        ),

        QuizQuestion(
        question: "市内の人口を地域ごとに色分けした地図を見ると、特にわかりやすいことはどれですか？",
        choices: [
        "人口が多く集まっている地域",
        "一人一人の名前",
        "一軒一軒の家の値段",
        "明日の天気"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「人口が多く集まっている地域」です。地域ごとに人口を色分けすると、人口の多い場所や少ない場所を比べやすくなります。"
        ),

        QuizQuestion(
        question: "米を育てる農家が、稲の育ち方に合わせて田んぼの水の深さを調節する主な理由はどれですか？",
        choices: [
        "田んぼを道路にするため",
        "稲が育つのに適した水の状態にするため",
        "収穫した米を冷やすため",
        "田んぼの場所を移動するため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「稲が育つのに適した水の状態にするため」です。農家は稲の成長や天候などに合わせて、田んぼの水を管理しています。"
        ),

        QuizQuestion(
        question: "工場が照明を消費電力の少ないものへ取り替える主な目的はどれですか？",
        choices: [
        "製品を重くするため",
        "工場を暗くして作業するため",
        "使う電気の量を減らすため",
        "原料の種類を増やすため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「使う電気の量を減らすため」です。消費電力の少ない照明を利用することは、省エネルギーにつながります。"
        ),

        QuizQuestion(
        question: "店員が商品棚の奥にある商品を手前にそろえる主な理由はどれですか？",
        choices: [
        "商品の産地を変えるため",
        "商品をすべて売れないようにするため",
        "商品の重さを増やすため",
        "客が商品を見つけたり取ったりしやすくするため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「客が商品を見つけたり取ったりしやすくするため」です。商品を見やすく手に取りやすい状態に整えることも、店の大切な仕事です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】火事の熱などを感じると、天井などから自動的に水を出して消火する設備を ＿＿ といいます。",
        answer: "スプリンクラー",
        acceptableAnswers: [],
        explanation: "火事の熱などを感知して自動的に水を出す消火設備を「スプリンクラー」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】警察官が自分の身分を示すために携帯しているものを ＿＿ といいます。",
        answer: "警察手帳",
        acceptableAnswers: ["けいさつてちょう"],
        explanation: "警察官が身分を示すために携帯しているものを「警察手帳」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】昔の米作りで、稲の穂からもみを外すために使われた、たくさんの歯が並んだ道具を ＿＿ といいます。",
        answer: "千歯こき",
        acceptableAnswers: ["千歯扱き", "せんばこき"],
        explanation: "稲の穂からもみを外すために使われた昔の農具を「千歯こき」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】家や店などの建物がまとまって建っている地域を ＿＿ といいます。",
        answer: "市街地",
        acceptableAnswers: ["しがいち"],
        explanation: "家や店などの建物がまとまって建っている地域を「市街地」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】市や町を調べる方法と、調べられることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "交通量調査", match: "通る車や人の数"),
        QuizMatchingPair(prompt: "地域の人へのインタビュー", match: "地域で暮らす人の考えや経験"),
        QuizMatchingPair(prompt: "写真撮影", match: "その場所の様子"),
        QuizMatchingPair(prompt: "方位磁針", match: "調べている場所の方角")
        ],
        choices: [
        "その場所の様子",
        "調べている場所の方角",
        "通る車や人の数",
        "地域で暮らす人の考えや経験"
        ],
        explanation: "交通量調査では人や車の数、インタビューでは地域の人の考えや経験、写真では場所の様子、方位磁針では方角を調べることができます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】果樹農家の仕事と、その主な目的を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "剪定", match: "不要な枝などを切って木を整える"),
        QuizMatchingPair(prompt: "受粉を助ける", match: "花に実ができるのを助ける"),
        QuizMatchingPair(prompt: "袋かけ", match: "育っている実を虫や傷などから守る"),
        QuizMatchingPair(prompt: "収穫", match: "育った果実を木から取る")
        ],
        choices: [
        "育った果実を木から取る",
        "花に実ができるのを助ける",
        "不要な枝などを切って木を整える",
        "育っている実を虫や傷などから守る"
        ],
        explanation: "剪定は木を整える作業、受粉を助ける作業は実ができるのを助け、袋かけは実を守り、収穫では育った果実を取ります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工場で残す記録と、その記録から確かめられることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "生産記録", match: "いつ、どのくらい製品を作ったか"),
        QuizMatchingPair(prompt: "検査記録", match: "製品を調べた結果"),
        QuizMatchingPair(prompt: "機械の点検記録", match: "機械をいつどのように点検したか"),
        QuizMatchingPair(prompt: "出荷記録", match: "いつ、どこへ製品を送り出したか")
        ],
        choices: [
        "機械をいつどのように点検したか",
        "いつ、どこへ製品を送り出したか",
        "製品を調べた結果",
        "いつ、どのくらい製品を作ったか"
        ],
        explanation: "生産記録では作った量、検査記録では検査結果、点検記録では機械の点検内容、出荷記録では製品を送り出した日時や行き先などを確かめられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】スーパーマーケットで働く人と、その主な仕事を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "青果担当", match: "野菜や果物を売り場に並べて状態を確かめる"),
        QuizMatchingPair(prompt: "惣菜担当", match: "弁当やおかずなどを作って売る準備をする"),
        QuizMatchingPair(prompt: "品出し担当", match: "商品を売り場の棚へ補充する"),
        QuizMatchingPair(prompt: "店長", match: "店全体の仕事や売り場の様子を確認する")
        ],
        choices: [
        "店全体の仕事や売り場の様子を確認する",
        "商品を売り場の棚へ補充する",
        "野菜や果物を売り場に並べて状態を確かめる",
        "弁当やおかずなどを作って売る準備をする"
        ],
        explanation: "青果担当は野菜や果物、惣菜担当は弁当など、品出し担当は商品の補充を担当し、店長は店全体の仕事を確認します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】消防隊員の装備と、主に守る部分や役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "防火衣", match: "熱などから体を守る"),
        QuizMatchingPair(prompt: "防火手袋", match: "熱や危険な物から手を守る"),
        QuizMatchingPair(prompt: "安全靴", match: "落下物などから足を守る"),
        QuizMatchingPair(prompt: "ヘルメット", match: "落下物などから頭を守る")
        ],
        choices: [
        "落下物などから足を守る",
        "熱などから体を守る",
        "落下物などから頭を守る",
        "熱や危険な物から手を守る"
        ],
        explanation: "防火衣は体、防火手袋は手、安全靴は足、ヘルメットは頭を守るための装備です。"
        ),

        QuizQuestion.classification(
        question: "【分類】警察に相談したり届けたりする場面を、内容ごとに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "道で財布を拾った", match: "落とし物に関すること"),
        QuizMatchingPair(prompt: "自転車同士でぶつかる事故が起きた", match: "交通に関すること"),
        QuizMatchingPair(prompt: "家に泥棒が入った", match: "事件に関すること"),
        QuizMatchingPair(prompt: "一人で泣いている迷子を見つけた", match: "迷子に関すること")
        ],
        categories: ["落とし物に関すること", "交通に関すること", "事件に関すること", "迷子に関すること"],
        explanation: "財布を拾った場合は落とし物、交通事故は交通、泥棒の被害は事件、迷子の保護は迷子に関することとして分けられます。"
        ),

        QuizQuestion.classification(
        question: "【分類】昔から使われてきた道具を、主に使われている材料で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "木うす", match: "木"),
        QuizMatchingPair(prompt: "竹ざる", match: "竹"),
        QuizMatchingPair(prompt: "鉄瓶", match: "鉄"),
        QuizMatchingPair(prompt: "陶器の徳利", match: "陶器")
        ],
        categories: ["木", "竹", "鉄", "陶器"],
        explanation: "木うすは木、竹ざるは竹、鉄瓶は鉄、陶器の徳利は陶器を主な材料として作られています。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域の昔と今を比べて見つけた変化を、変化の種類で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "新しい道路がつくられた", match: "新設"),
        QuizMatchingPair(prompt: "古い映画館がなくなった", match: "廃止"),
        QuizMatchingPair(prompt: "公園の面積が広くなった", match: "拡張"),
        QuizMatchingPair(prompt: "市役所が別の場所へ移った", match: "移転")
        ],
        categories: ["新設", "廃止", "拡張", "移転"],
        explanation: "道路ができるのは新設、映画館がなくなるのは廃止、公園が広くなるのは拡張、市役所が場所を変えるのは移転です。"
        ),

        QuizQuestion.classification(
        question: "【分類】まちたんけんで行う調査を、調べ方ごとに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "10分間に通った車の台数を調べる", match: "数える"),
        QuizMatchingPair(prompt: "道路の幅を調べる", match: "測る"),
        QuizMatchingPair(prompt: "店の人に昔の町の様子をたずねる", match: "聞く"),
        QuizMatchingPair(prompt: "住宅や田畑がある場所を確かめる", match: "見る")
        ],
        categories: ["数える", "測る", "聞く", "見る"],
        explanation: "車の台数は数え、道路の幅は測り、人の話は聞き、土地の使われ方などは実際に見ることで調べられます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】りんごなどの果樹を育てる1年間の主な仕事を、一般的な流れの順に並べましょう。",
        choices: [
        "育った果実を収穫する",
        "枝を剪定して木を整える",
        "花が咲いたら受粉を助ける",
        "実が育ってきたら袋をかける"
        ],
        orderedChoices: [
        "枝を剪定して木を整える",
        "花が咲いたら受粉を助ける",
        "実が育ってきたら袋をかける",
        "育った果実を収穫する"
        ],
        explanation: "一般的には、枝を整え、花が咲く時期に受粉を助け、実が育ってから必要に応じて袋をかけ、最後に収穫します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】回収されたアルミ缶が新しいアルミ製品になるまでの基本的な流れを、早い順に並べましょう。",
        choices: [
        "溶かしたアルミを新しい製品の材料にする",
        "アルミ缶を種類ごとに分ける",
        "分けたアルミ缶を押し固める",
        "アルミを高い温度で溶かす"
        ],
        orderedChoices: [
        "アルミ缶を種類ごとに分ける",
        "分けたアルミ缶を押し固める",
        "アルミを高い温度で溶かす",
        "溶かしたアルミを新しい製品の材料にする"
        ],
        explanation: "回収したアルミ缶は、分別し、運びやすいように押し固め、工場で溶かしてから新しい製品の材料として利用されます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】家庭で使われる明かりの変化を、古くから使われた順に並べましょう。",
        choices: [
        "LED照明",
        "石油ランプ",
        "行灯",
        "白熱電球"
        ],
        orderedChoices: [
        "行灯",
        "石油ランプ",
        "白熱電球",
        "LED照明"
        ],
        explanation: "代表的な明かりは、行灯、石油ランプ、白熱電球、LED照明というように変化してきました。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある店の時間帯ごとの来店者数です。来店者数が多い順に並べましょう。",
        choices: [
        "10時台：46人",
        "12時台：83人",
        "15時台：67人",
        "18時台：92人"
        ],
        rankedChoices: [
        "18時台：92人",
        "12時台：83人",
        "15時台：67人",
        "10時台：46人"
        ],
        explanation: "92人、83人、67人、46人の順なので、「18時台、12時台、15時台、10時台」の順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある地域の農地面積の記録です。農地面積が広い順に並べましょう。",
        choices: [
        "1980年：420ha",
        "2000年：315ha",
        "2010年：260ha",
        "2020年：185ha"
        ],
        rankedChoices: [
        "1980年：420ha",
        "2000年：315ha",
        "2010年：260ha",
        "2020年：185ha"
        ],
        explanation: "420ha、315ha、260ha、185haの順なので、「1980年、2000年、2010年、2020年」の順です。"
        ),

        QuizQuestion(
        question: "市や町にある防災行政無線は、主に何のために使われますか？",
        choices: [
        "災害や避難などの大切な情報を地域の人に知らせるため",
        "農作物の値段を自動で決めるため",
        "工場の機械を遠くから動かすため",
        "店の商品を家まで運ぶため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「災害や避難などの大切な情報を地域の人に知らせるため」です。防災行政無線は、災害時の注意や避難に関する情報などを地域へ伝えるために使われます。"
        ),

        QuizQuestion(
        question: "果物を育てる農家が、小さい実のうちに一部を取り除く「摘果」をする主な理由はどれですか？",
        choices: [
        "木をすぐに切り倒すため",
        "残した実に養分がいきわたり、育ちやすくするため",
        "果物をすべて同じ日に落とすため",
        "畑に水が入らないようにするため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「残した実に養分がいきわたり、育ちやすくするため」です。摘果では実の数を調整し、残した実が育ちやすいようにします。"
        ),

        QuizQuestion(
        question: "工場が製品に製造番号やロット番号を付ける主な理由はどれですか？",
        choices: [
        "製品を必ず高く売るため",
        "工場の住所を短くするため",
        "いつ、どのまとまりで作られた製品か確認しやすくするため",
        "製品を使わなくてもよくするため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「いつ、どのまとまりで作られた製品か確認しやすくするため」です。製造番号やロット番号を記録しておくと、製品に問題が見つかったときなどに作られた時期やまとまりを調べやすくなります。"
        ),

        QuizQuestion(
        question: "店が、消費期限などが近い食品を値下げして販売することがあります。その取り組みの目的として適切なものはどれですか？",
        choices: [
        "食品の産地を変えるため",
        "店を早く閉めるため",
        "商品の重さを増やすため",
        "まだ食べられる食品が捨てられる量を減らすため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「まだ食べられる食品が捨てられる量を減らすため」です。期限が近い食品を値下げして売ることは、食品ロスを減らすことにもつながります。"
        ),

        QuizQuestion(
        question: "消防車が緊急走行するときにサイレンを鳴らす主な理由はどれですか？",
        choices: [
        "周りの人や車に緊急車両が近づいていることを知らせるため",
        "火事の原因を調べるため",
        "消防車の水を増やすため",
        "道路の信号をすべて消すため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「周りの人や車に緊急車両が近づいていることを知らせるため」です。サイレンなどで周囲に知らせ、安全に気をつけながら現場へ向かいます。"
        ),

        QuizQuestion(
        question: "交番などが、地域で起きた犯罪や交通事故への注意を知らせる掲示をする主な目的はどれですか？",
        choices: [
        "地域の店の商品を宣伝するため",
        "地域の人に注意をうながし、被害や事故の防止に役立てるため",
        "道路の幅を決めるため",
        "農作物の収穫量を調べるため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「地域の人に注意をうながし、被害や事故の防止に役立てるため」です。地域で起きた犯罪や事故の情報を知らせることは、住民が安全に気をつけるために役立ちます。"
        ),

        QuizQuestion(
        question: "昔から使われてきた「風呂敷」の主な使い方はどれですか？",
        choices: [
        "火をおこす",
        "時刻をはかる",
        "品物を包んで持ち運ぶ",
        "井戸から水をくむ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「品物を包んで持ち運ぶ」です。風呂敷は、布で品物を包み、持ち運んだり保管したりするために使われてきました。"
        ),

        QuizQuestion(
        question: "同じ道路の昔と今の写真を比べると、昔は砂利道で、今は舗装されて歩道や街路灯もありました。このことから最もよくわかる変化はどれですか？",
        choices: [
        "道路が田んぼに変わった",
        "人がその道を通れなくなった",
        "地域から電気がなくなった",
        "道路が整備され、通行しやすくなった"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「道路が整備され、通行しやすくなった」です。舗装や歩道、街路灯が整えられたことから、道路の設備が充実したと考えられます。"
        ),

        QuizQuestion(
        question: "実際には長い道路や広い土地を、小さな地図の中に表すために使う考え方はどれですか？",
        choices: [
        "縮尺",
        "気温",
        "人口",
        "時刻"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「縮尺」です。地図では、実際の長さを一定の割合で小さくして表します。その割合を縮尺といいます。"
        ),

        QuizQuestion(
        question: "牛や豚などを育てる農家が、畜舎の換気を行う主な理由はどれですか？",
        choices: [
        "動物を外へ逃がすため",
        "空気を入れ替えて、動物が過ごしやすい環境を保つため",
        "えさをすべて乾かすため",
        "畜舎の屋根を低くするため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「空気を入れ替えて、動物が過ごしやすい環境を保つため」です。換気によって畜舎の空気を入れ替え、動物の健康を守ることにつながります。"
        ),

        QuizQuestion(
        question: "食品工場で、先に入荷した原料から順に使うことがある主な理由はどれですか？",
        choices: [
        "原料の名前を変えるため",
        "工場の機械を使わなくするため",
        "古い原料が長く残るのを防ぎ、適切に使うため",
        "すべての原料を同じ重さにするため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「古い原料が長く残るのを防ぎ、適切に使うため」です。先に入った原料から使うことで、原料を適切な期間内に使いやすくなります。"
        ),

        QuizQuestion(
        question: "店が買い物客にアンケートを行う主な目的はどれですか？",
        choices: [
        "客の家の広さを調べるため",
        "商品の数を必ず半分にするため",
        "店員が買い物をするため",
        "客の意見や希望を知り、店づくりに役立てるため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「客の意見や希望を知り、店づくりに役立てるため」です。アンケートで集めた意見は、品ぞろえやサービスなどを考える材料になります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】119番通報を受け、消防車や救急車に出動の指令を出すところを ＿＿ といいます。",
        answer: "消防指令センター",
        acceptableAnswers: ["指令センター", "消防指令室", "通信指令室"],
        explanation: "119番通報を受け、必要な消防車や救急車へ出動を指令するところを「消防指令センター」などといいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】事件の現場で、指紋や足跡などの手がかりをくわしく調べる活動を ＿＿ といいます。",
        answer: "鑑識",
        acceptableAnswers: ["かんしき"],
        explanation: "事件の現場で指紋や足跡などを調べ、手がかりを集める活動を「鑑識」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】昔、石どうしなどを打ち合わせて火花を出し、火をおこすときに使ったものを ＿＿ といいます。",
        answer: "火打ち石",
        acceptableAnswers: ["ひうちいし"],
        explanation: "打ち合わせて火花を出し、火をおこすために使われたものを「火打ち石」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】海や湖などを土や砂でうめて、新しい土地をつくることを ＿＿ といいます。",
        answer: "埋め立て",
        acceptableAnswers: ["埋立て", "うめたて"],
        explanation: "海や湖などを土や砂でうめて新しい土地をつくることを「埋め立て」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】市や町で見られる表示と、そこからわかることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "避難場所の標識", match: "災害時に避難する場所"),
        QuizMatchingPair(prompt: "観光案内板", match: "地域の名所や施設の案内"),
        QuizMatchingPair(prompt: "バスの時刻表", match: "バスが来る時刻"),
        QuizMatchingPair(prompt: "住居表示板", match: "町名や番地などの場所の表示")
        ],
        choices: [
        "バスが来る時刻",
        "町名や番地などの場所の表示",
        "災害時に避難する場所",
        "地域の名所や施設の案内"
        ],
        explanation: "避難場所の標識は避難先、観光案内板は名所や施設、バスの時刻表は運行時刻、住居表示板は町名や番地などを知る手がかりになります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】農家が使う道具や設備と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "剪定ばさみ", match: "不要な枝などを切る"),
        QuizMatchingPair(prompt: "防霜ファン", match: "霜による作物への被害を減らす"),
        QuizMatchingPair(prompt: "収穫ばさみ", match: "実や茎などを切って収穫する"),
        QuizMatchingPair(prompt: "動力噴霧器", match: "必要な薬剤などを細かな霧にしてまく")
        ],
        choices: [
        "実や茎などを切って収穫する",
        "必要な薬剤などを細かな霧にしてまく",
        "不要な枝などを切る",
        "霜による作物への被害を減らす"
        ],
        explanation: "剪定ばさみは枝の手入れ、防霜ファンは霜への対策、収穫ばさみは収穫、動力噴霧器は必要な薬剤などの散布に使われます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工場で使うものと、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "原料タンク", match: "液体などの原料をたくわえる"),
        QuizMatchingPair(prompt: "洗浄機", match: "材料や容器などの汚れを落とす"),
        QuizMatchingPair(prompt: "金属探知機", match: "製品などに金属が混ざっていないか確かめる"),
        QuizMatchingPair(prompt: "パレット", match: "荷物をまとめて載せ、運びやすくする")
        ],
        choices: [
        "荷物をまとめて載せ、運びやすくする",
        "製品などに金属が混ざっていないか確かめる",
        "液体などの原料をたくわえる",
        "材料や容器などの汚れを落とす"
        ],
        explanation: "原料タンクは原料の保管、洗浄機は汚れを落とす作業、金属探知機は金属の混入確認、パレットは荷物の運搬に役立ちます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店の売り方やサービスと、その内容を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "タイムセール", match: "決められた時間に商品を値下げして売る"),
        QuizMatchingPair(prompt: "試食", match: "商品の味などを少量試してもらう"),
        QuizMatchingPair(prompt: "取り寄せ", match: "店にない商品などを注文して用意する"),
        QuizMatchingPair(prompt: "セルフレジ", match: "客が自分で商品を読み取るなどして会計する")
        ],
        choices: [
        "店にない商品などを注文して用意する",
        "客が自分で商品を読み取るなどして会計する",
        "商品の味などを少量試してもらう",
        "決められた時間に商品を値下げして売る"
        ],
        explanation: "タイムセールは時間を決めた値下げ、試食は味などの確認、取り寄せは商品の注文、セルフレジは客自身が行う会計に関係します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】消防で使われる車と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ポンプ車", match: "ホースへ消火用の水を送る"),
        QuizMatchingPair(prompt: "化学車", match: "油などが燃える火災に泡などを使って対応する"),
        QuizMatchingPair(prompt: "救助工作車", match: "救助に必要なさまざまな資機材を運ぶ"),
        QuizMatchingPair(prompt: "指揮車", match: "現場で活動する隊への指示などに使う")
        ],
        choices: [
        "救助に必要なさまざまな資機材を運ぶ",
        "現場で活動する隊への指示などに使う",
        "ホースへ消火用の水を送る",
        "油などが燃える火災に泡などを使って対応する"
        ],
        explanation: "ポンプ車は消火用の水を送り、化学車は油などの火災への対応、救助工作車は救助資機材の運搬、指揮車は現場の指揮に使われます。"
        ),

        QuizQuestion.classification(
        question: "【分類】警察の活動を、その主な内容で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "祭りの会場で事故が起きないよう見守る", match: "警戒・警備"),
        QuizMatchingPair(prompt: "速度違反の車を取り締まる", match: "交通取締り"),
        QuizMatchingPair(prompt: "防犯カメラの映像を調べる", match: "捜査"),
        QuizMatchingPair(prompt: "安全な自転車の乗り方を説明する", match: "交通安全の啓発")
        ],
        categories: ["警戒・警備", "交通取締り", "捜査", "交通安全の啓発"],
        explanation: "祭り会場の見守りは警戒・警備、速度違反への対応は交通取締り、防犯カメラの確認は捜査、自転車の安全な乗り方の説明は交通安全の啓発に分けられます。"
        ),

        QuizQuestion.classification(
        question: "【分類】昔から使われてきた道具を、その主な使い道で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "水がめ", match: "水をたくわえる"),
        QuizMatchingPair(prompt: "おひつ", match: "炊いたご飯を入れておく"),
        QuizMatchingPair(prompt: "和傘", match: "雨をよける"),
        QuizMatchingPair(prompt: "かんじき", match: "雪の上を歩きやすくする")
        ],
        categories: ["水をたくわえる", "炊いたご飯を入れておく", "雨をよける", "雪の上を歩きやすくする"],
        explanation: "水がめは水の保存、おひつは炊いたご飯を入れておくこと、和傘は雨よけ、かんじきは雪の上を歩きやすくするために使われてきました。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域の昔と今を比べて見つけた変化を、変化のしかたで分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "公衆電話の台数が少なくなった", match: "減った"),
        QuizMatchingPair(prompt: "自転車置き場の台数が多くなった", match: "増えた"),
        QuizMatchingPair(prompt: "新しいバイパス道路ができた", match: "新しくできた"),
        QuizMatchingPair(prompt: "曲がっていた川がまっすぐに整備された", match: "形が変わった")
        ],
        categories: ["減った", "増えた", "新しくできた", "形が変わった"],
        explanation: "公衆電話は減少、自転車置き場は増加、バイパス道路は新設、川の整備は形の変化として整理できます。"
        ),

        QuizQuestion.classification(
        question: "【分類】市や町の暮らしに関係するものを、その主な役割で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "公立小学校", match: "教育"),
        QuizMatchingPair(prompt: "保健所", match: "健康・衛生"),
        QuizMatchingPair(prompt: "消防署", match: "消防・防災"),
        QuizMatchingPair(prompt: "コミュニティバス", match: "交通")
        ],
        categories: ["教育", "健康・衛生", "消防・防災", "交通"],
        explanation: "公立小学校は教育、保健所は健康や衛生、消防署は消防や防災、コミュニティバスは地域の交通に関係します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】さつまいもの苗を植えてから収穫するまでの基本的な流れを、早い順に並べましょう。",
        choices: [
        "土の中で育ったいもを掘り取る",
        "畑に苗を植える",
        "つるや葉が伸びる",
        "土の中でいもが大きくなる"
        ],
        orderedChoices: [
        "畑に苗を植える",
        "つるや葉が伸びる",
        "土の中でいもが大きくなる",
        "土の中で育ったいもを掘り取る"
        ],
        explanation: "さつまいもは苗を畑に植え、つるや葉が伸びる間に土の中のいもが育ち、十分に大きくなってから掘り取ります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】工場が注文を受けてから製品を出荷するまでの基本的な流れを、早い順に並べましょう。",
        choices: [
        "完成した製品を出荷する",
        "注文の内容を確認する",
        "製品を作る",
        "必要な数や日程を考えて生産の計画を立てる"
        ],
        orderedChoices: [
        "注文の内容を確認する",
        "必要な数や日程を考えて生産の計画を立てる",
        "製品を作る",
        "完成した製品を出荷する"
        ],
        explanation: "注文内容を確認した後、必要な数や日程に合わせて計画を立て、製品を作って出荷するという流れになります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】自転車を盗まれた人が警察へ届け出てから、見つかった自転車が返されるまでの基本的な流れを、早い順に並べましょう。",
        choices: [
        "持ち主であることを確かめて返す",
        "警察に盗難を届け出る",
        "自転車の特徴や防犯登録などを確認する",
        "自転車が発見される"
        ],
        orderedChoices: [
        "警察に盗難を届け出る",
        "自転車の特徴や防犯登録などを確認する",
        "自転車が発見される",
        "持ち主であることを確かめて返す"
        ],
        explanation: "まず盗難を届け出て、自転車の特徴や防犯登録などを確認します。その後、自転車が発見された場合は、持ち主であることを確認して返されます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある店の4つの売り場の1日の売上金額です。売上金額が多い順に並べましょう。",
        choices: [
        "野菜売り場：84,000円",
        "魚売り場：96,000円",
        "菓子売り場：57,000円",
        "肉売り場：105,000円"
        ],
        rankedChoices: [
        "肉売り場：105,000円",
        "魚売り場：96,000円",
        "野菜売り場：84,000円",
        "菓子売り場：57,000円"
        ],
        explanation: "105,000円、96,000円、84,000円、57,000円の順なので、「肉売り場、魚売り場、野菜売り場、菓子売り場」の順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある消防署の4か月の救急出動件数です。出動件数が多い順に並べましょう。",
        choices: [
        "4月：38件",
        "5月：52件",
        "6月：45件",
        "7月：61件"
        ],
        rankedChoices: [
        "7月：61件",
        "5月：52件",
        "6月：45件",
        "4月：38件"
        ],
        explanation: "61件、52件、45件、38件の順なので、「7月、5月、6月、4月」の順です。"
        ),

        QuizQuestion(
        question: "市や町の地図で、北がどちらかを確かめるときに見るものはどれですか？",
        choices: [
        "方位記号",
        "縮尺の数字",
        "道路の太さ",
        "地図の題名"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「方位記号」です。方位記号を見ると、地図の上で北などの方角を確かめることができます。"
        ),

        QuizQuestion(
        question: "農家が収穫した葉物野菜を、出荷前にすばやく冷やすことがある主な理由はどれですか？",
        choices: [
        "野菜の重さを増やすため",
        "野菜の新鮮さを保ちやすくするため",
        "野菜の名前を変えるため",
        "畑の温度を上げるため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「野菜の新鮮さを保ちやすくするため」です。収穫後の野菜を早く冷やすことで、品質を保ちやすくなります。"
        ),

        QuizQuestion(
        question: "工場で産業用ロボットを使うよさとして、最も適切なものはどれですか？",
        choices: [
        "工場の住所を自動で変えられる",
        "原料を使わずに製品を作れる",
        "同じ作業を正確にくり返し行いやすい",
        "すべての検査が必要なくなる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「同じ作業を正確にくり返し行いやすい」です。産業用ロボットは、決められた作業を正確にくり返す仕事などに使われます。"
        ),

        QuizQuestion(
        question: "店のレジで商品のバーコードを読み取る主な目的はどれですか？",
        choices: [
        "商品の重さを必ず増やすため",
        "店の照明を明るくするため",
        "商品の産地を変更するため",
        "商品を識別して価格などの情報を呼び出すため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「商品を識別して価格などの情報を呼び出すため」です。バーコードを読み取ると、登録された商品や価格などの情報を確認できます。"
        ),

        QuizQuestion(
        question: "火事を119番で通報するとき、消防車が現場へ向かうために特に欠かせない情報はどれですか？",
        choices: [
        "火事が起きている場所",
        "通報した人の好きな食べ物",
        "近くの店の売り上げ",
        "その日の学校の時間割"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「火事が起きている場所」です。消防車が現場へ向かうためには、住所や目印など、火事が起きている場所を正確に伝えることが大切です。"
        ),

        QuizQuestion(
        question: "警察官が学校などで防犯教室を行う主な目的はどれですか？",
        choices: [
        "農作物の育て方を教えるため",
        "犯罪や危険から身を守る方法を伝えるため",
        "工場の機械の使い方を教えるため",
        "店の商品価格を決めるため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「犯罪や危険から身を守る方法を伝えるため」です。防犯教室では、不審な人への対応など、安全を守るための行動を学びます。"
        ),

        QuizQuestion(
        question: "昔、洗濯などで使われた「たらい」は、どのような道具ですか？",
        choices: [
        "時刻を知らせる道具",
        "米を粉にする道具",
        "水をためて衣服などを洗うための容器",
        "遠くの人と話すための道具"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「水をためて衣服などを洗うための容器」です。たらいに水をため、洗濯などに使っていました。"
        ),

        QuizQuestion(
        question: "ある小学校の児童数が、30年前は620人、今は280人でした。この資料から確実にわかることはどれですか？",
        choices: [
        "市全体の人口が必ず半分になった",
        "30年前には学校がなかった",
        "今は子どもが一人も住んでいない",
        "この小学校の児童数は30年前より減った"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「この小学校の児童数は30年前より減った」です。620人から280人になっているので、この学校の児童数が減ったことは資料から確実に読み取れます。"
        ),

        QuizQuestion(
        question: "まちたんけんで、A地点には駅と多くの店、B地点には田畑、C地点には住宅、D地点には森林が多くありました。商業が特にさかんな場所と考えられるのはどこですか？",
        choices: [
        "A地点",
        "B地点",
        "C地点",
        "D地点"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「A地点」です。駅の近くに多くの店が集まっていることから、A地点は商業が特にさかんな場所だと考えられます。"
        ),

        QuizQuestion(
        question: "農家が共同選果場を利用する主な目的はどれですか？",
        choices: [
        "畑を住宅地に変えるため",
        "集めた農産物を大きさや品質などで分け、出荷しやすくするため",
        "農産物をすべてその場で料理するため",
        "農業用の水を海へ流すため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「集めた農産物を大きさや品質などで分け、出荷しやすくするため」です。共同選果場では、複数の農家の農産物を選別したり出荷の準備をしたりします。"
        ),

        QuizQuestion(
        question: "住宅の近くにある工場が、機械の大きな音を外へ伝わりにくくするために行う工夫として適切なものはどれですか？",
        choices: [
        "工場の窓をすべて開ける",
        "機械を道路の上に置く",
        "防音の壁や設備を使う",
        "製品の包装をなくす"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「防音の壁や設備を使う」です。工場では、周りの地域への影響を少なくするため、音を外へ伝わりにくくする工夫をすることがあります。"
        ),

        QuizQuestion(
        question: "店の商品棚にあるPOPと呼ばれる小さな広告の主な役割はどれですか？",
        choices: [
        "店の住所を隠す",
        "商品の数を自動で増やす",
        "客がレジを使えないようにする",
        "商品の特徴やおすすめの点などをわかりやすく伝える"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「商品の特徴やおすすめの点などをわかりやすく伝える」です。POPは、商品の特徴や売り出し情報などを客に伝えるために使われます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】救急車に乗り、病人やけが人に必要な手当をしながら医療機関へ運ぶ消防の隊を ＿＿ といいます。",
        answer: "救急隊",
        acceptableAnswers: [],
        explanation: "救急車で病人やけが人に対応する消防の隊を「救急隊」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】警察官が家庭や事業所などを訪ね、地域の様子や困りごとなどを聞く活動を ＿＿ といいます。",
        answer: "巡回連絡",
        acceptableAnswers: ["じゅんかいれんらく"],
        explanation: "警察官が地域の家庭や事業所などを訪ねて話を聞く活動を「巡回連絡」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】昔、荷物を背中に背負って運ぶために使われた、木などで作った枠の道具を ＿＿ といいます。",
        answer: "背負子",
        acceptableAnswers: ["しょいこ"],
        explanation: "荷物を背中に背負って運ぶための昔の道具を「背負子（しょいこ）」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域で起きたできごとを、起きた年などといっしょに時間の順にまとめた表を ＿＿ といいます。",
        answer: "年表",
        acceptableAnswers: ["ねんぴょう"],
        explanation: "できごとを起きた年などといっしょに時間の順にまとめた表を「年表」といいます。地域の変化を整理するときにも役立ちます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】市や町の暮らしを支える施設と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "浄水場", match: "川などから取り入れた水をきれいにして送る"),
        QuizMatchingPair(prompt: "下水処理場", match: "使った後の水をきれいにして流す"),
        QuizMatchingPair(prompt: "清掃工場", match: "集められたごみを処理する"),
        QuizMatchingPair(prompt: "給食センター", match: "学校へ届ける給食をまとめて作る")
        ],
        choices: [
        "学校へ届ける給食をまとめて作る",
        "使った後の水をきれいにして流す",
        "川などから取り入れた水をきれいにして送る",
        "集められたごみを処理する"
        ],
        explanation: "浄水場は水道水をつくり、下水処理場は使った水を処理し、清掃工場はごみを処理し、給食センターは学校給食をまとめて作ります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】農業に関係する場所や設備と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "苗床", match: "植え付ける前の苗を育てる"),
        QuizMatchingPair(prompt: "乾燥機", match: "収穫した米などの水分を減らして保存しやすくする"),
        QuizMatchingPair(prompt: "集荷場", match: "出荷する農産物を集める"),
        QuizMatchingPair(prompt: "農道", match: "農地への移動や農産物の運搬に使う")
        ],
        choices: [
        "農地への移動や農産物の運搬に使う",
        "出荷する農産物を集める",
        "植え付ける前の苗を育てる",
        "収穫した米などの水分を減らして保存しやすくする"
        ],
        explanation: "苗床は苗を育てる場所、乾燥機は米などの水分を減らす設備、集荷場は農産物を集める場所、農道は農作業や運搬に使う道です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工場で使われる機械や設備と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "自動包装機", match: "できた製品を自動で包む"),
        QuizMatchingPair(prompt: "フォークリフト", match: "重い荷物を持ち上げて運ぶ"),
        QuizMatchingPair(prompt: "計量器", match: "原料や製品の重さを量る"),
        QuizMatchingPair(prompt: "集じん設備", match: "作業で出る細かなほこりなどを集める")
        ],
        choices: [
        "原料や製品の重さを量る",
        "作業で出る細かなほこりなどを集める",
        "重い荷物を持ち上げて運ぶ",
        "できた製品を自動で包む"
        ],
        explanation: "自動包装機は製品の包装、フォークリフトは荷物の運搬、計量器は重さの確認、集じん設備はほこりなどを集めるために使われます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店にある設備や道具と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "電子はかり", match: "量り売りする商品の重さを量る"),
        QuizMatchingPair(prompt: "ショッピングカート", match: "多くの商品を入れて店内を運ぶ"),
        QuizMatchingPair(prompt: "冷凍ケース", match: "冷凍食品を低い温度で保つ"),
        QuizMatchingPair(prompt: "品出し用台車", match: "商品を売り場までまとめて運ぶ")
        ],
        choices: [
        "冷凍食品を低い温度で保つ",
        "多くの商品を入れて店内を運ぶ",
        "商品を売り場までまとめて運ぶ",
        "量り売りする商品の重さを量る"
        ],
        explanation: "電子はかりは商品の計量、ショッピングカートは商品の持ち運び、冷凍ケースは低温での保存、品出し用台車は売り場への運搬に使われます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】消防で使う道具や装備と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "空気呼吸器", match: "煙などがある場所でも呼吸できるようにする"),
        QuizMatchingPair(prompt: "油圧カッター", match: "事故で変形した車などを切り開く"),
        QuizMatchingPair(prompt: "AED", match: "心臓が正常に動くよう電気ショックを行うことがある"),
        QuizMatchingPair(prompt: "管そう", match: "ホースの先で放水する向きなどを調整する")
        ],
        choices: [
        "ホースの先で放水する向きなどを調整する",
        "煙などがある場所でも呼吸できるようにする",
        "心臓が正常に動くよう電気ショックを行うことがある",
        "事故で変形した車などを切り開く"
        ],
        explanation: "空気呼吸器は呼吸の確保、油圧カッターは救助活動、AEDは救命処置、管そうは放水の調整に使われます。"
        ),

        QuizQuestion.classification(
        question: "【分類】警察官の仕事を、その仕事を行うことが多い場所で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "道に迷った人に道案内をする", match: "交番"),
        QuizMatchingPair(prompt: "登校する子どもの安全を見守る", match: "通学路"),
        QuizMatchingPair(prompt: "残された物や周りの様子を調べる", match: "事件現場"),
        QuizMatchingPair(prompt: "地域の事件や事故の情報をまとめる", match: "警察署")
        ],
        categories: ["交番", "通学路", "事件現場", "警察署"],
        explanation: "道案内は交番、登校時の見守りは通学路、事件の調査は事件現場、地域の警察活動に関する情報の整理などは警察署で行われます。"
        ),

        QuizQuestion.classification(
        question: "【分類】昔から使われてきた道具を、その主な使い道で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "すり鉢", match: "食べ物をすりつぶす"),
        QuizMatchingPair(prompt: "裁縫箱", match: "衣服を縫ったり直したりする"),
        QuizMatchingPair(prompt: "湯たんぽ", match: "寝るときなどに体を温める"),
        QuizMatchingPair(prompt: "木おけ", match: "水などを入れて運ぶ")
        ],
        categories: ["食べ物をすりつぶす", "衣服を縫ったり直したりする", "寝るときなどに体を温める", "水などを入れて運ぶ"],
        explanation: "すり鉢は調理、裁縫箱は衣服の手入れ、湯たんぽは暖をとること、木おけは水などを入れて運ぶことに使われてきました。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域の変化を表すできごとを、その変化と特に関係するものに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "新しい鉄道路線が開通した", match: "交通"),
        QuizMatchingPair(prompt: "大きな工業団地ができた", match: "産業"),
        QuizMatchingPair(prompt: "まとまった住宅地がつくられた", match: "住まい"),
        QuizMatchingPair(prompt: "川の護岸が整備された", match: "防災")
        ],
        categories: ["交通", "産業", "住まい", "防災"],
        explanation: "鉄道路線は交通、工業団地は産業、住宅地は住まい、川の護岸整備は水害などへの備えである防災に特に関係します。"
        ),

        QuizQuestion.classification(
        question: "【分類】市や町にある施設を、その主な種類で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "市立病院", match: "医療施設"),
        QuizMatchingPair(prompt: "バスターミナル", match: "交通施設"),
        QuizMatchingPair(prompt: "デパート", match: "商業施設"),
        QuizMatchingPair(prompt: "配水池", match: "水道施設")
        ],
        categories: ["医療施設", "交通施設", "商業施設", "水道施設"],
        explanation: "市立病院は医療施設、バスターミナルは交通施設、デパートは商業施設、配水池は水道水をたくわえて送るための水道施設です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】酪農家がしぼった生乳が乳業工場へ運ばれるまでの基本的な流れを、早い順に並べましょう。",
        choices: [
        "タンクローリーで乳業工場へ運ぶ",
        "牛から生乳をしぼる",
        "しぼった生乳を冷やす",
        "冷やした生乳を集乳する"
        ],
        orderedChoices: [
        "牛から生乳をしぼる",
        "しぼった生乳を冷やす",
        "冷やした生乳を集乳する",
        "タンクローリーで乳業工場へ運ぶ"
        ],
        explanation: "生乳は、牛からしぼった後すぐに冷やして品質を保ち、集められてからタンクローリーで乳業工場へ運ばれます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】工場で新しい製品を本格的に作り始めるまでの基本的な流れを、早い順に並べましょう。",
        choices: [
        "本格的に生産する",
        "どのような製品を作るか計画する",
        "試作品を作る",
        "試作品を確かめて改善する"
        ],
        orderedChoices: [
        "どのような製品を作るか計画する",
        "試作品を作る",
        "試作品を確かめて改善する",
        "本格的に生産する"
        ],
        explanation: "新しい製品は、まず計画し、試作品を作って確かめ、必要な改善をしてから本格的な生産へ進むのが基本的な流れです。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】警察官が迷子を保護してから家族へ引き渡すまでの基本的な流れを、早い順に並べましょう。",
        choices: [
        "家族であることを確かめて引き渡す",
        "迷子を安全な場所で保護する",
        "名前や家族についてわかることを聞く",
        "得られた情報をもとに家族を探す"
        ],
        orderedChoices: [
        "迷子を安全な場所で保護する",
        "名前や家族についてわかることを聞く",
        "得られた情報をもとに家族を探す",
        "家族であることを確かめて引き渡す"
        ],
        explanation: "まず迷子を安全に保護し、わかる情報を聞いて家族を探し、家族であることを確認してから引き渡します。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】消防署から4つの地区までの道のりです。近い順に並べましょう。",
        choices: [
        "A地区：3.2km",
        "B地区：1.5km",
        "C地区：4.1km",
        "D地区：2.4km"
        ],
        rankedChoices: [
        "B地区：1.5km",
        "D地区：2.4km",
        "A地区：3.2km",
        "C地区：4.1km"
        ],
        explanation: "1.5km、2.4km、3.2km、4.1kmの順なので、「B地区、D地区、A地区、C地区」の順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある地域の商店数の記録です。商店数が多い順に並べましょう。",
        choices: [
        "1990年：86店",
        "2010年：61店",
        "2000年：74店",
        "2020年：48店"
        ],
        rankedChoices: [
        "1990年：86店",
        "2000年：74店",
        "2010年：61店",
        "2020年：48店"
        ],
        explanation: "86店、74店、61店、48店の順なので、「1990年、2000年、2010年、2020年」の順です。"
        ),

        QuizQuestion(
        question: "市が発行する広報紙の主な役割はどれですか？",
        choices: [
        "市の行事や手続きなどの情報を住民に知らせる",
        "工場で作る製品の種類を決める",
        "農家が育てる作物を決める",
        "店の商品を自動で運ぶ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「市の行事や手続きなどの情報を住民に知らせる」です。広報紙では、市の行事、施設、手続きなど、暮らしに関係する情報を住民に伝えます。"
        ),

        QuizQuestion(
        question: "農家が畑のまわりに防風林を設けることがある主な理由はどれですか？",
        choices: [
        "畑を暗くするため",
        "強い風から作物や土を守るため",
        "収穫した作物を冷やすため",
        "畑を道路として使うため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「強い風から作物や土を守るため」です。防風林は、強い風による作物への被害や土が飛ばされることを防ぐのに役立ちます。"
        ),

        QuizQuestion(
        question: "工場でベルトコンベヤーを使う主な目的はどれですか？",
        choices: [
        "工場の温度を下げるため",
        "製品の名前を決めるため",
        "材料や製品を次の作業場所へ運ぶため",
        "工場の外に木を植えるため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「材料や製品を次の作業場所へ運ぶため」です。ベルトコンベヤーを使うと、材料や製品を作業の順に効率よく運ぶことができます。"
        ),

        QuizQuestion(
        question: "店でもらうレシートから確かめられることはどれですか？",
        choices: [
        "商品の作り方",
        "店員の家の住所",
        "来週の天気",
        "買った商品や支払った金額"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「買った商品や支払った金額」です。レシートには、買った商品、金額、購入した日時などが記録されています。"
        ),

        QuizQuestion(
        question: "消防署で消防隊員が交代しながら勤務する主な理由はどれですか？",
        choices: [
        "夜中や休日の火事などにも対応できるようにするため",
        "消防車を昼間だけ使うため",
        "消防署を毎日別の場所へ移すため",
        "火事が起きる時刻を決めるため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「夜中や休日の火事などにも対応できるようにするため」です。火事や救急はいつ起こるかわからないため、消防署では交代しながら勤務しています。"
        ),

        QuizQuestion(
        question: "道に迷った人が交番を訪ねました。警察官の対応として適切なものはどれですか？",
        choices: [
        "目的地までの道を教えずに帰す",
        "地図などを使って目的地への道を案内する",
        "その人の商品を買い取る",
        "その人の代わりに農作業をする"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「地図などを使って目的地への道を案内する」です。交番では、地域の安全を守る仕事のほか、道案内などにも対応しています。"
        ),

        QuizQuestion(
        question: "昔使われていた「蚊帳」は、何のための道具ですか？",
        choices: [
        "ご飯を炊くため",
        "水をくむため",
        "寝ている人を蚊などの虫から守るため",
        "荷物の重さを量るため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「寝ている人を蚊などの虫から守るため」です。蚊帳は、寝る場所のまわりを網で囲み、蚊などの虫が入るのを防ぐために使われました。"
        ),

        QuizQuestion(
        question: "同じ地域の昔と今の写真を比べると、昔は家が少なく、今は多くの家と新しい小学校がありました。最も考えられる変化はどれですか？",
        choices: [
        "地域から人がいなくなった",
        "すべての道路がなくなった",
        "農地だけが増え続けた",
        "地域に住む人が増えた可能性が高い"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「地域に住む人が増えた可能性が高い」です。家が増え、新しい小学校もできていることから、地域に住む人が増えたと考えられます。"
        ),

        QuizQuestion(
        question: "市の人口がどのように変化しているか調べるとき、最も役立つ資料はどれですか？",
        choices: [
        "市の人口を年ごとにまとめた統計資料",
        "店の商品を紹介する広告",
        "学校の給食献立表",
        "電車の車内広告"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「市の人口を年ごとにまとめた統計資料」です。年ごとの人口を比べることで、市の人口が増えているか減っているかを調べられます。"
        ),

        QuizQuestion(
        question: "何人かの農家が、同じ種類の野菜をまとめて出荷することがあります。そのよさとして最も適切なものはどれですか？",
        choices: [
        "野菜を収穫しなくてもよくなる",
        "まとまった量を効率よく運びやすくなる",
        "野菜の味が必ず同じになる",
        "畑に水をやらなくてもよくなる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「まとまった量を効率よく運びやすくなる」です。複数の農家が農産物をまとめることで、まとまった量を出荷しやすくなります。"
        ),

        QuizQuestion(
        question: "工場で使った水を、きれいにしてから外へ流す主な理由はどれですか？",
        choices: [
        "製品の数を増やすため",
        "工場の建物を高くするため",
        "川や海などの環境を守るため",
        "働く人の服の色をそろえるため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「川や海などの環境を守るため」です。工場では、汚れた水をそのまま流さず、処理して環境への影響を少なくする工夫が行われています。"
        ),

        QuizQuestion(
        question: "店が在庫の数を定期的に確かめる主な理由はどれですか？",
        choices: [
        "店の住所を変えるため",
        "商品をすべて同じ値段にするため",
        "買い物客の人数を減らすため",
        "商品の不足や余りを少なくするため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「商品の不足や余りを少なくするため」です。在庫を確かめることで、必要な商品を適切な量だけ仕入れることにつなげられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】店がまとまって並び、買い物をする人が多く集まる通りや地域を ＿＿ といいます。",
        answer: "商店街",
        acceptableAnswers: [],
        explanation: "店がまとまって並ぶ通りや地域を「商店街」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】事故や災害の現場で、取り残された人などを助ける消防の隊を ＿＿ といいます。",
        answer: "救助隊",
        acceptableAnswers: ["レスキュー隊"],
        explanation: "事故や災害の現場で人を助ける消防の隊を「救助隊」といいます。「レスキュー隊」と呼ばれることもあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】昔、レコードに記録された音楽などを聞くために使われた道具を ＿＿ といいます。",
        answer: "蓄音機",
        acceptableAnswers: ["ちくおんき"],
        explanation: "レコードに記録された音を再生する昔の道具を「蓄音機」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】住宅、田畑、工場、店など、土地がどのように使われているかを ＿＿ といいます。",
        answer: "土地利用",
        acceptableAnswers: ["土地の利用"],
        explanation: "土地が住宅、田畑、工場、店などにどのように使われているかを「土地利用」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】市や町について調べる資料と、そこからわかることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "バス路線図", match: "バスが通る道や停留所"),
        QuizMatchingPair(prompt: "ハザードマップ", match: "災害の危険がある場所や避難場所"),
        QuizMatchingPair(prompt: "ごみ収集カレンダー", match: "ごみを出す曜日や種類"),
        QuizMatchingPair(prompt: "公共施設案内", match: "市の施設の場所や利用方法")
        ],
        choices: [
        "市の施設の場所や利用方法",
        "ごみを出す曜日や種類",
        "バスが通る道や停留所",
        "災害の危険がある場所や避難場所"
        ],
        explanation: "バス路線図ではバスの経路、ハザードマップでは災害への備え、ごみ収集カレンダーでは収集日、公共施設案内では施設の場所や利用方法を調べられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】農家の工夫と、その主な目的を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "畝を作る", match: "水はけなどをよくして作物を育てやすくする"),
        QuizMatchingPair(prompt: "堆肥を使う", match: "土の状態をよくする"),
        QuizMatchingPair(prompt: "防鳥ネットを張る", match: "鳥による作物の被害を防ぐ"),
        QuizMatchingPair(prompt: "作業日誌をつける", match: "作物の育ち方や作業を記録する")
        ],
        choices: [
        "作物の育ち方や作業を記録する",
        "鳥による作物の被害を防ぐ",
        "水はけなどをよくして作物を育てやすくする",
        "土の状態をよくする"
        ],
        explanation: "畝は作物を育てやすくする工夫、堆肥は土づくり、防鳥ネットは鳥による被害の防止、作業日誌は作物や作業の記録に役立ちます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】食品工場で行われる衛生のための工夫と、その目的を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ヘアネットを着ける", match: "髪の毛が食品に入るのを防ぐ"),
        QuizMatchingPair(prompt: "手をよく洗う", match: "手についた汚れなどを落とす"),
        QuizMatchingPair(prompt: "エアシャワーを使う", match: "服などについたほこりを落とす"),
        QuizMatchingPair(prompt: "冷蔵庫の温度を記録する", match: "材料を適切な温度で保てているか確かめる")
        ],
        choices: [
        "服などについたほこりを落とす",
        "材料を適切な温度で保てているか確かめる",
        "髪の毛が食品に入るのを防ぐ",
        "手についた汚れなどを落とす"
        ],
        explanation: "食品工場では、ヘアネット、手洗い、エアシャワー、温度管理などによって、食品を衛生的に作る工夫をしています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店のサービスや設備と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "宅配サービス", match: "買った商品を客の家などへ届ける"),
        QuizMatchingPair(prompt: "リサイクル回収ボックス", match: "食品トレーなどの資源を集める"),
        QuizMatchingPair(prompt: "段差のない入口", match: "車いすやベビーカーでも入りやすくする"),
        QuizMatchingPair(prompt: "案内カウンター", match: "売り場やサービスについて案内する")
        ],
        choices: [
        "車いすやベビーカーでも入りやすくする",
        "売り場やサービスについて案内する",
        "買った商品を客の家などへ届ける",
        "食品トレーなどの資源を集める"
        ],
        explanation: "店では、宅配、資源回収、段差のない入口、案内カウンターなど、さまざまな人が利用しやすくなる工夫をしています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】警察に関係する場所と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "交番", match: "身近な地域の見回りや道案内などを行う"),
        QuizMatchingPair(prompt: "警察署", match: "受け持つ地域の警察活動の中心となる"),
        QuizMatchingPair(prompt: "通信指令室", match: "110番を受けて警察官へ指令を出す"),
        QuizMatchingPair(prompt: "交通管制センター", match: "道路の交通情報を集めて交通を管理する")
        ],
        choices: [
        "道路の交通情報を集めて交通を管理する",
        "身近な地域の見回りや道案内などを行う",
        "110番を受けて警察官へ指令を出す",
        "受け持つ地域の警察活動の中心となる"
        ],
        explanation: "交番は身近な地域、警察署は地域の警察活動の中心、通信指令室は110番への対応、交通管制センターは道路交通の管理に関わります。"
        ),

        QuizQuestion.classification(
        question: "【分類】農家の仕事を、その主な目的ごとに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "畑を耕す", match: "育てる準備"),
        QuizMatchingPair(prompt: "必要に応じて肥料を与える", match: "成長を助ける"),
        QuizMatchingPair(prompt: "防鳥ネットを張る", match: "害から守る"),
        QuizMatchingPair(prompt: "箱に出荷用の表示を付ける", match: "出荷の準備")
        ],
        categories: ["育てる準備", "成長を助ける", "害から守る", "出荷の準備"],
        explanation: "畑を耕すのは育てる準備、肥料を与えるのは成長を助ける仕事、防鳥ネットは作物を守る仕事、箱への表示は出荷の準備です。"
        ),

        QuizQuestion.classification(
        question: "【分類】工場の工夫を、その目的ごとに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "床を滑りにくくする", match: "安全"),
        QuizMatchingPair(prompt: "製品の重さを確かめる", match: "品質"),
        QuizMatchingPair(prompt: "排水を処理する", match: "環境"),
        QuizMatchingPair(prompt: "作業しやすい順に機械を配置する", match: "効率")
        ],
        categories: ["安全", "品質", "環境", "効率"],
        explanation: "床の工夫は安全、製品の確認は品質、排水処理は環境、機械の配置は効率に関する工夫です。"
        ),

        QuizQuestion.classification(
        question: "【分類】昔使われていた道具を、その主な使い道で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ちゃぶ台", match: "食事"),
        QuizMatchingPair(prompt: "火のし", match: "衣類の手入れ"),
        QuizMatchingPair(prompt: "手押しポンプ", match: "水くみ"),
        QuizMatchingPair(prompt: "柱時計", match: "時刻を知る")
        ],
        categories: ["食事", "衣類の手入れ", "水くみ", "時刻を知る"],
        explanation: "ちゃぶ台は食事、火のしは衣類のしわをのばす手入れ、手押しポンプは水くみ、柱時計は時刻を知るために使われました。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域の昔と今を比べてわかった変化を、その種類ごとに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "バスの本数が増えた", match: "交通の変化"),
        QuizMatchingPair(prompt: "地域に住む人が増えた", match: "人口の変化"),
        QuizMatchingPair(prompt: "田畑が店のある土地になった", match: "土地利用の変化"),
        QuizMatchingPair(prompt: "上下水道が整えられた", match: "生活設備の変化")
        ],
        categories: ["交通の変化", "人口の変化", "土地利用の変化", "生活設備の変化"],
        explanation: "バスは交通、住む人の数は人口、田畑から店への変化は土地利用、上下水道は生活設備の変化として分けられます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】冷蔵が必要な商品が店に届いてから客が買うまでの基本的な流れを、早い順に並べましょう。",
        choices: [
        "必要な分を売り場に並べる",
        "配送車から商品を受け取る",
        "客が商品を買う",
        "冷蔵する場所で保管する"
        ],
        orderedChoices: [
        "配送車から商品を受け取る",
        "冷蔵する場所で保管する",
        "必要な分を売り場に並べる",
        "客が商品を買う"
        ],
        explanation: "冷蔵が必要な商品は、店に届いた後、適切な温度で保管され、必要な分が売り場に並べられてから客に販売されます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】遠くの人へ情報を伝える方法を、日本で広く使われるようになった時期が古い順に並べましょう。",
        choices: [
        "携帯電話",
        "固定電話",
        "手紙",
        "電報"
        ],
        orderedChoices: [
        "手紙",
        "電報",
        "固定電話",
        "携帯電話"
        ],
        explanation: "手紙は古くから使われ、その後、電報、固定電話、携帯電話の順に新しい通信方法が広く使われるようになりました。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ある地域の変化を表した写真の様子を、古いと考えられる順に並べましょう。",
        choices: [
        "駅の周りに家が増えている",
        "田畑が広がり、建物がほとんどない",
        "駅前に大きな店や集合住宅が建っている",
        "田畑の近くに新しい駅ができている"
        ],
        orderedChoices: [
        "田畑が広がり、建物がほとんどない",
        "田畑の近くに新しい駅ができている",
        "駅の周りに家が増えている",
        "駅前に大きな店や集合住宅が建っている"
        ],
        explanation: "田畑が広がる状態から駅ができ、駅の周りに住宅が増え、さらに店や集合住宅が建つという地域の変化として並べられます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】119番の通報を受けてから消防車が現場に着くまでにかかった時間です。短い順に並べましょう。",
        choices: [
        "A地区：6分",
        "B地区：4分",
        "C地区：8分",
        "D地区：5分"
        ],
        rankedChoices: [
        "B地区：4分",
        "D地区：5分",
        "A地区：6分",
        "C地区：8分"
        ],
        explanation: "4分、5分、6分、8分の順なので、「B地区、D地区、A地区、C地区」の順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】4つの交差点で1年間に起きた交通事故の件数です。事故が多い順に並べましょう。",
        choices: [
        "A交差点：12件",
        "B交差点：7件",
        "C交差点：15件",
        "D交差点：9件"
        ],
        rankedChoices: [
        "C交差点：15件",
        "A交差点：12件",
        "D交差点：9件",
        "B交差点：7件"
        ],
        explanation: "15件、12件、9件、7件の順なので、「C交差点、A交差点、D交差点、B交差点」の順です。"
        ),

        QuizQuestion(
        question: "駅の近くに店や飲食店が集まりやすい主な理由はどれですか？",
        choices: [
        "電車などを利用する多くの人が行き来するから",
        "駅の近くでは農作物しか売れないから",
        "駅では車が一台も通らないから",
        "駅の建物の中でしか買い物ができないから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「電車などを利用する多くの人が行き来するから」です。駅の近くは多くの人が行き来するため、店や飲食店が集まりやすくなります。"
        ),

        QuizQuestion(
        question: "農家が畑に防虫ネットをかける主な目的はどれですか？",
        choices: [
        "畑の土を道路にするため",
        "害虫から作物を守るため",
        "作物をすぐに冷凍するため",
        "畑に車を止めるため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「害虫から作物を守るため」です。防虫ネットは、作物に虫がついたり食べられたりするのを防ぐために使います。"
        ),

        QuizQuestion(
        question: "工場で作業する人がヘルメットをかぶる主な理由はどれですか？",
        choices: [
        "製品の値段を覚えるため",
        "機械の音を大きくするため",
        "頭をけがから守るため",
        "工場の外を暗くするため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「頭をけがから守るため」です。工場では安全に作業するため、必要な場所でヘルメットなどの保護具を使います。"
        ),

        QuizQuestion(
        question: "店で肉や魚を冷蔵ケースに入れて売る主な理由はどれですか？",
        choices: [
        "商品を重くするため",
        "商品の名前を変えるため",
        "客から商品を見えなくするため",
        "低い温度に保って品質を守るため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「低い温度に保って品質を守るため」です。肉や魚などは、冷蔵ケースで適した温度に保ちながら販売します。"
        ),

        QuizQuestion(
        question: "消防署で地域の道路や建物の場所を日ごろから確かめておく主な理由はどれですか？",
        choices: [
        "火事などのときに現場へすばやく向かうため",
        "地域の店の値段を決めるため",
        "道路を消防署だけが使うため",
        "すべての建物を消防署に変えるため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「火事などのときに現場へすばやく向かうため」です。道路や建物の位置を知っておくことは、緊急時のすばやい出動に役立ちます。"
        ),

        QuizQuestion(
        question: "登校する時間に警察官が通学路で見守りをする主な目的はどれですか？",
        choices: [
        "学校の授業内容を決めるため",
        "子どもが安全に道路を通れるようにするため",
        "店の商品を学校へ運ぶため",
        "農作物の収穫量を調べるため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「子どもが安全に道路を通れるようにするため」です。警察官は交通事故を防ぐため、通学路などで安全を見守ることがあります。"
        ),

        QuizQuestion(
        question: "昔よく使われた黒電話で、電話番号を入力するときに使った部分はどれですか？",
        choices: [
        "タッチパネル",
        "バーコード読み取り機",
        "回して使うダイヤル",
        "テレビのリモコン"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「回して使うダイヤル」です。昔の黒電話には、数字の穴に指を入れて回すダイヤルが付いたものが多くありました。"
        ),

        QuizQuestion(
        question: "同じ川にかかる橋が、昔は1本、今は3本になっていました。この変化から最も考えられることはどれですか？",
        choices: [
        "川を渡ることができなくなった",
        "地域から道路がなくなった",
        "川の水がすべてなくなった",
        "川の向こう側へ移動しやすくなった"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「川の向こう側へ移動しやすくなった」です。橋が増えると、川を渡る場所が増え、人や車が行き来しやすくなります。"
        ),

        QuizQuestion(
        question: "田んぼの近くにある用水路の主な役割はどれですか？",
        choices: [
        "田んぼなどへ必要な水を運ぶ",
        "収穫した米を店まで運ぶ",
        "農業用の機械をしまっておく",
        "田んぼを住宅地に変える"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「田んぼなどへ必要な水を運ぶ」です。用水路は、作物を育てるために必要な水を農地へ送るのに役立ちます。"
        ),

        QuizQuestion(
        question: "工場で出た金属の切れはしなどを種類ごとに分けることがあります。その主な理由はどれですか？",
        choices: [
        "工場の機械をすべて止めるため",
        "資源として再利用しやすくするため",
        "製品の名前を変えるため",
        "工場の土地を農地にするため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「資源として再利用しやすくするため」です。材料の切れはしなどを分別することで、資源として再利用しやすくなります。"
        ),

        QuizQuestion(
        question: "店が新聞などにチラシを入れる主な目的はどれですか？",
        choices: [
        "店の建物を小さくするため",
        "商品の産地をなくすため",
        "売り出しの商品や値段を客に知らせるため",
        "店員の人数を毎日同じにするため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「売り出しの商品や値段を客に知らせるため」です。チラシは、特売品や値段などの情報を客に伝えるために使われます。"
        ),

        QuizQuestion(
        question: "警察が地域ごとの交通事故の件数や場所を調べる主な理由はどれですか？",
        choices: [
        "地域の農作物の種類を決めるため",
        "店の売り上げを増やすため",
        "消防車の色を決めるため",
        "事故が起こりやすい場所を知り、安全対策に役立てるため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「事故が起こりやすい場所を知り、安全対策に役立てるため」です。事故の件数や場所を調べることは、交通安全の取り組みに役立ちます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】バスや電車など、多くの人が利用する交通手段をまとめて ＿＿ といいます。",
        answer: "公共交通",
        acceptableAnswers: ["公共交通機関"],
        explanation: "バスや電車など、多くの人が利用する交通手段をまとめて「公共交通」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】火事が起こらないように注意したり、火事を防いだりすることを ＿＿ といいます。",
        answer: "防火",
        acceptableAnswers: [],
        explanation: "火事が起こらないように注意し、火事を防ぐことを「防火」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】交番のほかに、地域によっては警察官が勤務して地域の安全を守る ＿＿ があります。",
        answer: "駐在所",
        acceptableAnswers: [],
        explanation: "地域によっては、警察官が勤務して地域の安全を守る「駐在所」があります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】昔、井戸の水をくむために、縄の先に桶などを付けて上下させた道具を ＿＿ といいます。",
        answer: "つるべ",
        acceptableAnswers: ["釣瓶"],
        explanation: "井戸の水をくむために、縄の先に桶などを付けて上下させた昔の道具を「つるべ」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】市や町にある交通に関係する場所と、その役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "駅", match: "鉄道に乗り降りする"),
        QuizMatchingPair(prompt: "バス停", match: "路線バスを待って乗り降りする"),
        QuizMatchingPair(prompt: "駐輪場", match: "自転車を決められた場所に止める"),
        QuizMatchingPair(prompt: "歩道橋", match: "道路の上を通って反対側へ渡る")
        ],
        choices: [
        "自転車を決められた場所に止める",
        "道路の上を通って反対側へ渡る",
        "鉄道に乗り降りする",
        "路線バスを待って乗り降りする"
        ],
        explanation: "駅は鉄道の乗り降り、バス停は路線バスの乗り降り、駐輪場は自転車を止める場所、歩道橋は道路の上を通って横断するための施設です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】農家が使うものと、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "支柱", match: "倒れやすい作物の茎を支える"),
        QuizMatchingPair(prompt: "マルチシート", match: "土の表面をおおい、雑草を生えにくくする"),
        QuizMatchingPair(prompt: "スプリンクラー", match: "広い範囲に水をまく"),
        QuizMatchingPair(prompt: "収穫かご", match: "収穫した作物を入れて運ぶ")
        ],
        choices: [
        "広い範囲に水をまく",
        "収穫した作物を入れて運ぶ",
        "土の表面をおおい、雑草を生えにくくする",
        "倒れやすい作物の茎を支える"
        ],
        explanation: "支柱は作物の茎を支え、マルチシートは土の表面をおおい、スプリンクラーは水をまき、収穫かごは収穫した作物を運ぶために使います。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工場の安全のための工夫と、その目的を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "床の通路を線で分ける", match: "人が歩く場所をわかりやすくする"),
        QuizMatchingPair(prompt: "機械に安全カバーを付ける", match: "動く部分に不用意に触れにくくする"),
        QuizMatchingPair(prompt: "保護めがねを使う", match: "目を飛んでくる細かな物などから守る"),
        QuizMatchingPair(prompt: "非常停止ボタンを備える", match: "異常があったときに機械を止められるようにする")
        ],
        choices: [
        "異常があったときに機械を止められるようにする",
        "人が歩く場所をわかりやすくする",
        "目を飛んでくる細かな物などから守る",
        "動く部分に不用意に触れにくくする"
        ],
        explanation: "工場では、通路を分けたり、安全カバーや保護めがねを使ったり、非常停止ボタンを備えたりして、事故を防ぐ工夫をしています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店にある設備や道具と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "買い物かご", match: "選んだ商品を入れて持ち運ぶ"),
        QuizMatchingPair(prompt: "売り場の案内表示", match: "目的の商品がある場所を見つけやすくする"),
        QuizMatchingPair(prompt: "袋詰め台", match: "会計後の商品を袋に入れる場所にする"),
        QuizMatchingPair(prompt: "自動ドア", match: "入口で人が出入りしやすくする")
        ],
        choices: [
        "入口で人が出入りしやすくする",
        "選んだ商品を入れて持ち運ぶ",
        "会計後の商品を袋に入れる場所にする",
        "目的の商品がある場所を見つけやすくする"
        ],
        explanation: "買い物かごは商品の持ち運び、案内表示は売り場探し、袋詰め台は会計後の袋詰め、自動ドアは出入りをしやすくするために役立ちます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】消防で行う訓練と、その主な目的を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "放水訓練", match: "ホースを使ってねらった場所へ水を送る練習をする"),
        QuizMatchingPair(prompt: "救助訓練", match: "取り残された人を安全に助ける練習をする"),
        QuizMatchingPair(prompt: "救急訓練", match: "けが人などへの応急手当の練習をする"),
        QuizMatchingPair(prompt: "通信訓練", match: "必要な情報を正確に伝える練習をする")
        ],
        choices: [
        "必要な情報を正確に伝える練習をする",
        "けが人などへの応急手当の練習をする",
        "ホースを使ってねらった場所へ水を送る練習をする",
        "取り残された人を安全に助ける練習をする"
        ],
        explanation: "放水訓練は消火、救助訓練は人命救助、救急訓練は応急手当、通信訓練は正確な情報伝達のために行います。"
        ),

        QuizQuestion.classification(
        question: "【分類】市や町で見られるものを、特に関係の深い場所で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "横断歩道", match: "道路"),
        QuizMatchingPair(prompt: "踏切", match: "鉄道"),
        QuizMatchingPair(prompt: "すべり台", match: "公園"),
        QuizMatchingPair(prompt: "堤防", match: "川")
        ],
        categories: ["道路", "鉄道", "公園", "川"],
        explanation: "横断歩道は道路、踏切は鉄道、すべり台は公園、堤防は川に特に関係の深いものです。"
        ),

        QuizQuestion.classification(
        question: "【分類】交通安全に役立つ設備を、その主な役割で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "歩行者用信号機", match: "横断する人に進む・止まるを知らせる"),
        QuizMatchingPair(prompt: "ガードレール", match: "歩道などへ車が入りにくくする"),
        QuizMatchingPair(prompt: "カーブミラー", match: "見通しの悪い場所で向こう側を確認しやすくする"),
        QuizMatchingPair(prompt: "道路標識", match: "道路の決まりや注意を知らせる")
        ],
        categories: [
        "横断する人に進む・止まるを知らせる",
        "歩道などへ車が入りにくくする",
        "見通しの悪い場所で向こう側を確認しやすくする",
        "道路の決まりや注意を知らせる"
        ],
        explanation: "歩行者用信号機、ガードレール、カーブミラー、道路標識には、それぞれ交通事故を防ぐための異なる役割があります。"
        ),

        QuizQuestion.classification(
        question: "【分類】昔から使われてきた道具を、主な使い道で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "羽釜", match: "ご飯を炊く"),
        QuizMatchingPair(prompt: "竹ぼうき", match: "地面などを掃く"),
        QuizMatchingPair(prompt: "天秤棒", match: "荷物を担いで運ぶ"),
        QuizMatchingPair(prompt: "そろばん", match: "数を計算する")
        ],
        categories: ["ご飯を炊く", "地面などを掃く", "荷物を担いで運ぶ", "数を計算する"],
        explanation: "羽釜は炊飯、竹ぼうきは掃除、天秤棒は荷物の運搬、そろばんは計算に使われてきた道具です。"
        ),

        QuizQuestion.classification(
        question: "【分類】昔と今を比べて見つけた地域の変化を、変化した場所で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "細い道が広い道路になった", match: "道"),
        QuizMatchingPair(prompt: "空き地だった場所に学校が建った", match: "建物"),
        QuizMatchingPair(prompt: "田んぼだった場所が駐車場になった", match: "田畑"),
        QuizMatchingPair(prompt: "川沿いに新しい堤防ができた", match: "川")
        ],
        categories: ["道", "建物", "田畑", "川"],
        explanation: "道路の広がりは道、学校の建設は建物、田んぼから駐車場への変化は田畑、堤防の整備は川の変化として整理できます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】野菜の苗を育ててから収穫するまでの基本的な流れを、早い順に並べましょう。",
        choices: [
        "育った野菜を収穫する",
        "苗を育てる",
        "畑に苗を植える",
        "水やりなどの世話をする"
        ],
        orderedChoices: [
        "苗を育てる",
        "畑に苗を植える",
        "水やりなどの世話をする",
        "育った野菜を収穫する"
        ],
        explanation: "基本的には、まず苗を育て、畑に植え、水やりなどの世話をし、十分に育ってから収穫します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】パン工場でパンを作る基本的な流れを、早い順に並べましょう。",
        choices: [
        "焼き上がったパンを包装する",
        "材料を量る",
        "生地をこねる",
        "生地を焼く"
        ],
        orderedChoices: [
        "材料を量る",
        "生地をこねる",
        "生地を焼く",
        "焼き上がったパンを包装する"
        ],
        explanation: "基本的には、材料を量り、生地をこね、焼いた後で、できあがったパンを包装します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】学校で火災を想定した避難訓練をするときの基本的な流れを、早い順に並べましょう。",
        choices: [
        "集合場所で人数を確認する",
        "火災を知らせる放送を聞く",
        "決められた避難経路で校舎の外へ出る",
        "先生の指示を聞いて避難を始める"
        ],
        orderedChoices: [
        "火災を知らせる放送を聞く",
        "先生の指示を聞いて避難を始める",
        "決められた避難経路で校舎の外へ出る",
        "集合場所で人数を確認する"
        ],
        explanation: "火災を知らせる放送を聞いたら、先生の指示に従って避難を始め、決められた経路で外へ出て、集合場所で人数を確認します。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある店で1日に売れた商品の数です。売れた数が多い順に並べましょう。",
        choices: [
        "牛乳：48本",
        "パン：63個",
        "おにぎり：71個",
        "ジュース：55本"
        ],
        rankedChoices: [
        "おにぎり：71個",
        "パン：63個",
        "ジュース：55本",
        "牛乳：48本"
        ],
        explanation: "71個、63個、55本、48本の順なので、「おにぎり、パン、ジュース、牛乳」の順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある町の人口の記録です。人口が多い順に並べましょう。",
        choices: [
        "1960年：7,600人",
        "2000年：12,800人",
        "1980年：9,200人",
        "2020年：15,000人"
        ],
        rankedChoices: [
        "2020年：15,000人",
        "2000年：12,800人",
        "1980年：9,200人",
        "1960年：7,600人"
        ],
        explanation: "15,000人、12,800人、9,200人、7,600人の順なので、「2020年、2000年、1980年、1960年」の順です。"
        ),

        QuizQuestion(
        question: "市や町の中で、学校や図書館などの公共施設がどこにあるか調べるとき、最も役立つものはどれですか？",
        choices: [
        "市や町の地図",
        "一週間の天気予報",
        "買い物のレシート",
        "学校の時間割"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「市や町の地図」です。地図を見ると、学校や図書館などの公共施設がどこにあるか確かめることができます。"
        ),

        QuizQuestion(
        question: "農家が天気予報を確かめる主な理由はどれですか？",
        choices: [
        "作物の名前を決めるため",
        "天気に合わせて農作業の予定を立てるため",
        "畑の広さを変えるため",
        "店の営業時間を決めるため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「天気に合わせて農作業の予定を立てるため」です。雨や気温などを確かめることで、種まきや収穫などの作業予定を考えやすくなります。"
        ),

        QuizQuestion(
        question: "工場で機械と人が仕事を分けて行う理由として、最も適切なものはどれですか？",
        choices: [
        "工場の建物を目立たせるため",
        "製品の種類を一つにするため",
        "安全に気をつけながら、効率よく製品を作るため",
        "働く人が原料を家に持ち帰るため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「安全に気をつけながら、効率よく製品を作るため」です。工場では、機械が得意な作業と人が確かめる作業などを分けて製品を作っています。"
        ),

        QuizQuestion(
        question: "食品についている「産地」の表示を見ると、主に何がわかりますか？",
        choices: [
        "店が開店した時刻",
        "商品を運んだ車の色",
        "買った人の人数",
        "その食品が生産された地域"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「その食品が生産された地域」です。産地の表示から、野菜や果物などがどこで生産されたかを確かめることができます。"
        ),

        QuizQuestion(
        question: "道路の近くなどにある消火栓の主な役割はどれですか？",
        choices: [
        "救急車を呼ぶための電話になる",
        "消火に使う水を取り出せるようにする",
        "火事の場所を自動で放送する",
        "消防車の進む道を決める"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「消火に使う水を取り出せるようにする」です。消火栓は、火事のときに消防隊が消火用の水を使うための設備です。"
        ),

        QuizQuestion(
        question: "警察官がパトカーで地域を見回る主な目的はどれですか？",
        choices: [
        "店の商品を運ぶため",
        "道路を新しく作るため",
        "事故や事件などの異常を早く見つけ、地域の安全を守るため",
        "農作物の育ち方を調べるため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「事故や事件などの異常を早く見つけ、地域の安全を守るため」です。警察官は地域を見回り、事故や事件の防止や早期発見に努めています。"
        ),

        QuizQuestion(
        question: "昔使われていた「氷冷蔵庫」は、どのように食品を冷やしていましたか？",
        choices: [
        "太陽の光を当てて冷やした",
        "炭を燃やして冷やした",
        "手であおいで冷やした",
        "中に入れた氷の冷たさで冷やした"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「中に入れた氷の冷たさで冷やした」です。氷冷蔵庫は、電気ではなく氷の冷たさを利用して食品を冷やしました。"
        ),

        QuizQuestion(
        question: "同じ地域の昔と今を比べると、昔は駅の近くに細い道が一本だけあり、今は広い道路やバス停が増えていました。どのような変化があったと考えられますか？",
        choices: [
        "交通が便利になった",
        "農地だけが増えた",
        "人が移動できなくなった",
        "川の流れる向きが反対になった"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「交通が便利になった」です。広い道路やバス停が増えたことから、人や車が移動しやすくなったと考えられます。"
        ),

        QuizQuestion(
        question: "市や町の地図にある地図記号を見ると、主に何を知ることができますか？",
        choices: [
        "建物を建てた人の名前",
        "建物を建てるのにかかった金額",
        "そこにある施設などの種類",
        "その日の利用者の人数"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「そこにある施設などの種類」です。地図記号を使うと、学校や警察署など、そこに何があるのかを地図上で表すことができます。"
        ),

        QuizQuestion(
        question: "農家が農産物を直売所で売るときの特徴として、最も適切なものはどれですか？",
        choices: [
        "農産物を必ず外国へ送る",
        "収穫したものをすべて工場の原料にする",
        "農産物を店に出さず捨てる",
        "地域の人などに農産物を直接販売できる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「地域の人などに農産物を直接販売できる」です。直売所では、農家が育てた農産物を地域の消費者などに直接販売できます。"
        ),

        QuizQuestion(
        question: "大きな道路の近くに工場が建てられることがある主な理由はどれですか？",
        choices: [
        "原料や製品をトラックで運びやすいから",
        "道路の音で機械を動かすから",
        "道路の上で製品を作るから",
        "工場の中に車を入れないため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「原料や製品をトラックで運びやすいから」です。道路に近いと、原料を運び入れたり、できた製品を運び出したりしやすくなります。"
        ),

        QuizQuestion(
        question: "店が季節や天気に合わせて売り場の商品を入れ替える主な理由はどれですか？",
        choices: [
        "商品の名前を毎日変えるため",
        "その時期に客が必要とする商品を見つけやすくするため",
        "レジを使わなくてよくするため",
        "店の住所を変えるため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「その時期に客が必要とする商品を見つけやすくするため」です。暑い日や寒い日、季節の行事などに合わせて、客が求める商品を見つけやすくしています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域の人が、ふだんは別の仕事をしながら火事や災害のときに消防活動を行う組織を ＿＿ といいます。",
        answer: "消防団",
        acceptableAnswers: [],
        explanation: "地域の人が、ふだんは別の仕事をしながら消防活動を行う組織を「消防団」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】警察官が地域の安全を守るため、受け持つ地域を見回ることを ＿＿ といいます。",
        answer: "パトロール",
        acceptableAnswers: ["巡回"],
        explanation: "地域の安全を守るために警察官が見回ることを「パトロール」といいます。「巡回」も同じ意味で使われます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】足で踏む力を使って針を動かし、布を縫う昔の道具を ＿＿ といいます。",
        answer: "足踏みミシン",
        acceptableAnswers: [],
        explanation: "足で踏む力を使って針を動かし、布を縫う昔の道具は「足踏みミシン」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域の昔と今を上空から見比べるときに役立つ、空から地面を写した写真を ＿＿ といいます。",
        answer: "航空写真",
        acceptableAnswers: ["空中写真"],
        explanation: "空から地面を写した写真を「航空写真」といいます。「空中写真」ともいい、地域の昔と今の様子を比べる資料になります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】市や町にある施設と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "保健センター", match: "健康についての相談や健診などを行う"),
        QuizMatchingPair(prompt: "児童館", match: "子どもが遊んだり活動したりする場を提供する"),
        QuizMatchingPair(prompt: "ごみ処理施設", match: "集められたごみを処理する"),
        QuizMatchingPair(prompt: "市民体育館", match: "地域の人が運動できる場を提供する")
        ],
        choices: [
        "地域の人が運動できる場を提供する",
        "集められたごみを処理する",
        "健康についての相談や健診などを行う",
        "子どもが遊んだり活動したりする場を提供する"
        ],
        explanation: "保健センターは健康相談や健診、児童館は子どもの遊びや活動、ごみ処理施設はごみの処理、市民体育館は地域の人の運動に関わる施設です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】農業で使う機械と、その主な仕事を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "トラクター", match: "土を耕す作業などに使う"),
        QuizMatchingPair(prompt: "田植え機", match: "田んぼに稲の苗を植える"),
        QuizMatchingPair(prompt: "コンバイン", match: "稲を刈り取り、もみを分ける"),
        QuizMatchingPair(prompt: "選果機", match: "果物などを大きさなどで分ける")
        ],
        choices: [
        "田んぼに稲の苗を植える",
        "果物などを大きさなどで分ける",
        "土を耕す作業などに使う",
        "稲を刈り取り、もみを分ける"
        ],
        explanation: "トラクターは土を耕す作業など、田植え機は苗を植える作業、コンバインは稲の刈り取りなど、選果機は果物などを分ける作業に使います。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工場で働く人の仕事と、その内容を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "製造", match: "機械などを使って製品を作る"),
        QuizMatchingPair(prompt: "品質検査", match: "できた製品に問題がないか確かめる"),
        QuizMatchingPair(prompt: "設備点検", match: "機械が安全に動くか確かめる"),
        QuizMatchingPair(prompt: "出荷", match: "完成した製品を送り出す準備をする")
        ],
        choices: [
        "機械が安全に動くか確かめる",
        "完成した製品を送り出す準備をする",
        "できた製品に問題がないか確かめる",
        "機械などを使って製品を作る"
        ],
        explanation: "製造では製品を作り、品質検査では製品を確かめ、設備点検では機械の安全を確かめ、出荷では完成品を送り出す準備をします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】食品の表示と、そこからわかることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "産地", match: "どこで生産されたか"),
        QuizMatchingPair(prompt: "内容量", match: "どのくらい入っているか"),
        QuizMatchingPair(prompt: "消費期限", match: "安全に食べられる期限の目安"),
        QuizMatchingPair(prompt: "価格", match: "いくらで売られているか")
        ],
        choices: [
        "いくらで売られているか",
        "安全に食べられる期限の目安",
        "どこで生産されたか",
        "どのくらい入っているか"
        ],
        explanation: "産地は生産された場所、内容量は入っている量、消費期限は安全に食べられる期限の目安、価格は売られている金額を表します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】火事を防いだり消したりする設備と、その役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "消火器", match: "初期の火を消すために使う"),
        QuizMatchingPair(prompt: "火災報知器", match: "火事を感知して知らせる"),
        QuizMatchingPair(prompt: "消火栓", match: "消火用の水を取り出せるようにする"),
        QuizMatchingPair(prompt: "防火水槽", match: "消火に使う水をたくわえておく")
        ],
        choices: [
        "消火に使う水をたくわえておく",
        "火事を感知して知らせる",
        "初期の火を消すために使う",
        "消火用の水を取り出せるようにする"
        ],
        explanation: "消火器は初期消火、火災報知器は火事の知らせ、消火栓は消火用の水の取り出し、防火水槽は消火用の水の確保に使われます。"
        ),

        QuizQuestion.classification(
        question: "【分類】警察官が使うものを、その主な使い方で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "パトカー", match: "地域の巡回"),
        QuizMatchingPair(prompt: "白バイ", match: "交通の安全を守る活動"),
        QuizMatchingPair(prompt: "無線機", match: "警察官どうしの連絡"),
        QuizMatchingPair(prompt: "反射材のついたベスト", match: "道路上での警察官の安全確保")
        ],
        categories: ["地域の巡回", "交通の安全を守る活動", "警察官どうしの連絡", "道路上での警察官の安全確保"],
        explanation: "パトカーは地域の巡回、白バイは交通の安全を守る活動、無線機は警察官どうしの連絡、反射材のついたベストは道路上での安全確保に役立ちます。"
        ),

        QuizQuestion.classification(
        question: "【分類】昔や今の道具を、主に使う力やエネルギーで分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "石臼", match: "人の力"),
        QuizMatchingPair(prompt: "七輪", match: "炭や火"),
        QuizMatchingPair(prompt: "石油ランプ", match: "油"),
        QuizMatchingPair(prompt: "電気掃除機", match: "電気")
        ],
        categories: ["人の力", "炭や火", "油", "電気"],
        explanation: "石臼は人の力、七輪は炭や火、石油ランプは油、電気掃除機は電気を主に利用する道具です。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域の昔と今を調べるときに知りたいことを、役立つ資料や方法で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "昔の道路がどこを通っていたか", match: "昔の地図"),
        QuizMatchingPair(prompt: "昔の町並みがどのようだったか", match: "昔の写真"),
        QuizMatchingPair(prompt: "昔の人がどんな生活をしていたか", match: "地域の人への聞き取り"),
        QuizMatchingPair(prompt: "現在の公共施設がどこにあるか", match: "今の地図")
        ],
        categories: ["昔の地図", "昔の写真", "地域の人への聞き取り", "今の地図"],
        explanation: "昔の道路の位置は昔の地図、昔の町並みは昔の写真、昔の生活は地域の人への聞き取り、現在の公共施設の位置は今の地図が特に役立ちます。"
        ),

        QuizQuestion.classification(
        question: "【分類】市や町にある施設を、その主な役割で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "保育所", match: "子育て"),
        QuizMatchingPair(prompt: "市民会館", match: "地域の活動"),
        QuizMatchingPair(prompt: "市立博物館", match: "文化"),
        QuizMatchingPair(prompt: "市民プール", match: "スポーツ")
        ],
        categories: ["子育て", "地域の活動", "文化", "スポーツ"],
        explanation: "保育所は子育て、市民会館は地域の活動、市立博物館は文化、市民プールはスポーツに関わる施設です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】食品工場で缶詰を作るときの基本的な流れを、早い順に並べましょう。",
        choices: [
        "缶を閉じる",
        "材料を洗って準備する",
        "缶に材料を入れる",
        "加熱して殺菌する"
        ],
        orderedChoices: [
        "材料を洗って準備する",
        "缶に材料を入れる",
        "缶を閉じる",
        "加熱して殺菌する"
        ],
        explanation: "基本的には、材料を洗って準備し、缶に入れ、缶を閉じてから加熱して殺菌します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】地域がどのように変わったかを調べて発表するまでの流れを、早い順に並べましょう。",
        choices: [
        "調べたことをまとめて発表する",
        "昔と今の資料を比べる",
        "調べるテーマを決める",
        "必要な地図や写真などを集める"
        ],
        orderedChoices: [
        "調べるテーマを決める",
        "必要な地図や写真などを集める",
        "昔と今の資料を比べる",
        "調べたことをまとめて発表する"
        ],
        explanation: "まず調べるテーマを決め、必要な資料を集めます。その後、昔と今を比べ、わかったことをまとめて発表します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】110番通報を受けてから警察官が現場で対応を始めるまでの流れを、早い順に並べましょう。",
        choices: [
        "警察官が現場に到着して対応を始める",
        "通信指令室が近くの警察官に連絡する",
        "110番で通報内容を聞く",
        "連絡を受けた警察官が現場へ向かう"
        ],
        orderedChoices: [
        "110番で通報内容を聞く",
        "通信指令室が近くの警察官に連絡する",
        "連絡を受けた警察官が現場へ向かう",
        "警察官が現場に到着して対応を始める"
        ],
        explanation: "110番で通報内容を聞いた後、通信指令室が近くの警察官へ連絡し、警察官が現場へ向かって、到着後に対応を始めます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある店の1日の来店者数です。来店者数が多い順に並べましょう。",
        choices: [
        "火曜日：420人",
        "木曜日：310人",
        "月曜日：250人",
        "水曜日：560人"
        ],
        rankedChoices: [
        "水曜日：560人",
        "火曜日：420人",
        "木曜日：310人",
        "月曜日：250人"
        ],
        explanation: "560人、420人、310人、250人の順なので、「水曜日、火曜日、木曜日、月曜日」の順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】4つの農家が出荷したじゃがいもの量です。出荷量が多い順に並べましょう。",
        choices: [
        "A農家：85kg",
        "B農家：120kg",
        "C農家：95kg",
        "D農家：70kg"
        ],
        rankedChoices: [
        "B農家：120kg",
        "C農家：95kg",
        "A農家：85kg",
        "D農家：70kg"
        ],
        explanation: "120kg、95kg、85kg、70kgの順なので、「B農家、C農家、A農家、D農家」の順です。"
        ),

        QuizQuestion(
        question: "市役所で受け取ることができるものはどれですか？",
        choices: [
        "住民票の写し",
        "工場の製品",
        "農家の肥料",
        "店の商品券"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「住民票の写し」です。市役所では、住所などを証明する住民票の写しを受け取ることができます。"
        ),

        QuizQuestion(
        question: "農家がビニールハウスを使う主な目的はどれですか？",
        choices: [
        "畑を駐車場にするため",
        "中の温度などを調整して作物を育てやすくするため",
        "収穫した野菜を店で売るため",
        "農具を道路に並べるため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「中の温度などを調整して作物を育てやすくするため」です。ビニールハウスでは、温度などを調整して作物を育てやすくします。"
        ),

        QuizQuestion(
        question: "工場でいう「原料」とは、どのようなものですか？",
        choices: [
        "工場で働く人の昼食",
        "完成した製品を運ぶ車",
        "製品を作るもとになる材料",
        "工場のまわりにある道路"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「製品を作るもとになる材料」です。工場では、その材料を加工して製品を作ります。"
        ),

        QuizQuestion(
        question: "店で商品の値段を確かめるときに見るものはどれですか？",
        choices: [
        "案内図",
        "時刻表",
        "整理券",
        "値札"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「値札」です。商品の値段は、商品や売り場に付けられた値札で確かめます。"
        ),

        QuizQuestion(
        question: "消防署で、いつでも出動できるように日ごろ行っていることはどれですか？",
        choices: [
        "消防車や道具を点検する",
        "商品の値段を決める",
        "田んぼに苗を植える",
        "住民票を発行する"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「消防車や道具を点検する」です。消防署では、いつでも安全に出動できるように点検を行います。"
        ),

        QuizQuestion(
        question: "交通事故の現場で警察官が行う仕事として最もふさわしいものはどれですか？",
        choices: [
        "野菜を収穫する",
        "交通を整理し、事故の様子を調べる",
        "商品を棚に並べる",
        "火を使って料理をする"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「交通を整理し、事故の様子を調べる」です。警察官は事故現場の安全を守りながら、事故の状況を確認します。"
        ),

        QuizQuestion(
        question: "昔の道具「洗濯板」は、何をするときに使った道具ですか？",
        choices: [
        "ご飯を炊く",
        "部屋を明るくする",
        "衣服をこすって洗う",
        "水をくみ上げる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「衣服をこすって洗う」です。洗濯板は、衣服を板にこすりつけて洗うために使った道具です。"
        ),

        QuizQuestion(
        question: "同じ場所の昔の写真では田畑が広がり、今の写真では家が多く建っています。このことからわかる変化はどれですか？",
        choices: [
        "川の水がなくなった",
        "山の高さが低くなった",
        "市役所が工場になった",
        "田畑が減り、住宅地が広がった"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「田畑が減り、住宅地が広がった」です。昔は田畑だった場所に家が多く建っていることから判断できます。"
        ),

        QuizQuestion(
        question: "市や町の様子をくわしく調べる方法として最もふさわしいものはどれですか？",
        choices: [
        "地図を持って実際に歩き、土地の使われ方を記録する",
        "教室の中だけで予想して決める",
        "一つの建物だけを見て市全体を判断する",
        "昔の写真だけを見て今の様子を決める"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地図を持って実際に歩き、土地の使われ方を記録する」です。地図と実際の様子を比べながら記録すると、地域の特徴をくわしく調べられます。"
        ),

        QuizQuestion(
        question: "農家が収穫した野菜を、大きさや品質などで分ける作業を何といいますか？",
        choices: [
        "加工",
        "選別",
        "消火",
        "会計"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「選別」です。収穫した野菜を大きさや品質などで分ける作業を選別といいます。"
        ),

        QuizQuestion(
        question: "工場で、できあがった製品を出荷前に検査する主な理由はどれですか？",
        choices: [
        "工場の建物を大きく見せるため",
        "働く人の数を増やすため",
        "決められた品質になっているか確かめるため",
        "原料を畑で育てるため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「決められた品質になっているか確かめるため」です。出荷前の検査で、製品の品質を確認します。"
        ),

        QuizQuestion(
        question: "スーパーマーケットが商品の売れ行きを記録する主な理由はどれですか？",
        choices: [
        "店の住所を変えるため",
        "買い物客の名前を覚えるため",
        "店内の時計を合わせるため",
        "売れ方に合わせて仕入れる量などを考えるため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「売れ方に合わせて仕入れる量などを考えるため」です。売れ行きの記録は、次にどのくらい仕入れるかを考える材料になります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】火事や救急のときに消防へ知らせる電話番号は ＿＿ 番です。数字で答えましょう。",
        answer: "119",
        acceptableAnswers: ["１１９"],
        explanation: "火事や救急のときに消防へ知らせる電話番号は「119」番です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】事件や交通事故などを警察へ知らせる電話番号は ＿＿ 番です。数字で答えましょう。",
        answer: "110",
        acceptableAnswers: ["１１０"],
        explanation: "事件や交通事故などを警察へ知らせる電話番号は「110」番です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】昔、炭の熱を使って衣服のしわをのばした道具を ＿＿ といいます。",
        answer: "炭火アイロン",
        acceptableAnswers: [],
        explanation: "炭の熱を使って衣服のしわをのばした昔の道具は「炭火アイロン」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】昔の地図と今の地図で同じ場所を探すとき、神社や川など長く変わりにくいものを ＿＿ にすると比べやすくなります。",
        answer: "目印",
        acceptableAnswers: ["めじるし"],
        explanation: "昔と今の地図を比べるときは、神社や川など長く変わりにくいものを「目印」にすると、同じ場所を見つけやすくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】市や町の施設と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "市役所", match: "住民の生活に関わる手続きや仕事を行う"),
        QuizMatchingPair(prompt: "図書館", match: "本や資料を利用できるようにする"),
        QuizMatchingPair(prompt: "公民館", match: "地域の人が学習や活動に使う場を用意する"),
        QuizMatchingPair(prompt: "公園", match: "遊んだり休んだりできる場所を用意する")
        ],
        choices: [
        "本や資料を利用できるようにする",
        "遊んだり休んだりできる場所を用意する",
        "住民の生活に関わる手続きや仕事を行う",
        "地域の人が学習や活動に使う場を用意する"
        ],
        explanation: "市役所は住民の生活に関わる手続きや仕事、図書館は本や資料の利用、公民館は地域の人の学習や活動、公園は遊びや休憩の場に関わる施設です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】農家の仕事と、その目的を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "土づくり", match: "作物が育ちやすい土にする"),
        QuizMatchingPair(prompt: "種まき", match: "作物の種を土にまく"),
        QuizMatchingPair(prompt: "間引き", match: "育ちやすいように株の間をあける"),
        QuizMatchingPair(prompt: "収穫", match: "育った作物を取り入れる")
        ],
        choices: [
        "育った作物を取り入れる",
        "作物の種を土にまく",
        "作物が育ちやすい土にする",
        "育ちやすいように株の間をあける"
        ],
        explanation: "土づくりは育ちやすい土にする仕事、種まきは種をまく仕事、間引きは株の間をあける仕事、収穫は育った作物を取り入れる仕事です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工場の場所と、そこで行うことを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "原料置き場", match: "製品のもとになる材料を保管する"),
        QuizMatchingPair(prompt: "製造ライン", match: "材料を加工したり組み立てたりする"),
        QuizMatchingPair(prompt: "検査場所", match: "製品の品質を確かめる"),
        QuizMatchingPair(prompt: "製品倉庫", match: "出荷前の完成品を保管する")
        ],
        choices: [
        "出荷前の完成品を保管する",
        "製品の品質を確かめる",
        "製品のもとになる材料を保管する",
        "材料を加工したり組み立てたりする"
        ],
        explanation: "原料置き場では材料を保管し、製造ラインでは加工や組み立てを行い、検査場所では品質を確かめ、製品倉庫では出荷前の完成品を保管します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店の場所と、その役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "売り場", match: "客が商品を選ぶ"),
        QuizMatchingPair(prompt: "レジ", match: "商品の代金を計算して受け取る"),
        QuizMatchingPair(prompt: "バックヤード", match: "売り場に出す前の商品などを置く"),
        QuizMatchingPair(prompt: "駐車場", match: "買い物客が車を止める")
        ],
        choices: [
        "買い物客が車を止める",
        "売り場に出す前の商品などを置く",
        "客が商品を選ぶ",
        "商品の代金を計算して受け取る"
        ],
        explanation: "売り場は商品を選ぶ場所、レジは代金を計算して受け取る場所、バックヤードは売り場に出す前の商品などを置く場所、駐車場は買い物客が車を止める場所です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】消防に関係する車や道具と、その役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "消防車", match: "火事の現場で消火活動をする"),
        QuizMatchingPair(prompt: "はしご車", match: "高い場所での消火や救助に使う"),
        QuizMatchingPair(prompt: "救急車", match: "病人やけが人を医療機関へ運ぶ"),
        QuizMatchingPair(prompt: "防火服", match: "熱などから消防隊員の体を守る")
        ],
        choices: [
        "高い場所での消火や救助に使う",
        "熱などから消防隊員の体を守る",
        "病人やけが人を医療機関へ運ぶ",
        "火事の現場で消火活動をする"
        ],
        explanation: "消防車は消火活動、はしご車は高い場所での消火や救助、救急車は病人やけが人の搬送、防火服は消防隊員の体を守るために使われます。"
        ),

        QuizQuestion.classification(
        question: "【分類】警察の仕事を、その内容ごとに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "横断歩道の近くで交通整理をする", match: "交通安全"),
        QuizMatchingPair(prompt: "地域をパトロールする", match: "防犯"),
        QuizMatchingPair(prompt: "事件の現場を調べる", match: "事件対応"),
        QuizMatchingPair(prompt: "届けられた落とし物を保管する", match: "遺失物対応")
        ],
        categories: ["交通安全", "防犯", "事件対応", "遺失物対応"],
        explanation: "交通整理は交通安全、パトロールは防犯、事件の現場調査は事件対応、落とし物の保管は遺失物対応に分けられます。"
        ),

        QuizQuestion.classification(
        question: "【分類】昔の道具を、主な使い道ごとに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "かまど", match: "炊事"),
        QuizMatchingPair(prompt: "洗濯板", match: "洗濯"),
        QuizMatchingPair(prompt: "行灯", match: "照明"),
        QuizMatchingPair(prompt: "火鉢", match: "暖房")
        ],
        categories: ["炊事", "洗濯", "照明", "暖房"],
        explanation: "かまどは炊事、洗濯板は洗濯、行灯は照明、火鉢は暖房に主に使われた道具です。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域で見られる変化を、変化の種類ごとに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "新しい駅ができた", match: "交通の変化"),
        QuizMatchingPair(prompt: "田畑だった場所に住宅団地ができた", match: "住宅の変化"),
        QuizMatchingPair(prompt: "空き地に大きな店ができた", match: "商業の変化"),
        QuizMatchingPair(prompt: "新しい図書館ができた", match: "公共施設の変化")
        ],
        categories: ["交通の変化", "住宅の変化", "商業の変化", "公共施設の変化"],
        explanation: "駅ができるのは交通、住宅団地ができるのは住宅、大きな店ができるのは商業、図書館ができるのは公共施設の変化です。"
        ),

        QuizQuestion.classification(
        question: "【分類】市や町にある場所を、土地の使われ方で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "市役所", match: "公共施設"),
        QuizMatchingPair(prompt: "一戸建ての家", match: "住宅"),
        QuizMatchingPair(prompt: "スーパーマーケット", match: "商業施設"),
        QuizMatchingPair(prompt: "田んぼ", match: "農地")
        ],
        categories: ["公共施設", "住宅", "商業施設", "農地"],
        explanation: "市役所は公共施設、一戸建ての家は住宅、スーパーマーケットは商業施設、田んぼは農地に分けられます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】農家が収穫した野菜を出荷する準備を、一般的な流れの順に並べましょう。",
        choices: [
        "箱に詰める",
        "収穫する",
        "大きさや品質で選別する",
        "土やよごれを落とす"
        ],
        orderedChoices: [
        "収穫する",
        "土やよごれを落とす",
        "大きさや品質で選別する",
        "箱に詰める"
        ],
        explanation: "一般的には、収穫し、土やよごれを落とし、大きさや品質で選別してから、出荷用の箱に詰めます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】工場で原料を受け入れてから製品を出荷するまでを、一般的な流れの順に並べましょう。",
        choices: [
        "製品を検査する",
        "原料を受け入れる",
        "製品を出荷する",
        "原料を加工して製品を作る"
        ],
        orderedChoices: [
        "原料を受け入れる",
        "原料を加工して製品を作る",
        "製品を検査する",
        "製品を出荷する"
        ],
        explanation: "一般的には、原料を受け入れ、加工して製品を作り、検査した後に出荷します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】店が商品を売り場に並べるまでの仕事を、一般的な流れの順に並べましょう。",
        choices: [
        "届いた商品を検品する",
        "必要な商品を発注する",
        "商品を売り場に並べる",
        "売れ行きなどから必要な量を考える"
        ],
        orderedChoices: [
        "売れ行きなどから必要な量を考える",
        "必要な商品を発注する",
        "届いた商品を検品する",
        "商品を売り場に並べる"
        ],
        explanation: "店では、売れ行きなどから必要な量を考え、商品を発注し、届いた商品を検品してから売り場に並べます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】消防署に出動の指令が届いてから放水を始めるまでを、早い順に並べましょう。",
        choices: [
        "現場でホースをのばす",
        "消防車で現場へ向かう",
        "放水を始める",
        "出動の指令を受ける"
        ],
        rankedChoices: [
        "出動の指令を受ける",
        "消防車で現場へ向かう",
        "現場でホースをのばす",
        "放水を始める"
        ],
        explanation: "出動の指令を受け、消防車で現場へ向かい、現場でホースをのばしてから放水を始めます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】警察に落とし物が届けられてから持ち主へ返すまでを、早い順に並べましょう。",
        choices: [
        "持ち主であることを確かめて返す",
        "落とし物の特徴を記録する",
        "落とし物を保管する",
        "落とし物を受け付ける"
        ],
        rankedChoices: [
        "落とし物を受け付ける",
        "落とし物の特徴を記録する",
        "落とし物を保管する",
        "持ち主であることを確かめて返す"
        ],
        explanation: "落とし物を受け付け、特徴を記録して保管し、持ち主であることを確かめてから返します。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai3, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Shakai3ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai3ListView(isPresenting: .constant(false))
    }
}
