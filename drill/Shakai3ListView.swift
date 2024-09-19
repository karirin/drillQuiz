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
            question: "日本で一番長い高速道路はどれですか？",
            choices: [
                "東名高速道路",
                "中国自動車道",
                "山陽自動車道",
                "東北自動車道"
            ],
            correctAnswerIndex: 3,
            explanation: "東北自動車道は日本で最も長い高速道路で、全長は約679キロメートルです。"
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
            question: "日本で最も人口が多い都市はどれですか？",
            choices: [
                "大阪市",
                "名古屋市",
                "横浜市",
                "東京都"
            ],
            correctAnswerIndex: 3,
            explanation: "東京都は日本で最も人口が多い都市です。"
        ),

        QuizQuestion(
            question: "日本で一番多くの温泉がある県はどこですか？",
            choices: [
                "大分県",
                "鹿児島県",
                "静岡県",
                "北海道"
            ],
            correctAnswerIndex: 0,
            explanation: "大分県は温泉の数が多く、特に別府温泉が有名です。"
        ),

        QuizQuestion(
            question: "日本で最も早く桜が咲く地域はどこですか？",
            choices: [
                "北海道",
                "青森県",
                "沖縄県",
                "福岡県"
            ],
            correctAnswerIndex: 2,
            explanation: "沖縄県では他の地域に比べて桜の開花が早いです。"
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
            question: "日本で最も多くの鉄道駅がある都市はどこですか？",
            choices: [
                "名古屋市",
                "大阪市",
                "東京都",
                "福岡市"
            ],
            correctAnswerIndex: 2,
            explanation: "東京都には多数の鉄道駅があり、日本で最も多い都市です。"
        ),

        QuizQuestion(
            question: "日本で最も電車の利用者数が多い駅はどこですか？",
            choices: [
                "渋谷駅",
                "新宿駅",
                "大阪駅",
                "東京駅"
            ],
            correctAnswerIndex: 1,
            explanation: "新宿駅は世界でも最も利用者数が多い駅として知られています。"
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
            correctAnswerIndex: 2,
            explanation: "高知県は、日本で最も多くの台風が上陸する地域のひとつです。"
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
                "東京スカイツリー",
                "ランドマークタワー",
                "六本木ヒルズ"
            ],
            correctAnswerIndex: 0,
            explanation: "あべのハルカスは日本で最も高いビルで、高さは300メートルです。"
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
            question: "日本で最も多くの城がある県はどこですか？",
            choices: [
                "愛知県",
                "兵庫県",
                "長野県",
                "福岡県"
            ],
            correctAnswerIndex: 0,
            explanation: "愛知県には日本で最も多くの城があり、名古屋城が有名です。"
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
            correctAnswerIndex: 1,
            explanation: "明石海峡大橋は全長3,911メートルで、世界最長の吊り橋でもあります。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai3, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Shakai3ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai3ListView(isPresenting: .constant(false))
    }
}
