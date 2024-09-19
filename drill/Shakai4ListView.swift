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
        QuizQuestion(
            question: "東京都の位置はどこですか？",
            choices: [
                "北海道",
                "東京都",
                "大阪府",
                "福岡県"
            ],
            correctAnswerIndex: 1,
            explanation: "東京都は日本の関東地方に位置しています。"
        ),
        QuizQuestion(
            question: "大阪府の県庁所在地はどこですか？",
            choices: [
                "大阪市",
                "神戸市",
                "京都市",
                "奈良市"
            ],
            correctAnswerIndex: 0,
            explanation: "大阪府の県庁所在地は大阪市です。"
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
            question: "北海道の県庁所在地はどこですか？",
            choices: [
                "札幌市",
                "函館市",
                "小樽市",
                "旭川市"
            ],
            correctAnswerIndex: 0,
            explanation: "北海道の県庁所在地は札幌市です。"
        ),
        QuizQuestion(
            question: "福岡県の県庁所在地はどこですか？",
            choices: [
                "北九州市",
                "福岡市",
                "久留米市",
                "佐賀市"
            ],
            correctAnswerIndex: 1,
            explanation: "福岡県の県庁所在地は福岡市です。"
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
            question: "沖縄県の県庁所在地はどこですか？",
            choices: [
                "那覇市",
                "宮古島市",
                "石垣市",
                "うるま市"
            ],
            correctAnswerIndex: 0,
            explanation: "沖縄県の県庁所在地は那覇市です。"
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
            question: "戦国時代に日本全国を巡りながら信仰を広めた僧侶は誰ですか？",
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai4, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Shakai4ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai4ListView(isPresenting: .constant(false))
    }
}
