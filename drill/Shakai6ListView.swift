//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Shakai6ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.related(
            question: "【関連付け】国の 仕組みと 働きが 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "国会", match: "法律を作る"),
                QuizMatchingPair(prompt: "内閣", match: "政治を進める"),
                QuizMatchingPair(prompt: "裁判所", match: "裁判を行う")
            ],
            choices: ["裁判を行う", "法律を作る", "政治を進める"],
            explanation: "国会は 立法、内閣は 行政、裁判所は 司法を 担っています。"
        ),

        QuizQuestion.classification(
            question: "【分類】日本国憲法で 定められた『権利』と『義務』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "表現の自由", match: "権利"),
                QuizMatchingPair(prompt: "納税", match: "義務"),
                QuizMatchingPair(prompt: "勤労", match: "義務")
            ],
            categories: ["権利", "義務"],
            explanation: "表現の自由は 権利、納税と 勤労は 義務です。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】出来事を 古い順に 並べましょう。",
            choices: ["東京オリンピックが 開かれる", "国際連合に 加盟する", "日本国憲法が 施行される", "消費税が 導入される"],
            orderedChoices: ["日本国憲法が 施行される", "国際連合に 加盟する", "東京オリンピックが 開かれる", "消費税が 導入される"],
            explanation: "1947年、1956年、1964年、1989年の順に 起こった出来事です。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】議員の 数が 多い順に 並べましょう。",
            choices: ["参議院", "衆議院"],
            rankedChoices: ["衆議院", "参議院"],
            explanation: "議員の 数は 衆議院の ほうが 多いです。"
        ),

        QuizQuestion.related(
            question: "【関連付け】国際機関と 働きが 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "WHO", match: "保健や医療"),
                QuizMatchingPair(prompt: "UNESCO", match: "教育や文化"),
                QuizMatchingPair(prompt: "UNICEF", match: "子どもの支援")
            ],
            choices: ["子どもの支援", "教育や文化", "保健や医療"],
            explanation: "WHOは 保健、UNESCOは 教育と文化、UNICEFは 子どもの支援に 関わります。"
        ),

        QuizQuestion.related(
            question: "【関連付け】地域名と そこに 含まれる国が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "アジア", match: "日本"),
                QuizMatchingPair(prompt: "ヨーロッパ", match: "フランス"),
                QuizMatchingPair(prompt: "アフリカ", match: "エジプト")
            ],
            choices: ["日本", "フランス", "エジプト"],
            explanation: "日本は アジア、フランスは ヨーロッパ、エジプトは アフリカに あります。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】国の 面積が 広い順に 並べましょう。",
            choices: ["カナダ", "中国", "ロシア"],
            rankedChoices: ["ロシア", "カナダ", "中国"],
            explanation: "面積が いちばん 広いのは ロシア、その次が カナダ、中国です。"
        ),

        QuizQuestion.related(
            question: "【関連付け】議院と 任期が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "衆議院", match: "4年"),
                QuizMatchingPair(prompt: "参議院", match: "6年")
            ],
            choices: ["4年", "6年"],
            explanation: "衆議院の 任期は 4年、参議院の 任期は 6年です。"
        ),

        QuizQuestion.related(
            question: "【関連付け】三権分立と 機関が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "立法", match: "国会"),
                QuizMatchingPair(prompt: "行政", match: "内閣"),
                QuizMatchingPair(prompt: "司法", match: "裁判所")
            ],
            choices: ["裁判所", "国会", "内閣"],
            explanation: "立法は 国会、行政は 内閣、司法は 裁判所が 担います。"
        ),

        QuizQuestion.classification(
            question: "【分類】国の働きを 立法・行政・司法で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "法律を 定める", match: "立法"),
                QuizMatchingPair(prompt: "政策を 進める", match: "行政"),
                QuizMatchingPair(prompt: "憲法に 合うか 判断する", match: "司法")
            ],
            categories: ["立法", "行政", "司法"],
            explanation: "法律を 定めるのは 立法、政策を 進めるのは 行政、憲法に 合うか 判断するのは 司法です。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】法律が できるまでの 流れを 並べましょう。",
            choices: ["公布される", "国会で 審議する", "法案を 提出する"],
            orderedChoices: ["法案を 提出する", "国会で 審議する", "公布される"],
            explanation: "法律は、法案を 提出してから 国会で 審議され、公布されます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】大陸の 面積が 広い順に 並べましょう。",
            choices: ["ヨーロッパ", "アフリカ", "アジア"],
            rankedChoices: ["アジア", "アフリカ", "ヨーロッパ"],
            explanation: "大陸の 面積は、アジア、アフリカ、ヨーロッパの順に 広いです。"
        ),

        QuizQuestion.related(
            question: "【関連付け】日本国憲法の 三原則と 内容が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "国民主権", match: "国民が 政治の 決定権を もつ"),
                QuizMatchingPair(prompt: "平和主義", match: "戦争を しない"),
                QuizMatchingPair(prompt: "基本的人権の尊重", match: "人としての 権利を 大切にする")
            ],
            choices: ["戦争を しない", "人としての 権利を 大切にする", "国民が 政治の 決定権を もつ"],
            explanation: "日本国憲法の三原則は、国民主権、平和主義、基本的人権の尊重です。"
        ),

        QuizQuestion.classification(
            question: "【分類】国際機関を 分野で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "WHO", match: "保健"),
                QuizMatchingPair(prompt: "UNESCO", match: "教育・文化"),
                QuizMatchingPair(prompt: "FAO", match: "食料・農業")
            ],
            categories: ["保健", "教育・文化", "食料・農業"],
            explanation: "WHOは 保健、UNESCOは 教育・文化、FAOは 食料・農業に 関わります。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】選挙の 流れを 並べましょう。",
            choices: ["開票する", "投票する", "立候補する"],
            orderedChoices: ["立候補する", "投票する", "開票する"],
            explanation: "選挙は 立候補してから 投票し、そのあと 開票します。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】国を 人口が 多い順に 並べましょう。",
            choices: ["アメリカ", "中国", "日本"],
            rankedChoices: ["中国", "アメリカ", "日本"],
            explanation: "人口が多い順に 中国、アメリカ、日本です。"
        ),

        QuizQuestion(
            question: "日本国憲法で定められている三大基本原則に含まれるのは次のうちどれですか？",
            choices: [
                "軍事力の行使",
                "天皇の統治権",
                "国際貿易の推進",
                "基本的人権の尊重"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法の三大基本原則には、国民主権、平和主義、そして基本的人権の尊重が含まれます。"
        ),

        QuizQuestion(
            question: "国際連合において、全加盟国が平等に参加する場は次のうちどれですか？",
            choices: [
                "安全保障理事会",
                "国際裁判所",
                "UNESCO",
                "国連総会"
            ],
            correctAnswerIndex: 3,
            explanation: "国連総会は、全加盟国が平等に参加して議論する場です。"
        ),

        QuizQuestion(
            question: "日本国憲法における第9条で規定されている内容は次のうちどれですか？",
            choices: [
                "国民主権",
                "天皇の役割",
                "地方自治",
                "戦争の放棄"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法第9条では、戦争の放棄と戦力の不保持が規定されています。"
        ),

        QuizQuestion(
            question: "国際連合の設立目的の一つは次のうちどれですか？",
            choices: [
                "貿易の促進",
                "軍事同盟の強化",
                "環境保護",
                "世界の平和と安全の維持"
            ],
            correctAnswerIndex: 3,
            explanation: "国際連合の設立目的の一つは、世界の平和と安全の維持です。"
        ),

        QuizQuestion(
            question: "国際連合の安全保障理事会における常任理事国の一つは次のうちどれですか？",
            choices: [
                "日本",
                "ドイツ",
                "インド",
                "中国"
            ],
            correctAnswerIndex: 3,
            explanation: "中国は国際連合の安全保障理事会の常任理事国の一つです。"
        ),

        QuizQuestion(
            question: "国際連合における事務総長を選出する手続きに関与する機関は次のうちどれですか？",
            choices: [
                "国際裁判所",
                "経済社会理事会",
                "国際労働機関",
                "安全保障理事会"
            ],
            correctAnswerIndex: 3,
            explanation: "国際連合の事務総長は、安全保障理事会の推薦を受けて国連総会で選出されます。"
        ),

        QuizQuestion(
            question: "日本国憲法において、天皇の地位について定めた条文は次のうちどれですか？",
            choices: [
                "第9条",
                "第92条",
                "第25条",
                "第1条"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法第1条では、天皇は日本国および日本国民統合の象徴とされています。"
        ),
        QuizQuestion(
            question: "国際連合において、国際的な法的紛争を裁く機関は次のうちどれですか？",
            choices: [
                "安全保障理事会",
                "国際通貨基金",
                "国連総会",
                "国際裁判所"
            ],
            correctAnswerIndex: 3,
            explanation: "国際裁判所は、国際的な法的紛争を解決する国連の機関です。"
        ),

        QuizQuestion(
            question: "国際連合の設立年は次のうちどれですか？",
            choices: [
                "1950年",
                "1939年",
                "1965年",
                "1945年"
            ],
            correctAnswerIndex: 3,
            explanation: "国際連合は1945年に設立されました。"
        ),

        QuizQuestion(
            question: "日本国憲法における『平和主義』の条文は次のうちどれですか？",
            choices: [
                "第1条",
                "第92条",
                "第25条",
                "第9条"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法第9条では、戦争の放棄と戦力の不保持が定められています。"
        ),

        QuizQuestion(
            question: "国際連合において、経済・社会問題を扱う主要機関は次のうちどれですか？",
            choices: [
                "安全保障理事会",
                "国際裁判所",
                "UNESCO",
                "経済社会理事会"
            ],
            correctAnswerIndex: 3,
            explanation: "経済社会理事会は、国際的な経済・社会問題を扱う国連の主要機関です。"
        ),

        QuizQuestion(
            question: "日本国憲法が公布されたのは次のうちどれですか？",
            choices: [
                "1945年8月15日",
                "1947年5月3日",
                "1950年1月1日",
                "1946年11月3日"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法は1946年11月3日に公布され、翌年5月3日に施行されました。"
        ),

        QuizQuestion(
            question: "国際連合の持続可能な開発目標（SDGs）に含まれるのは次のうちどれですか？",
            choices: [
                "軍事協力の強化",
                "国際貿易の促進",
                "経済発展の推進",
                "気候変動に具体的な対策を"
            ],
            correctAnswerIndex: 3,
            explanation: "SDGsの目標の一つは『気候変動に具体的な対策を』です。"
        ),

        QuizQuestion(
            question: "日本国憲法で保障されている基本的人権に含まれるのは次のうちどれですか？",
            choices: [
                "軍事行動の自由",
                "財産権の自由",
                "公共の福祉に反しない限りの自由",
                "信教の自由"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法では、信教の自由が国民に保障されています。"
        ),

        QuizQuestion(
            question: "日本国憲法において、国民主権の原則を表している条文は次のうちどれですか？",
            choices: [
                "第9条",
                "第25条",
                "第15条",
                "第1条"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法第1条では、国民主権の原則が定められています。"
        ),
        QuizQuestion(
            question: "日本国憲法で定められている『平和主義』を象徴する条文は次のうちどれですか？",
            choices: [
                "第1条",
                "第96条",
                "第9条",
                "第15条"
            ],
            correctAnswerIndex: 2,
            explanation: "日本国憲法第9条は、戦争の放棄を定めた平和主義の象徴です。"
        ),

        QuizQuestion(
            question: "国際連合において、平和維持活動を担当する機関は次のうちどれですか？",
            choices: [
                "国連総会",
                "国際裁判所",
                "安全保障理事会",
                "UNESCO"
            ],
            correctAnswerIndex: 2,
            explanation: "国際連合の安全保障理事会は、世界の平和と安全を維持する役割を担っています。"
        ),

        QuizQuestion(
            question: "日本国憲法において、国民に課されている義務に含まれないものは次のうちどれですか？",
            choices: [
                "納税の義務",
                "教育を受けさせる義務",
                "兵役の義務",
                "勤労の義務"
            ],
            correctAnswerIndex: 2,
            explanation: "日本国憲法には兵役の義務はありません。"
        ),

        QuizQuestion(
            question: "国際連合における持続可能な開発目標（SDGs）に含まれるのは次のうちどれですか？",
            choices: [
                "軍事同盟の強化",
                "全世界にインターネットを普及",
                "貧困をなくそう",
                "全ての人に自動車を提供しよう"
            ],
            correctAnswerIndex: 2,
            explanation: "SDGsの目標の一つは『貧困をなくそう』です。"
        ),

        QuizQuestion(
            question: "日本国憲法で定められている『三権分立』において、司法権を担うのは次のうちどれですか？",
            choices: [
                "国会",
                "内閣",
                "裁判所",
                "地方自治体"
            ],
            correctAnswerIndex: 2,
            explanation: "日本国憲法では、裁判所が司法権を担当しています。"
        ),

        QuizQuestion(
            question: "国際連合における常任理事国ではない国は次のうちどれですか？",
            choices: [
                "中国",
                "アメリカ",
                "日本",
                "ロシア"
            ],
            correctAnswerIndex: 2,
            explanation: "日本は国際連合の加盟国ですが、常任理事国ではありません。"
        ),

        QuizQuestion(
            question: "日本国憲法が公布された日は次のうちどれですか？",
            choices: [
                "1945年8月15日",
                "1947年5月3日",
                "1946年11月3日",
                "1950年1月1日"
            ],
            correctAnswerIndex: 2,
            explanation: "日本国憲法は1946年11月3日に公布され、翌年施行されました。"
        ),

        QuizQuestion(
            question: "国際連合における事務総長を選出する機関は次のうちどれですか？",
            choices: [
                "国連総会",
                "経済社会理事会",
                "安全保障理事会",
                "国際労働機関"
            ],
            correctAnswerIndex: 2,
            explanation: "安全保障理事会は事務総長を推薦し、国連総会で承認されます。"
        ),

        QuizQuestion(
            question: "日本国憲法において、地方自治に関する規定があるのは次のうちどれですか？",
            choices: [
                "第9条",
                "第25条",
                "第92条",
                "第1条"
            ],
            correctAnswerIndex: 2,
            explanation: "地方自治に関する規定は日本国憲法第92条にあります。"
        ),

        QuizQuestion(
            question: "日本国憲法で保障されている『表現の自由』に該当するのは次のうちどれですか？",
            choices: [
                "財産権の自由",
                "軍事行動の自由",
                "言論・出版・集会・結社の自由",
                "投票の自由"
            ],
            correctAnswerIndex: 2,
            explanation: "日本国憲法では、言論、出版、集会、結社の自由が表現の自由として保障されています。"
        ),
        QuizQuestion(
            question: "日本国憲法において、国民の義務として明記されていないものは次のうちどれですか？",
            choices: [
                "勤労の義務",
                "教育を受けさせる義務",
                "兵役の義務",
                "納税の義務"
            ],
            correctAnswerIndex: 2,
            explanation: "日本国憲法には兵役の義務は含まれていません。"
        ),

        QuizQuestion(
            question: "国際連合の主要機関で、国際的な法的紛争を解決するのは次のうちどれですか？",
            choices: [
                "安全保障理事会",
                "国際裁判所",
                "経済社会理事会",
                "UNESCO"
            ],
            correctAnswerIndex: 1,
            explanation: "国際裁判所は国際的な法的紛争を解決する役割を担っています。"
        ),

        QuizQuestion(
            question: "日本国憲法で定められている『三権分立』のうち、立法を担当するのは次のうちどれですか？",
            choices: [
                "裁判所",
                "国会",
                "内閣",
                "地方自治体"
            ],
            correctAnswerIndex: 1,
            explanation: "日本国憲法では、国会が立法権を担当しています。"
        ),

        QuizQuestion(
            question: "国際連合の常任理事国ではない国は次のうちどれですか？",
            choices: [
                "ロシア",
                "フランス",
                "日本",
                "中国"
            ],
            correctAnswerIndex: 2,
            explanation: "日本は国際連合の加盟国ですが、常任理事国ではありません。"
        ),

        QuizQuestion(
            question: "日本国憲法において、平和主義を象徴する条文は次のうちどれですか？",
            choices: [
                "第1条",
                "第9条",
                "第96条",
                "第15条"
            ],
            correctAnswerIndex: 1,
            explanation: "日本国憲法第9条は、戦争の放棄を定めた平和主義の象徴です。"
        ),

        QuizQuestion(
            question: "国際連合の持続可能な開発目標（SDGs）のうち、気候変動に関する目標は次のうちどれですか？",
            choices: [
                "貧困をなくそう",
                "気候変動に具体的な対策を",
                "全ての人に教育を",
                "ジェンダー平等を実現しよう"
            ],
            correctAnswerIndex: 1,
            explanation: "SDGsの目標の一つには、『気候変動に具体的な対策を』があります。"
        ),

        QuizQuestion(
            question: "日本国憲法が公布されたのは次のうちどれですか？",
            choices: [
                "1945年8月15日",
                "1946年11月3日",
                "1947年5月3日",
                "1950年1月1日"
            ],
            correctAnswerIndex: 1,
            explanation: "日本国憲法は1946年11月3日に公布されました。"
        ),

        QuizQuestion(
            question: "国際連合における国連総会の役割は次のうちどれですか？",
            choices: [
                "軍事問題の解決",
                "全加盟国が議論し、決定を行う場",
                "国際裁判の判決",
                "人権問題の監視"
            ],
            correctAnswerIndex: 1,
            explanation: "国連総会は全加盟国が参加し、議論と決定を行う場です。"
        ),

        QuizQuestion(
            question: "日本が国際連合に加盟したのは次のうち何年ですか？",
            choices: [
                "1945年",
                "1956年",
                "1960年",
                "1970年"
            ],
            correctAnswerIndex: 1,
            explanation: "日本は1956年に国際連合に加盟しました。"
        ),

        QuizQuestion(
            question: "日本国憲法において、地方自治を保障する条文は次のうちどれですか？",
            choices: [
                "第9条",
                "第25条",
                "第92条",
                "第1条"
            ],
            correctAnswerIndex: 2,
            explanation: "日本国憲法第92条には、地方自治が明記されています。"
        ),
        QuizQuestion(
            question: "日本国憲法において、国会が持つ唯一の権限は次のうちどれですか？",
            choices: [
                "立法権",
                "行政権",
                "司法権",
                "軍事権"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、国会は唯一の立法機関とされています。"
        ),

        QuizQuestion(
            question: "国際連合の平和維持活動を表す略称は次のうちどれですか？",
            choices: [
                "PKO",
                "WHO",
                "UNESCO",
                "IMF"
            ],
            correctAnswerIndex: 0,
            explanation: "PKOは国際連合の平和維持活動（Peacekeeping Operations）の略称です。"
        ),

        QuizQuestion(
            question: "日本国憲法で定められている国民の義務として含まれるのは次のうちどれですか？",
            choices: [
                "勤労の義務",
                "投票の義務",
                "兵役の義務",
                "自由の義務"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、国民に勤労の義務が定められています。"
        ),

        QuizQuestion(
            question: "国際連合において、常任理事国ではない国は次のうちどれですか？",
            choices: [
                "日本",
                "アメリカ",
                "ロシア",
                "中国"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は国際連合の加盟国ですが、安全保障理事会の常任理事国ではありません。"
        ),

        QuizQuestion(
            question: "日本国憲法において、戦争の放棄を定めた条文は次のうちどれですか？",
            choices: [
                "第9条",
                "第1条",
                "第15条",
                "第25条"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法第9条では、戦争の放棄が明記されています。"
        ),

        QuizQuestion(
            question: "国際連合において、経済社会理事会が担当する分野は次のうちどれですか？",
            choices: [
                "経済・社会問題",
                "軍事問題",
                "法的紛争",
                "平和維持活動"
            ],
            correctAnswerIndex: 0,
            explanation: "経済社会理事会は、経済および社会問題を担当しています。"
        ),

        QuizQuestion(
            question: "日本国憲法が公布されたのは次のうちどれですか？",
            choices: [
                "1946年11月3日",
                "1945年8月15日",
                "1950年1月1日",
                "1947年5月3日"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法は1946年11月3日に公布されました。"
        ),

        QuizQuestion(
            question: "国際連合における事務総長を選出する機関は次のうちどれですか？",
            choices: [
                "安全保障理事会",
                "国際裁判所",
                "国連総会",
                "国際通貨基金"
            ],
            correctAnswerIndex: 0,
            explanation: "国際連合の事務総長は安全保障理事会の推薦を経て、国連総会で選出されます。"
        ),

        QuizQuestion(
            question: "日本国憲法で規定されている『三権分立』において、行政権を担うのは次のうちどれですか？",
            choices: [
                "内閣",
                "国会",
                "裁判所",
                "地方自治体"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、内閣が行政権を担当しています。"
        ),

        QuizQuestion(
            question: "日本が国際連合に加盟したのは次のうち何年ですか？",
            choices: [
                "1956年",
                "1945年",
                "1960年",
                "1975年"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は1956年に国際連合に加盟しました。"
        ),
        QuizQuestion(
            question: "日本国憲法において、憲法改正の手続きを定めた条文は次のうちどれですか？",
            choices: [
                "第96条",
                "第9条",
                "第1条",
                "第25条"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法第96条は、憲法改正の手続きを規定しています。"
        ),

        QuizQuestion(
            question: "国際連合における国連総会の役割は次のうちどれですか？",
            choices: [
                "全加盟国が参加して議論し、決定を行う場",
                "安全保障理事会の拒否権を監視する機関",
                "平和維持活動を指揮する部門",
                "国際裁判所の判決を決定する場"
            ],
            correctAnswerIndex: 0,
            explanation: "国連総会は、全加盟国が参加し、さまざまな国際問題について議論し、決定を行う場です。"
        ),

        QuizQuestion(
            question: "日本国憲法で定められている『平和主義』を象徴する条文は次のうちどれですか？",
            choices: [
                "第9条",
                "第1条",
                "第25条",
                "第96条"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法第9条は、平和主義を象徴し、戦争の放棄を定めています。"
        ),

        QuizQuestion(
            question: "国際連合の主要機関で、国際的な紛争の法的解決を担当するのは次のうちどれですか？",
            choices: [
                "国際裁判所",
                "安全保障理事会",
                "国連総会",
                "世界保健機関"
            ],
            correctAnswerIndex: 0,
            explanation: "国際裁判所は、国際的な紛争を法的に解決する役割を持つ国際連合の主要機関です。"
        ),

        QuizQuestion(
            question: "日本国憲法で定められている国民の基本的な義務の一つは次のうちどれですか？",
            choices: [
                "納税の義務",
                "言論の自由",
                "表現の自由",
                "投票の義務"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、国民に納税の義務が課せられています。"
        ),

        QuizQuestion(
            question: "国際連合における常任理事国の一つでない国は次のうちどれですか？",
            choices: [
                "ドイツ",
                "中国",
                "フランス",
                "ロシア"
            ],
            correctAnswerIndex: 0,
            explanation: "ドイツは国際連合の加盟国ですが、常任理事国ではありません。"
        ),

        QuizQuestion(
            question: "日本国憲法において、基本的人権の尊重を定めた条文は次のうちどれですか？",
            choices: [
                "第11条",
                "第9条",
                "第1条",
                "第25条"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法第11条では、国民の基本的人権が不可侵の権利として保障されています。"
        ),

        QuizQuestion(
            question: "国際連合の持続可能な開発目標（SDGs）の一環として取り組んでいる目標は次のうちどれですか？",
            choices: [
                "気候変動に具体的な対策を",
                "国際軍事協力の促進",
                "全世界でインターネットの普及",
                "すべての人に自動車を提供"
            ],
            correctAnswerIndex: 0,
            explanation: "SDGsの目標の一つには、『気候変動に具体的な対策を』が含まれています。"
        ),

        QuizQuestion(
            question: "日本国憲法において、国民主権の原則を最もよく表している条文は次のうちどれですか？",
            choices: [
                "第1条",
                "第9条",
                "第15条",
                "第25条"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法第1条は、国民主権の原則を最もよく表しています。"
        ),

        QuizQuestion(
            question: "日本が国際連合に加盟したのは次のうちどれですか？",
            choices: [
                "1956年",
                "1945年",
                "1960年",
                "1970年"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は1956年に国際連合に加盟しました。"
        ),
        QuizQuestion(
            question: "日本国憲法において、天皇の地位を定めた条文は次のうちどれですか？",
            choices: [
                "第1条",
                "第9条",
                "第15条",
                "第25条"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法第1条は、天皇を『日本国および日本国民統合の象徴』と定めています。"
        ),

        QuizQuestion(
            question: "国際連合の加盟国数が1年で最も多く増えた年は次のうちどれですか？",
            choices: [
                "1945年",
                "1956年",
                "1990年",
                "1960年"
            ],
            correctAnswerIndex: 3,
            explanation: "1960年は「アフリカの年」と呼ばれ、多くのアフリカ諸国が独立して国際連合に加盟しました。"
        ),

        QuizQuestion(
            question: "日本国憲法で定められている『三権分立』において、司法権を担当するのはどれですか？",
            choices: [
                "裁判所",
                "国会",
                "内閣",
                "地方自治体"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、裁判所が司法権を担当しています。"
        ),

        QuizQuestion(
            question: "国際連合において、世界の平和と安全を維持する責任を負う主要機関は次のうちどれですか？",
            choices: [
                "安全保障理事会",
                "国際労働機関",
                "国連総会",
                "国際通貨基金"
            ],
            correctAnswerIndex: 0,
            explanation: "安全保障理事会は、国際連合の主要機関で、平和と安全を維持する役割を持っています。"
        ),

        QuizQuestion(
            question: "日本国憲法において、国民が負う義務に含まれないのは次のうちどれですか？",
            choices: [
                "兵役の義務",
                "納税の義務",
                "勤労の義務",
                "教育を受けさせる義務"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法には兵役の義務は含まれていません。"
        ),

        QuizQuestion(
            question: "国際連合の事務総長を選出する機関は次のうちどれですか？",
            choices: [
                "国連総会",
                "安全保障理事会",
                "経済社会理事会",
                "国際裁判所"
            ],
            correctAnswerIndex: 1,
            explanation: "事務総長は安全保障理事会の推薦を受け、国連総会で選出されます。"
        ),

        QuizQuestion(
            question: "日本国憲法が施行されたのは次のうちどれですか？",
            choices: [
                "1947年5月3日",
                "1945年8月15日",
                "1950年1月1日",
                "1946年11月3日"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法は1947年5月3日に施行されました。"
        ),

        QuizQuestion(
            question: "国際連合の持続可能な開発目標（SDGs）に含まれる項目は次のうちどれですか？",
            choices: [
                "貧困をなくそう",
                "国際貿易を促進しよう",
                "軍事同盟を結ぼう",
                "全世界にインターネットを普及させよう"
            ],
            correctAnswerIndex: 0,
            explanation: "SDGsの目標の一つには、『貧困をなくそう』が含まれています。"
        ),

        QuizQuestion(
            question: "日本国憲法で定められている基本的人権の尊重は、次のうちどれに該当しますか？",
            choices: [
                "すべての国民が持つ固有の権利",
                "政府によって認められる権利",
                "内閣によって与えられる権利",
                "国会によって制限される権利"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、基本的人権はすべての国民が持つ固有の権利として保障されています。"
        ),

        QuizQuestion(
            question: "日本国憲法において、国民の義務として明記されているものは次のうちどれですか？",
            choices: [
                "納税の義務",
                "投票の義務",
                "兵役の義務",
                "言論の自由"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、納税の義務が国民の義務として定められています。"
        ),
        QuizQuestion(
            question: "日本国憲法の基本原則の一つである平和主義を定めた条文はどれですか？",
            choices: [
                "第9条",
                "第1条",
                "第15条",
                "第25条"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法第9条では、戦争の放棄と戦力の不保持を定めています。"
        ),

        QuizQuestion(
            question: "国際連合の経済社会理事会が担当する分野は次のうちどれですか？",
            choices: [
                "経済、社会問題",
                "軍事活動",
                "環境保護",
                "平和維持活動"
            ],
            correctAnswerIndex: 0,
            explanation: "経済社会理事会は経済、社会、文化的な問題に取り組む国際連合の機関です。"
        ),

        QuizQuestion(
            question: "日本国憲法に基づき、最高裁判所が有する権限は次のうちどれですか？",
            choices: [
                "法律の違憲審査権",
                "予算の承認",
                "法律の制定",
                "内閣の指導"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法は最高裁判所に法律の違憲審査権を認めています。"
        ),

        QuizQuestion(
            question: "国際連合の主要機関の一つで、加盟国の間の紛争を解決するための裁判を行うのはどれですか？",
            choices: [
                "国際裁判所",
                "国連総会",
                "国際通貨基金",
                "経済社会理事会"
            ],
            correctAnswerIndex: 0,
            explanation: "国際裁判所は加盟国間の紛争を法的に解決するための国際連合の機関です。"
        ),

        QuizQuestion(
            question: "日本国憲法において、国民が持つ三大義務の一つに含まれないのは次のうちどれですか？",
            choices: [
                "納税の義務",
                "勤労の義務",
                "兵役の義務",
                "教育を受けさせる義務"
            ],
            correctAnswerIndex: 2,
            explanation: "日本国憲法には兵役の義務は含まれていません。"
        ),

        QuizQuestion(
            question: "国際連合の安全保障理事会における常任理事国でない国は次のうちどれですか？",
            choices: [
                "日本",
                "アメリカ",
                "中国",
                "フランス"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は国際連合の加盟国ですが、安全保障理事会の常任理事国ではありません。"
        ),

        QuizQuestion(
            question: "日本国憲法が公布された年は次のうちどれですか？",
            choices: [
                "1946年",
                "1945年",
                "1950年",
                "1952年"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法は1946年に公布され、1947年に施行されました。"
        ),

        QuizQuestion(
            question: "国際連合における人権問題を扱う主要機関は次のうちどれですか？",
            choices: [
                "人権理事会",
                "経済社会理事会",
                "国際労働機関",
                "国際裁判所"
            ],
            correctAnswerIndex: 0,
            explanation: "国際連合の人権理事会は、世界中の人権問題を扱う主要機関です。"
        ),

        QuizQuestion(
            question: "日本国憲法における国民主権の原則を最もよく表しているのは次のうちどれですか？",
            choices: [
                "国会が国権の最高機関であること",
                "天皇が象徴であること",
                "憲法第9条",
                "基本的人権の尊重"
            ],
            correctAnswerIndex: 0,
            explanation: "国会が国権の最高機関であることは、国民主権の原則を最もよく表しています。"
        ),

        QuizQuestion(
            question: "日本が国際連合に加盟したのは次のうち何年ですか？",
            choices: [
                "1956年",
                "1945年",
                "1960年",
                "1970年"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は1956年に国際連合に加盟しました。"
        ),
        QuizQuestion(
            question: "日本国憲法において、国会が持つ唯一の権限は何ですか？",
            choices: [
                "立法権",
                "行政権",
                "司法権",
                "軍事権"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、国会は唯一の立法機関として定められています。"
        ),

        QuizQuestion(
            question: "国際連合の主要機関で、世界の平和と安全を維持する役割を持つのはどれですか？",
            choices: [
                "安全保障理事会",
                "国連総会",
                "経済社会理事会",
                "国際裁判所"
            ],
            correctAnswerIndex: 0,
            explanation: "国際連合の安全保障理事会は、世界の平和と安全を維持する役割を担っています。"
        ),

        QuizQuestion(
            question: "日本国憲法で天皇の役割を規定している条文はどれですか？",
            choices: [
                "第1条",
                "第9条",
                "第15条",
                "第25条"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法第1条は、天皇を『日本国の象徴』と定めています。"
        ),

        QuizQuestion(
            question: "国際連合において、平和維持活動（PKO）を担当する部門はどれですか？",
            choices: [
                "安全保障理事会",
                "経済社会理事会",
                "国際労働機関",
                "国連総会"
            ],
            correctAnswerIndex: 0,
            explanation: "平和維持活動は国際連合の安全保障理事会の下で行われます。"
        ),

        QuizQuestion(
            question: "日本国憲法で、国民が持つ基本的人権が尊重されると規定されているのは次のうちどれですか？",
            choices: [
                "国民の固有の権利",
                "政府によって付与される権利",
                "裁判所が決定する権利",
                "法律によって制限される権利"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、基本的人権は国民の固有の権利として尊重されると定められています。"
        ),

        QuizQuestion(
            question: "国際連合の持続可能な開発目標（SDGs）の17の目標のうち、次のうちどれが含まれていますか？",
            choices: [
                "貧困をなくそう",
                "軍事同盟の拡大",
                "国際貿易の自由化",
                "テクノロジーの発展"
            ],
            correctAnswerIndex: 0,
            explanation: "SDGsの目標には、『貧困をなくそう』が含まれています。"
        ),

        QuizQuestion(
            question: "日本が国際連合に加盟したのは次のうち何年ですか？",
            choices: [
                "1956年",
                "1945年",
                "1970年",
                "1965年"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は1956年に国際連合に加盟しました。"
        ),

        QuizQuestion(
            question: "日本国憲法において、環境保護に関する条文はどれですか？",
            choices: [
                "存在しない",
                "第25条",
                "第9条",
                "第35条"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法には環境保護に関する直接的な条文は存在しません。"
        ),

        QuizQuestion(
            question: "国際連合において、事務総長を選出するのはどの機関ですか？",
            choices: [
                "国連総会",
                "安全保障理事会",
                "経済社会理事会",
                "国際裁判所"
            ],
            correctAnswerIndex: 1,
            explanation: "国際連合の事務総長は安全保障理事会の推薦を経て、国連総会で選出されます。"
        ),

        QuizQuestion(
            question: "日本国憲法で保障されている「表現の自由」に該当するものは次のうちどれですか？",
            choices: [
                "言論、出版、集会、結社の自由",
                "個人の財産を自由に使う権利",
                "国家の指示に従う義務",
                "国際貿易に参加する権利"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、表現の自由として言論、出版、集会、結社の自由が保障されています。"
        ),
        QuizQuestion(
            question: "日本国憲法において、国民が負う三大義務の一つに該当しないものはどれですか？",
            choices: [
                "勤労の義務",
                "教育を受けさせる義務",
                "納税の義務",
                "国防の義務"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法には国防の義務は含まれていません。"
        ),

        QuizQuestion(
            question: "国際連合の安全保障理事会での決定事項が採択されるために必要な条件は次のうちどれですか？",
            choices: [
                "全会一致",
                "常任理事国5か国すべての賛成",
                "拒否権の行使なし",
                "過半数の賛成"
            ],
            correctAnswerIndex: 2,
            explanation: "常任理事国のいずれかが拒否権を行使すると決議は採択されません。"
        ),

        QuizQuestion(
            question: "日本国憲法が公布されたのはいつですか？",
            choices: [
                "1946年11月3日",
                "1945年8月15日",
                "1947年5月3日",
                "1950年1月1日"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法は1946年11月3日に公布され、翌年に施行されました。"
        ),

        QuizQuestion(
            question: "国際連合の機関の一つで、経済協力と開発を担当するのはどれですか？",
            choices: [
                "UNESCO",
                "UNICEF",
                "IMF",
                "OECD"
            ],
            correctAnswerIndex: 3,
            explanation: "OECDは経済協力と開発を目的とした国際組織です。"
        ),

        QuizQuestion(
            question: "日本国憲法における第9条は何を規定していますか？",
            choices: [
                "戦争の放棄",
                "財産権の保障",
                "言論の自由",
                "天皇の地位"
            ],
            correctAnswerIndex: 0,
            explanation: "第9条では戦争の放棄が規定されており、日本は戦力を保持しないと定めています。"
        ),

        QuizQuestion(
            question: "国際連合の一環として活動しているUNICEFが主に支援している対象は次のうちどれですか？",
            choices: [
                "子供",
                "難民",
                "環境保護活動",
                "平和維持活動"
            ],
            correctAnswerIndex: 0,
            explanation: "UNICEFは世界中の子供たちを支援する国際機関です。"
        ),

        QuizQuestion(
            question: "日本が国際連合に加盟したのは第二次世界大戦後の何年ですか？",
            choices: [
                "1956年",
                "1945年",
                "1960年",
                "1950年"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は1956年に国際連合に加盟しました。"
        ),

        QuizQuestion(
            question: "日本国憲法において、基本的人権の尊重はどのように規定されていますか？",
            choices: [
                "国民固有の権利として尊重される",
                "政府によって付与される",
                "法によって制限される",
                "個人の自由に依存する"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、基本的人権は国民固有の権利として尊重されると明記されています。"
        ),

        QuizQuestion(
            question: "国際連合の総会で全加盟国が一票を持つ制度をなんと呼びますか？",
            choices: [
                "一国一票制度",
                "多数決制度",
                "全会一致制度",
                "投票権平等制度"
            ],
            correctAnswerIndex: 0,
            explanation: "国際連合総会では一国一票制度が採用されています。"
        ),

        QuizQuestion(
            question: "日本国憲法における地方自治に関する規定は何条にありますか？",
            choices: [
                "第92条",
                "第9条",
                "第1条",
                "第25条"
            ],
            correctAnswerIndex: 0,
            explanation: "地方自治に関する規定は日本国憲法第92条に定められています。"
        ),
        QuizQuestion(
            question: "日本国憲法で、保護者が子どもに教育を受けさせる義務（無償の普通教育）は、いつまで課されていますか？",
            choices: [
                "15歳",
                "18歳",
                "20歳",
                "義務教育終了まで"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法では、保護者が子どもに義務教育を無償で受けさせる義務が、義務教育終了まで課されています（教育を受ける権利そのものには年齢の制限はありません）。"
        ),

        QuizQuestion(
            question: "国際連合の主要な機関の一つで、国際的な紛争を裁く機関はどれですか？",
            choices: [
                "国際裁判所",
                "世界保健機関",
                "安全保障理事会",
                "国連教育科学文化機関"
            ],
            correctAnswerIndex: 0,
            explanation: "国際裁判所は国際的な紛争を裁く国際連合の主要機関の一つです。"
        ),

        QuizQuestion(
            question: "日本国憲法において、平和主義を象徴する条文は何条ですか？",
            choices: [
                "第1条",
                "第9条",
                "第10条",
                "第12条"
            ],
            correctAnswerIndex: 1,
            explanation: "第9条は日本国憲法における平和主義を象徴する条文です。"
        ),

        QuizQuestion(
            question: "国際連合の加盟国の中で、最も多くの平和維持活動（PKO）に参加している国はどれですか？",
            choices: [
                "アメリカ",
                "インド",
                "フランス",
                "日本"
            ],
            correctAnswerIndex: 1,
            explanation: "インドは国際連合の平和維持活動（PKO）に多くの兵力を提供しています。"
        ),

        QuizQuestion(
            question: "日本国憲法の三大原則に含まれるのは次のうちどれですか？",
            choices: [
                "基本的人権の尊重",
                "経済の自由化",
                "国際貿易の推進",
                "環境保護の義務"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法の三大原則には『基本的人権の尊重』が含まれています。"
        ),

        QuizQuestion(
            question: "国際連合の設立目的に含まれないものはどれですか？",
            choices: [
                "世界の平和と安全の維持",
                "貧困削減",
                "戦争の防止",
                "国際貿易の拡大"
            ],
            correctAnswerIndex: 3,
            explanation: "国際連合は貿易の拡大を目的として設立されていません。"
        ),

        QuizQuestion(
            question: "日本国憲法が施行された日付は次のうちどれですか？",
            choices: [
                "1947年5月3日",
                "1945年8月15日",
                "1950年1月1日",
                "1949年10月10日"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法は1947年5月3日に施行されました。"
        ),

        QuizQuestion(
            question: "国際連合の持続可能な開発目標（SDGs）で目指していることは次のうちどれですか？",
            choices: [
                "全ての人に健康と福祉を",
                "国際貿易を促進する",
                "軍事同盟を結ぶ",
                "全世界の税制を統一する"
            ],
            correctAnswerIndex: 0,
            explanation: "SDGsは『全ての人に健康と福祉を』など、持続可能な社会を目指しています。"
        ),

        QuizQuestion(
            question: "日本国憲法において、地方自治を尊重することを定めた条文はどれですか？",
            choices: [
                "第92条",
                "第9条",
                "第1条",
                "第25条"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法第92条では地方自治の尊重が定められています。"
        ),

        QuizQuestion(
            question: "第二次世界大戦後に日本が行った経済成長の一環で、多くの国が注目した政策は次のうちどれですか？",
            choices: [
                "高度経済成長政策",
                "新自由主義政策",
                "社会主義計画経済",
                "国際通貨基金（IMF）加入"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は戦後、高度経済成長政策を通じて急速に発展し、多くの国が注目しました。"
        ),
        QuizQuestion(
            question: "日本国憲法が国民に保障している権利はどれですか？",
            choices: [
                "財産権",
                "兵役義務",
                "戦争の権利",
                "刑罰の免除"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、財産権を含む基本的人権が国民に保障されています。"
        ),

        QuizQuestion(
            question: "国際連合の事務総長を選出する機関はどれですか？",
            choices: [
                "安全保障理事会",
                "国連総会",
                "常任理事国",
                "経済社会理事会"
            ],
            correctAnswerIndex: 1,
            explanation: "国連の事務総長は国連総会で選出されます。"
        ),

        QuizQuestion(
            question: "日本国憲法で定められている基本的な義務はどれですか？",
            choices: [
                "納税の義務",
                "戦争の義務",
                "投票の義務",
                "出兵の義務"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法は、国民に納税の義務を定めています。"
        ),

        QuizQuestion(
            question: "国際連合の安全保障理事会において、常任理事国が持っている特別な権利は何ですか？",
            choices: [
                "拒否権",
                "賛成票権",
                "財政管理権",
                "投票権の2倍"
            ],
            correctAnswerIndex: 0,
            explanation: "安全保障理事会の常任理事国は、決議に対して拒否権を持っています。"
        ),

        QuizQuestion(
            question: "戦後の日本で占領政策を実施した国はどれですか？",
            choices: [
                "アメリカ",
                "ドイツ",
                "ソ連",
                "イギリス"
            ],
            correctAnswerIndex: 0,
            explanation: "戦後の日本はアメリカを中心とする連合国の占領下に置かれました。"
        ),

        QuizQuestion(
            question: "日本国憲法における『三大義務』の一つに該当するのはどれですか？",
            choices: [
                "勤労の義務",
                "投票の義務",
                "自由の義務",
                "環境保護の義務"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法における三大義務の一つは『勤労の義務』です。"
        ),

        QuizQuestion(
            question: "国際連合における平和維持活動を表す略称は何ですか？",
            choices: [
                "PKO",
                "WHO",
                "UNESCO",
                "IMF"
            ],
            correctAnswerIndex: 0,
            explanation: "国際連合の平和維持活動はPKO（Peacekeeping Operations）と呼ばれます。"
        ),

        QuizQuestion(
            question: "日本国憲法が定める天皇の地位はどれですか？",
            choices: [
                "日本国の象徴",
                "国の元首",
                "軍の指導者",
                "政府の最高責任者"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法では、天皇は『日本国の象徴』とされています。"
        ),

        QuizQuestion(
            question: "国際連合の総会で決議が採択されるためには、どの割合の賛成が必要ですか？",
            choices: [
                "3分の2",
                "過半数",
                "全会一致",
                "4分の3"
            ],
            correctAnswerIndex: 0,
            explanation: "国際連合の総会での重要な決議は、3分の2の賛成が必要です。"
        ),

        QuizQuestion(
            question: "日本が国際連合に加盟したのはいつですか？",
            choices: [
                "1956年",
                "1945年",
                "1960年",
                "1975年"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は1956年に国際連合に加盟しました。"
        ),
        QuizQuestion(
            question: "日本国憲法で定められている三権分立のうち、立法を担うのはどれですか？",
            choices: [
                "内閣",
                "裁判所",
                "国会",
                "地方自治体"
            ],
            correctAnswerIndex: 2,
            explanation: "立法は国会が担当し、法律を制定する役割を果たします。"
        ),

        QuizQuestion(
            question: "国際連合の常任理事国ではない国はどれですか？",
            choices: [
                "アメリカ",
                "日本",
                "中国",
                "ロシア"
            ],
            correctAnswerIndex: 1,
            explanation: "日本は国際連合の加盟国ですが、常任理事国ではありません。"
        ),

        QuizQuestion(
            question: "第二次世界大戦の終戦記念日はいつですか？",
            choices: [
                "8月15日",
                "9月1日",
                "12月7日",
                "5月8日"
            ],
            correctAnswerIndex: 0,
            explanation: "日本では、第二次世界大戦の終戦記念日は8月15日です。"
        ),

        QuizQuestion(
            question: "日本国憲法の第9条で定められていることは何ですか？",
            choices: [
                "天皇の役割",
                "平和主義",
                "国民の基本的人権",
                "三権分立"
            ],
            correctAnswerIndex: 1,
            explanation: "日本国憲法第9条は、平和主義を定め、戦争の放棄を明記しています。"
        ),

        QuizQuestion(
            question: "国際連合の設立年はいつですか？",
            choices: [
                "1945年",
                "1950年",
                "1939年",
                "1960年"
            ],
            correctAnswerIndex: 0,
            explanation: "国際連合は第二次世界大戦後の1945年に設立されました。"
        ),

        QuizQuestion(
            question: "日本国憲法で保障されている基本的人権のうち、次のうちどれが該当しますか？",
            choices: [
                "教育を受ける権利",
                "選挙権",
                "財産権",
                "信教の自由"
            ],
            correctAnswerIndex: 3,
            explanation: "信教の自由は、日本国憲法で保障されている基本的人権の一つです。"
        ),

        QuizQuestion(
            question: "第二次世界大戦後、ドイツが分割された年はいつですか？",
            choices: [
                "1949年",
                "1945年",
                "1955年",
                "1960年"
            ],
            correctAnswerIndex: 0,
            explanation: "ドイツは第二次世界大戦後の1949年に東ドイツと西ドイツに分割されました。"
        ),
        QuizQuestion(
            question: "日本国憲法が施行されたのはいつですか？",
            choices: [
                "1947年",
                "1945年",
                "1950年",
                "1955年"
            ],
            correctAnswerIndex: 0,
            explanation: "日本国憲法は1947年に施行されました。"
        ),

        QuizQuestion(
            question: "国際連合の目的はどれですか？",
            choices: [
                "世界の平和を守る",
                "国際貿易を促進する",
                "世界中に学校を作る",
                "難民を保護する"
            ],
            correctAnswerIndex: 0,
            explanation: "国際連合の主な目的は世界の平和と安全を守ることです。"
        ),

        QuizQuestion(
            question: "日本が第二次世界大戦で降伏した年はいつですか？",
            choices: [
                "1945年",
                "1939年",
                "1950年",
                "1965年"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は1945年に第二次世界大戦で降伏しました。"
        ),

        QuizQuestion(
        question: "1868年、新しい政府が政治の基本方針として示したものはどれですか？",
        choices: [
        "五箇条の御誓文",
        "武家諸法度",
        "御成敗式目",
        "生類憐みの令"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『五箇条の御誓文』です。1868年、新政府は広く会議を開いて政治を行うことなど、新しい国づくりの基本方針を示しました。"
        ),

        QuizQuestion(
        question: "政治について共通する考えや政策をもち、選挙で支持を得て政治の実現を目指す団体を何といいますか？",
        choices: [
        "労働組合",
        "政党",
        "裁判所",
        "町内会"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『政党』です。政党は、政治について共通する考えや政策をもつ人々が集まり、その実現を目指す団体です。"
        ),

        QuizQuestion(
        question: "国会に法律案を提出できるのは、次のうちどれですか？",
        choices: [
        "裁判所だけ",
        "地方議会だけ",
        "国会議員と内閣",
        "天皇だけ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『国会議員と内閣』です。法律案は、一定の要件を満たした国会議員のほか、内閣も国会に提出できます。"
        ),

        QuizQuestion(
        question: "内閣総理大臣が国務大臣に対して行えることはどれですか？",
        choices: [
        "国会議員の任期を自由に変える",
        "裁判官の判決を取り消す",
        "憲法を一人で改正する",
        "国務大臣を罷免する"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『国務大臣を罷免する』です。内閣総理大臣は国務大臣を任命し、必要に応じて罷免することができます。"
        ),

        QuizQuestion(
        question: "裁判の公開について、日本国憲法の考え方として正しいものはどれですか？",
        choices: [
        "裁判は原則として公開して行う",
        "すべての裁判を必ず非公開で行う",
        "裁判を公開するかどうかは警察だけが決める",
        "刑事裁判だけは裁判所の外で行う"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『裁判は原則として公開して行う』です。裁判を公開することは、公正な裁判を確保するための大切な原則です。"
        ),

        QuizQuestion(
        question: "日本国憲法の『すべて国民は、個人として尊重される』という考えを表す言葉はどれですか？",
        choices: [
        "地方自治",
        "個人の尊重",
        "議院内閣制",
        "三審制"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『個人の尊重』です。日本国憲法は、一人ひとりをかけがえのない個人として尊重する考えを大切にしています。"
        ),

        QuizQuestion(
        question: "エジプトを流れ、地中海へ注ぐ大河はどれですか？",
        choices: [
        "アマゾン川",
        "ミシシッピ川",
        "ナイル川",
        "ドナウ川"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『ナイル川』です。ナイル川はアフリカ北東部を流れ、エジプトを通って地中海へ注ぎます。"
        ),

        QuizQuestion(
        question: "開発途上国で現地の人々と生活しながら、自分の技術や経験を生かして協力する日本の代表的なボランティア制度はどれですか？",
        choices: [
        "国民審査",
        "国勢調査",
        "裁判員制度",
        "青年海外協力隊"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『青年海外協力隊』です。青年海外協力隊は、開発途上国などで現地の人々とともに活動し、技術や経験を生かして協力します。"
        ),

        QuizQuestion(
        question: "江戸時代、日本全国を歩いて測量し、精密な日本地図の作成につなげた人物はだれですか？",
        choices: [
        "伊能忠敬",
        "本居宣長",
        "前野良沢",
        "新井白石"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『伊能忠敬』です。伊能忠敬は全国各地を測量し、その成果をもとに精密な日本地図が作られました。"
        ),

        QuizQuestion(
        question: "選挙で、候補者や政党が当選後に実現すると有権者に約束する政策などを何といいますか？",
        choices: [
        "判決",
        "公約",
        "条約",
        "政令"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『公約』です。公約は、候補者や政党が選挙で有権者に示し、実現を目指す政策などの約束です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】国会が活動する一定の期間を ＿＿ といいます。",
        answer: "会期",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は『会期』です。国会は、召集されてから閉会するまでの会期の中で審議や議決を行います。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】内閣の重要政策について企画や調整などを行う、内閣に置かれた行政機関を ＿＿ といいます。",
        answer: "内閣府",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は『内閣府』です。内閣府は、内閣の重要政策について企画や調整などを行います。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】裁判員候補者は、市区町村の ＿＿ に登録された有権者の中から、くじで選ばれた人をもとに選ばれます。",
        answer: "選挙人名簿",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は『選挙人名簿』です。選挙人名簿に登録された有権者の中から、くじで選ばれた人をもとに裁判員候補者名簿が作られます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】日本国憲法で、生命・自由とともに追求する権利が尊重されると定められているものを ＿＿ といいます。",
        answer: "幸福追求権",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は『幸福追求権』です。日本国憲法では、生命、自由及び幸福追求に対する国民の権利を最大限尊重するとしています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】民主政治に関わる言葉と、その意味を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "多数決", match: "多くの賛成を得た意見を決定に生かす"),
        QuizMatchingPair(prompt: "少数意見の尊重", match: "少数の人の考えにも十分に耳を傾ける"),
        QuizMatchingPair(prompt: "世論", match: "社会の多くの人々がもつ意見"),
        QuizMatchingPair(prompt: "情報公開", match: "行政がもつ情報を国民に明らかにする")
        ],
        choices: ["社会の多くの人々がもつ意見", "行政がもつ情報を国民に明らかにする", "少数の人の考えにも十分に耳を傾ける", "多くの賛成を得た意見を決定に生かす"],
        explanation: "多数決では多くの賛成を得た意見を決定に生かしますが、少数意見にも耳を傾けることが大切です。世論は社会の多くの人々の意見、情報公開は行政情報を国民に明らかにすることです。"
        ),

        QuizQuestion.related(
        question: "【関連付け】国と、その国で使われている代表的な通貨を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "アメリカ合衆国", match: "ドル"),
        QuizMatchingPair(prompt: "イギリス", match: "ポンド"),
        QuizMatchingPair(prompt: "インド", match: "ルピー"),
        QuizMatchingPair(prompt: "タイ", match: "バーツ")
        ],
        choices: ["ルピー", "バーツ", "ドル", "ポンド"],
        explanation: "アメリカ合衆国はドル、イギリスはポンド、インドはルピー、タイはバーツが代表的な通貨です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】国際協力の方法と、その説明を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "技術協力", match: "専門家の派遣や研修などで技術や知識を伝える"),
        QuizMatchingPair(prompt: "無償資金協力", match: "返済を求めない資金で施設整備などを支援する"),
        QuizMatchingPair(prompt: "有償資金協力", match: "返済を前提とする資金を低い金利などで貸し付ける"),
        QuizMatchingPair(prompt: "国際緊急援助", match: "海外の大規模災害などで救助や物資支援を行う")
        ],
        choices: ["海外の大規模災害などで救助や物資支援を行う", "専門家の派遣や研修などで技術や知識を伝える", "返済を前提とする資金を低い金利などで貸し付ける", "返済を求めない資金で施設整備などを支援する"],
        explanation: "技術協力は人や研修を通した協力、無償資金協力は返済を求めない支援、有償資金協力は返済を前提とする資金協力、国際緊急援助は災害時などの緊急支援です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】国会の審議で使われる言葉と、その意味を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "質疑", match: "提出された案について質問し答弁を求める"),
        QuizMatchingPair(prompt: "討論", match: "採決の前に賛成や反対の意見を述べる"),
        QuizMatchingPair(prompt: "採決", match: "賛成や反対を明らかにして議院の意思を決める"),
        QuizMatchingPair(prompt: "修正", match: "提出された案の内容の一部を改める")
        ],
        choices: ["提出された案の内容の一部を改める", "賛成や反対を明らかにして議院の意思を決める", "提出された案について質問し答弁を求める", "採決の前に賛成や反対の意見を述べる"],
        explanation: "質疑では質問と答弁を行い、討論では採決前に賛成・反対の意見を述べます。採決で議院の意思を決め、必要に応じて案の内容を修正することもあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】裁判や刑事手続きに関わる仕事を、主に担当する機関に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "逮捕状を発付する", match: "裁判所"),
        QuizMatchingPair(prompt: "刑事裁判で判決を言い渡す", match: "裁判所"),
        QuizMatchingPair(prompt: "交番を設け、地域の安全を守る", match: "警察"),
        QuizMatchingPair(prompt: "被疑者を起訴するかどうか判断する", match: "検察")
        ],
        categories: ["裁判所", "警察", "検察"],
        explanation: "逮捕状の発付や判決は裁判所が行います。警察は地域の安全を守り犯罪を捜査し、検察は捜査したうえで起訴するかどうかを判断します。"
        ),

        QuizQuestion.classification(
        question: "【分類】国の行政の仕事を、主に担当する省に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "出入国在留管理などに関する行政", match: "法務省"),
        QuizMatchingPair(prompt: "国の予算や税制に関する行政", match: "財務省"),
        QuizMatchingPair(prompt: "道路・鉄道・港湾などに関する行政", match: "国土交通省"),
        QuizMatchingPair(prompt: "自衛隊の管理や国の防衛に関する行政", match: "防衛省")
        ],
        categories: ["法務省", "財務省", "国土交通省", "防衛省"],
        explanation: "出入国在留管理などは法務省、予算や税制は財務省、道路・鉄道・港湾などは国土交通省、自衛隊の管理や防衛は防衛省が主に担当します。"
        ),

        QuizQuestion.classification(
        question: "【分類】日本国憲法で保障される自由を、精神的自由・経済的自由・人身の自由に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "信教の自由", match: "精神的自由"),
        QuizMatchingPair(prompt: "表現の自由", match: "精神的自由"),
        QuizMatchingPair(prompt: "職業選択の自由", match: "経済的自由"),
        QuizMatchingPair(prompt: "奴隷的拘束や苦役からの自由", match: "人身の自由")
        ],
        categories: ["精神的自由", "経済的自由", "人身の自由"],
        explanation: "信教の自由と表現の自由は精神的自由、職業選択の自由は経済的自由、奴隷的拘束や苦役からの自由は人身の自由に分類されます。"
        ),

        QuizQuestion.chronological(
        question: "【年代順に並べる】鎌倉時代に関係する出来事を、古い順に並べましょう。",
        choices: ["承久の乱が起こる", "文永の役が起こる", "源頼朝が征夷大将軍になる", "源頼朝が守護・地頭を置くことを認められる"],
        orderedChoices: ["源頼朝が守護・地頭を置くことを認められる", "源頼朝が征夷大将軍になる", "承久の乱が起こる", "文永の役が起こる"],
        explanation: "守護・地頭を置くことが認められたのは1185年、源頼朝が征夷大将軍になったのは1192年、承久の乱は1221年、文永の役は1274年です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】衆議院が解散されてから、新しい国会で内閣総理大臣が指名されるまでの流れを並べましょう。",
        choices: ["国会が内閣総理大臣を指名する", "衆議院議員総選挙を行う", "衆議院が解散される", "総選挙の日から30日以内に国会が召集される"],
        orderedChoices: ["衆議院が解散される", "衆議院議員総選挙を行う", "総選挙の日から30日以内に国会が召集される", "国会が内閣総理大臣を指名する"],
        explanation: "衆議院が解散されると40日以内に総選挙が行われ、その選挙の日から30日以内に国会が召集されます。その国会で内閣総理大臣が指名されます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】政府が次の年度の予算案を国会へ提出するまでの大まかな流れを並べましょう。",
        choices: ["内閣が政府予算案を決定する", "各省庁が必要な経費を見積もる", "国会に予算案を提出する", "財務省が予算内容を調整する"],
        orderedChoices: ["各省庁が必要な経費を見積もる", "財務省が予算内容を調整する", "内閣が政府予算案を決定する", "国会に予算案を提出する"],
        explanation: "各省庁が必要な経費を見積もり、財務省が全体を調整します。その後、内閣が政府予算案を決定し、国会へ提出します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】民事裁判が第一審の判決まで進む場合の大まかな流れを並べましょう。",
        choices: ["裁判所が判決を言い渡す", "原告が裁判所に訴状を提出する", "原告と被告が主張や証拠を示す", "裁判所が被告に訴状などを送る"],
        orderedChoices: ["原告が裁判所に訴状を提出する", "裁判所が被告に訴状などを送る", "原告と被告が主張や証拠を示す", "裁判所が判決を言い渡す"],
        explanation: "民事裁判では、原告が訴状を提出し、裁判所から被告へ訴状などが送られます。その後、双方が主張や証拠を示し、判決まで進む場合は裁判所が判決を言い渡します。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】海洋を、面積が広い順に並べましょう。",
        choices: ["インド洋", "北極海", "太平洋", "大西洋"],
        rankedChoices: ["太平洋", "大西洋", "インド洋", "北極海"],
        explanation: "この4つの海洋を面積が広い順に並べると、太平洋、大西洋、インド洋、北極海となります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】歴史上の人物を、活躍した時期が古い順に並べましょう。",
        choices: ["杉田玄白", "大隈重信", "藤原道長", "足利尊氏"],
        rankedChoices: ["藤原道長", "足利尊氏", "杉田玄白", "大隈重信"],
        explanation: "藤原道長は平安時代、足利尊氏は鎌倉時代末から室町時代初め、杉田玄白は江戸時代、大隈重信は明治時代を中心に活躍しました。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】各地区の有権者数と投票者数を見て、投票率が最も高い地区を答えましょう。",
        answer: "桜地区",
        acceptableAnswers: ["桜"],
        referenceTitle: "A市の地区別投票状況",
        referenceRows: [
        QuizReferenceRow(label: "青葉地区", value: "有権者500人・投票者350人"),
        QuizReferenceRow(label: "若葉地区", value: "有権者800人・投票者520人"),
        QuizReferenceRow(label: "桜地区", value: "有権者600人・投票者450人"),
        QuizReferenceRow(label: "緑地区", value: "有権者400人・投票者260人")
        ],
        explanation: "投票率は、青葉地区70％、若葉地区65％、桜地区75％、緑地区65％です。最も高いのは『桜地区』です。"
        ),

        QuizQuestion(
        question: "明治政府が、土地の所有者に地券を発行し、地価をもとに税を現金で納めさせるようにした改革はどれですか？",
        choices: [
        "学制",
        "徴兵令",
        "地租改正",
        "廃藩置県"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『地租改正』です。明治政府は土地の所有者に地券を発行し、地価をもとに土地の税を現金で納める仕組みに改めました。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】明治政府が、産業を発展させて国を豊かにし、軍事力も強くしようとした方針を ＿＿ といいます。",
        answer: "富国強兵",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は『富国強兵』です。明治政府は産業を育てて国を豊かにし、近代的な軍隊を整えようとしました。"
        ),

        QuizQuestion.related(
        question: "【関連付け】歴史資料や文化財と、特に関係の深い時代を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "銅鐸", match: "弥生時代"),
        QuizMatchingPair(prompt: "埴輪", match: "古墳時代"),
        QuizMatchingPair(prompt: "十二単", match: "平安時代"),
        QuizMatchingPair(prompt: "銀閣", match: "室町時代")
        ],
        choices: ["平安時代", "室町時代", "弥生時代", "古墳時代"],
        explanation: "銅鐸は弥生時代、埴輪は古墳時代、十二単は平安時代、銀閣は室町時代と特に関係の深いものです。"
        ),

        QuizQuestion.chronological(
        question: "【年代順に並べる】江戸幕府の成立から幕末までの出来事を、古い順に並べましょう。",
        choices: ["参勤交代が制度化される", "ペリーが浦賀に来航する", "大坂夏の陣で豊臣氏が滅びる", "徳川家康が征夷大将軍になる"],
        orderedChoices: ["徳川家康が征夷大将軍になる", "大坂夏の陣で豊臣氏が滅びる", "参勤交代が制度化される", "ペリーが浦賀に来航する"],
        explanation: "徳川家康が征夷大将軍になったのは1603年、大坂夏の陣は1615年、参勤交代の制度化は1635年、ペリーの来航は1853年です。"
        ),

        QuizQuestion(
        question: "地方自治の考え方として、最も適切なものはどれですか？",
        choices: [
        "地域のことは住民の意思を生かして決める",
        "地域のこともすべて国会だけで決める",
        "地域のことは裁判所だけで決める",
        "地域のことは外国の政府に任せる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『地域のことは住民の意思を生かして決める』です。地方自治では、地域の住民の意思を生かしながら、その地域の政治を進めます。"
        ),

        QuizQuestion.classification(
        question: "【分類】仕事の例を、国の仕事と地方公共団体の仕事に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "外国との外交を行う", match: "国の仕事"),
        QuizMatchingPair(prompt: "国の防衛に関する仕事を行う", match: "国の仕事"),
        QuizMatchingPair(prompt: "家庭ごみを収集する", match: "地方公共団体の仕事"),
        QuizMatchingPair(prompt: "市立小学校を運営する", match: "地方公共団体の仕事")
        ],
        categories: ["国の仕事", "地方公共団体の仕事"],
        explanation: "外交と国の防衛は国の仕事です。家庭ごみの収集や市立小学校の運営は、地域に身近な地方公共団体の仕事です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】選挙の投票所で投票するときの基本的な流れを、正しい順に並べましょう。",
        choices: ["投票箱に投票用紙を入れる", "投票用紙を受け取る", "受付で選挙人名簿の確認を受ける", "記載台で候補者名などを書く"],
        orderedChoices: ["受付で選挙人名簿の確認を受ける", "投票用紙を受け取る", "記載台で候補者名などを書く", "投票箱に投票用紙を入れる"],
        explanation: "投票所では、受付で選挙人名簿の確認を受け、投票用紙を受け取り、記載台で記入してから投票箱に入れます。"
        ),

        QuizQuestion(
        question: "衆議院の議決が参議院より強く認められる場合がある主な理由はどれですか？",
        choices: [
        "衆議院議員は内閣が任命するから",
        "衆議院が裁判所を直接指揮するから",
        "衆議院には解散がなく任期も長いから",
        "衆議院は任期が短く解散もあり、国民の意思を反映しやすいから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『衆議院は任期が短く解散もあり、国民の意思を反映しやすいから』です。このため、予算や内閣総理大臣の指名などで衆議院の優越が認められています。"
        ),

        QuizQuestion(
        question: "参議院議員は、どのように改選されますか？",
        choices: [
        "2年ごとに全員を改選する",
        "3年ごとに半数を改選する",
        "4年ごとに半数を改選する",
        "6年ごとに全員を改選する"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『3年ごとに半数を改選する』です。参議院議員の任期は6年で、3年ごとに議員の半数が改選されます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】国会で使われる会議や仕組みと、その役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "委員会", match: "法律案などを分野ごとに詳しく審査する"),
        QuizMatchingPair(prompt: "本会議", match: "議院全体として最終的な議決を行う"),
        QuizMatchingPair(prompt: "公聴会", match: "専門家や関係者などから意見を聞く"),
        QuizMatchingPair(prompt: "両院協議会", match: "衆議院と参議院の意見を調整する")
        ],
        choices: ["専門家や関係者などから意見を聞く", "衆議院と参議院の意見を調整する", "議院全体として最終的な議決を行う", "法律案などを分野ごとに詳しく審査する"],
        explanation: "委員会では詳しい審査、本会議では議院としての議決、公聴会では意見の聴取、両院協議会では衆議院と参議院の意見調整を行います。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】資料を見て、大日本帝国憲法のもとで貴族院と衆議院から構成されていた議会の名称を答えましょう。",
        answer: "帝国議会",
        acceptableAnswers: [],
        referenceTitle: "日本の議会の変化",
        referenceRows: [
        QuizReferenceRow(label: "大日本帝国憲法のもと", value: "帝国議会：貴族院と衆議院"),
        QuizReferenceRow(label: "日本国憲法のもと", value: "国会：衆議院と参議院")
        ],
        explanation: "資料では、大日本帝国憲法のもとで貴族院と衆議院から構成されていた議会は『帝国議会』です。"
        ),

        QuizQuestion(
        question: "内閣が行う行政の仕事として、最も適切なものはどれですか？",
        choices: [
        "裁判で有罪か無罪かを決める",
        "地方議会で条例を議決する",
        "国会で成立した法律などに基づいて政策を実行する",
        "憲法を国民投票なしで改正する"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『国会で成立した法律などに基づいて政策を実行する』です。内閣は行政を担当し、法律や予算に基づいて国の政策を進めます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】内閣が作成して国会に提出する、国の1年間の収入と支出の計画を ＿＿ といいます。",
        answer: "予算案",
        acceptableAnswers: ["予算"],
        explanation: "＿＿に入る言葉は『予算案』です。内閣が作成した予算案は国会に提出され、国会の議決を受けます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】省と、その主な仕事を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "財務省", match: "国の財政や税制に関する仕事"),
        QuizMatchingPair(prompt: "農林水産省", match: "農業・林業・水産業に関する仕事"),
        QuizMatchingPair(prompt: "経済産業省", match: "産業や貿易に関する仕事"),
        QuizMatchingPair(prompt: "環境省", match: "環境の保全に関する仕事")
        ],
        choices: ["環境の保全に関する仕事", "産業や貿易に関する仕事", "国の財政や税制に関する仕事", "農業・林業・水産業に関する仕事"],
        explanation: "財務省は財政や税制、農林水産省は農林水産業、経済産業省は産業や貿易、環境省は環境保全に関する仕事を主に担当します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】国の予算が作られてから、その使い方が検査されるまでの大まかな流れを並べましょう。",
        choices: ["各省庁が予算に基づいて事業を行う", "会計検査院が決算を検査する", "内閣が予算案を作成する", "国会が予算を議決する"],
        orderedChoices: ["内閣が予算案を作成する", "国会が予算を議決する", "各省庁が予算に基づいて事業を行う", "会計検査院が決算を検査する"],
        explanation: "内閣が予算案を作成し、国会が議決します。その後、各省庁が予算に基づいて事業を行い、会計検査院が国のお金が適切に使われたかを検査します。"
        ),

        QuizQuestion(
        question: "裁判員制度の対象となる裁判として、最も適切なものはどれですか？",
        choices: [
        "地方裁判所で行われる一定の重大な刑事事件の第一審",
        "すべての民事裁判",
        "最高裁判所で行われるすべての裁判",
        "家庭裁判所で行われるすべての家事事件"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『地方裁判所で行われる一定の重大な刑事事件の第一審』です。裁判員は裁判官とともに、有罪・無罪や刑の内容を判断します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】検察官が、犯罪の疑いがある人について裁判所に刑事裁判を求めることを ＿＿ といいます。",
        answer: "起訴",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は『起訴』です。検察官が裁判所に刑事裁判を求めて起訴すると、その人は被告人として裁判を受けます。"
        ),

        QuizQuestion.classification(
        question: "【分類】裁判で使われる言葉や説明を、民事裁判と刑事裁判に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "訴えを起こした人を原告と呼ぶ", match: "民事裁判"),
        QuizMatchingPair(prompt: "訴えられた側を被告と呼ぶ", match: "民事裁判"),
        QuizMatchingPair(prompt: "罪に問われている人を被告人と呼ぶ", match: "刑事裁判"),
        QuizMatchingPair(prompt: "検察官が犯罪を立証しようとする", match: "刑事裁判")
        ],
        categories: ["民事裁判", "刑事裁判"],
        explanation: "民事裁判では訴えた側を原告、訴えられた側を被告と呼びます。刑事裁判では罪に問われた人を被告人と呼び、検察官が犯罪を立証しようとします。"
        ),

        QuizQuestion(
        question: "日本国憲法が『義務教育は、これを無償とする』と定めていることと最も関係の深い権利はどれですか？",
        choices: [
        "財産権",
        "教育を受ける権利",
        "請願権",
        "参政権"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『教育を受ける権利』です。日本国憲法は、すべての国民が能力に応じてひとしく教育を受ける権利をもち、義務教育を無償とすると定めています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】労働者に保障されている、団結する権利・団体で交渉する権利・団体で行動する権利をまとめて ＿＿ といいます。",
        answer: "労働基本権",
        acceptableAnswers: ["労働三権"],
        explanation: "＿＿に入る言葉は『労働基本権』です。団結権、団体交渉権、団体行動権の三つを『労働三権』ともいいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】基本的人権の種類と、その内容を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "自由権", match: "思想や信教などについて自由が保障される"),
        QuizMatchingPair(prompt: "社会権", match: "人間らしい生活を送るための保障を求める"),
        QuizMatchingPair(prompt: "参政権", match: "選挙などを通して政治に参加する"),
        QuizMatchingPair(prompt: "請求権", match: "裁判などを通して権利の救済を求める")
        ],
        choices: ["選挙などを通して政治に参加する", "裁判などを通して権利の救済を求める", "思想や信教などについて自由が保障される", "人間らしい生活を送るための保障を求める"],
        explanation: "自由権は国から不当に自由を制限されない権利、社会権は人間らしい生活を保障される権利、参政権は政治に参加する権利、請求権は権利の救済を求める権利です。"
        ),

        QuizQuestion.chronological(
        question: "【年代順に並べる】日本の憲法と政治の歩みに関する出来事を、古い順に並べましょう。",
        choices: ["日本国憲法が公布される", "普通選挙法が成立する", "大日本帝国憲法が発布される", "日本国憲法が施行される"],
        orderedChoices: ["大日本帝国憲法が発布される", "普通選挙法が成立する", "日本国憲法が公布される", "日本国憲法が施行される"],
        explanation: "大日本帝国憲法の発布は1889年、普通選挙法の成立は1925年、日本国憲法の公布は1946年、施行は1947年です。"
        ),

        QuizQuestion(
        question: "世界の経度の基準となる本初子午線が通る国は、次のうちどれですか？",
        choices: [
        "ブラジル",
        "エジプト",
        "インド",
        "イギリス"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『イギリス』です。本初子午線は、イギリスのロンドンにあるグリニッジを通る経線を基準としています。"
        ),

        QuizQuestion.classification(
        question: "【分類】国を、国土が北半球にある国と南半球にある国に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ノルウェー", match: "北半球"),
        QuizMatchingPair(prompt: "インド", match: "北半球"),
        QuizMatchingPair(prompt: "南アフリカ共和国", match: "南半球"),
        QuizMatchingPair(prompt: "ニュージーランド", match: "南半球")
        ],
        categories: ["北半球", "南半球"],
        explanation: "ノルウェーとインドは北半球、南アフリカ共和国とニュージーランドは南半球にあります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】大陸を、面積が広い順に並べましょう。",
        choices: ["オーストラリア大陸", "南アメリカ大陸", "ユーラシア大陸", "アフリカ大陸"],
        rankedChoices: ["ユーラシア大陸", "アフリカ大陸", "南アメリカ大陸", "オーストラリア大陸"],
        explanation: "この4つでは、面積が広い順にユーラシア大陸、アフリカ大陸、南アメリカ大陸、オーストラリア大陸となります。"
        ),

        QuizQuestion(
        question: "生産者に適正な対価を支払い、生活の改善や自立を支えることを目指して商品を取引する考え方を何といいますか？",
        choices: [
        "フェアトレード",
        "鎖国",
        "保護貿易",
        "参勤交代"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『フェアトレード』です。生産者が適正な対価を得られるようにすることで、生活の改善や自立を支えることを目指します。"
        ),

        QuizQuestion(
        question: "海外で大規模な災害が起きたとき、日本が国際緊急援助隊を派遣する主な目的はどれですか？",
        choices: [
        "相手国の貿易を禁止するため",
        "日本への観光客を増やすため",
        "救助や医療などの支援を行うため",
        "相手国の選挙結果を決めるため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『救助や医療などの支援を行うため』です。国際緊急援助隊は、海外の大規模災害などで救助活動や医療支援などを行います。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】国際機関を、設立された時期が古い順に並べましょう。",
        choices: ["世界貿易機関（WTO）", "世界保健機関（WHO）", "国際連合（UN）", "国連児童基金（UNICEF）"],
        rankedChoices: ["国際連合（UN）", "国連児童基金（UNICEF）", "世界保健機関（WHO）", "世界貿易機関（WTO）"],
        explanation: "国際連合は1945年、国連児童基金は1946年、世界保健機関は1948年、世界貿易機関は1995年に設立されました。"
        ),

        QuizQuestion(
        question: "奈良時代、唐から日本に渡り、仏教の教えや戒律を伝えた僧はだれですか？",
        choices: [
        "鑑真",
        "空海",
        "最澄",
        "親鸞"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『鑑真』です。鑑真は唐から日本へ渡り、奈良で仏教の戒律を伝えました。"
        ),

        QuizQuestion(
        question: "衆議院議員選挙で用いられている選挙制度はどれですか？",
        choices: [
        "大選挙区制だけ",
        "小選挙区比例代表並立制",
        "比例代表制だけ",
        "都道府県ごとの間接選挙制"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『小選挙区比例代表並立制』です。衆議院議員選挙では、小選挙区選挙と比例代表選挙を組み合わせています。"
        ),

        QuizQuestion(
        question: "国会で、委員会の審査を終えた法律案について、議院の議員が集まって最終的に議決する場を何といいますか？",
        choices: [
        "閣議",
        "両院協議会",
        "本会議",
        "国民審査"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『本会議』です。法律案は委員会で詳しく審査された後、本会議で議員による討論や採決が行われます。"
        ),

        QuizQuestion(
        question: "日本国憲法では、国務大臣についてどのように定められていますか？",
        choices: [
        "全員が裁判官でなければならない",
        "全員が国会議員でなければならない",
        "半数以上が地方議員でなければならない",
        "過半数が国会議員でなければならない"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『過半数が国会議員でなければならない』です。日本国憲法では、国務大臣の過半数は国会議員の中から選ばなければならないと定めています。"
        ),

        QuizQuestion(
        question: "裁判官に職務上の問題があるとき、罷免するかどうかを裁判するために国会に設けられる機関はどれですか？",
        choices: [
        "弾劾裁判所",
        "家庭裁判所",
        "検察審査会",
        "選挙管理委員会"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『弾劾裁判所』です。国会は、罷免の訴追を受けた裁判官を裁判するため、両議院の議員で組織する弾劾裁判所を設けます。"
        ),

        QuizQuestion(
        question: "日本国憲法が『国の最高法規』であることから、正しいといえるものはどれですか？",
        choices: [
        "国会で決めた法律は憲法より優先される",
        "憲法に反する法律や命令は効力をもたない",
        "地方の条例は憲法と関係なく定められる",
        "内閣は憲法の内容を自由に変えられる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『憲法に反する法律や命令は効力をもたない』です。日本国憲法は国の最高法規であり、憲法に反する法律や命令などは効力をもちません。"
        ),

        QuizQuestion(
        question: "日本国憲法では、国会議員はだれを代表すると定められていますか？",
        choices: [
        "自分が所属する政党だけ",
        "自分の選挙区の住民だけ",
        "全国民",
        "国や地方公共団体の職員"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『全国民』です。日本国憲法では、国会は全国民を代表する選挙された議員で組織すると定められています。"
        ),

        QuizQuestion(
        question: "国際民間航空機関（ICAO）が主に取り組んでいることはどれですか？",
        choices: [
        "世界遺産の保護",
        "難民の保護",
        "世界の食料不足への支援",
        "国際民間航空の安全で秩序ある発展"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『国際民間航空の安全で秩序ある発展』です。ICAOは、国際民間航空の安全性やルールづくりなどに取り組む国際機関です。"
        ),

        QuizQuestion(
        question: "日清戦争の講和条約として、日本と清の間で結ばれた条約はどれですか？",
        choices: [
        "下関条約",
        "ポーツマス条約",
        "日米和親条約",
        "日ソ共同宣言"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『下関条約』です。1895年、日清戦争の講和条約として下関条約が結ばれました。"
        ),

        QuizQuestion(
        question: "選挙で、一人一票を原則とし、それぞれの票を平等に扱う考え方を何といいますか？",
        choices: [
        "普通選挙",
        "平等選挙",
        "秘密選挙",
        "間接選挙"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『平等選挙』です。平等選挙では、一人一票を原則として、それぞれの票を平等に扱います。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】鎌倉時代、将軍が御家人に土地などを保障し、御家人が将軍のために働く主従関係を ＿＿ といいます。",
        answer: "御恩と奉公",
        acceptableAnswers: ["ごおんとほうこう"],
        explanation: "＿＿に入る言葉は『御恩と奉公』です。将軍が御家人に与える保護を御恩、御家人が将軍のために軍役などを果たすことを奉公といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】衆議院と参議院で異なる議決をしたとき、意見を調整するために開かれることがある会議を ＿＿ といいます。",
        answer: "両院協議会",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は『両院協議会』です。衆議院と参議院の意見が異なったとき、両院の意見を調整するために開かれることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】内閣が国会の信任をもとに成り立ち、国会に対して連帯して責任を負う仕組みを ＿＿ といいます。",
        answer: "議院内閣制",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は『議院内閣制』です。日本では、内閣が国会の信任をもとに成り立ち、国会に対して連帯して責任を負います。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】国の政治を憲法に基づいて行い、国家の権力を憲法で制限する考え方を ＿＿ といいます。",
        answer: "立憲主義",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は『立憲主義』です。立憲主義は、国家の権力が憲法に従うことで、国民の権利や自由を守ろうとする考え方です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】政治に参加したり意見を伝えたりする方法と、その内容を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "選挙", match: "代表者を選ぶ"),
        QuizMatchingPair(prompt: "請願", match: "国や地方公共団体に要望を申し出る"),
        QuizMatchingPair(prompt: "住民投票", match: "地域の重要な問題について住民が意思を示す"),
        QuizMatchingPair(prompt: "署名活動", match: "同じ意見の人の署名を集めて意思を示す")
        ],
        choices: ["地域の重要な問題について住民が意思を示す", "同じ意見の人の署名を集めて意思を示す", "代表者を選ぶ", "国や地方公共団体に要望を申し出る"],
        explanation: "選挙では代表者を選び、請願では国や地方公共団体に要望を申し出ます。住民投票では地域の重要な問題について意思を示し、署名活動では賛同する人の署名を集めて意思を示します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】刑事裁判に関わる人と、その主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "裁判官", match: "法廷を進めて判決を行う"),
        QuizMatchingPair(prompt: "検察官", match: "被告人が犯罪を行ったことを立証しようとする"),
        QuizMatchingPair(prompt: "弁護人", match: "被告人の権利や利益を守る"),
        QuizMatchingPair(prompt: "裁判員", match: "裁判官とともに有罪・無罪や刑を判断する")
        ],
        choices: ["被告人の権利や利益を守る", "裁判官とともに有罪・無罪や刑を判断する", "法廷を進めて判決を行う", "被告人が犯罪を行ったことを立証しようとする"],
        explanation: "裁判官は裁判を進めて判決を行い、検察官は犯罪の立証を行います。弁護人は被告人の権利を守り、対象となる刑事裁判では裁判員が裁判官とともに判断します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】国と首都を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ノルウェー", match: "オスロ"),
        QuizMatchingPair(prompt: "スペイン", match: "マドリード"),
        QuizMatchingPair(prompt: "アルゼンチン", match: "ブエノスアイレス"),
        QuizMatchingPair(prompt: "タイ", match: "バンコク")
        ],
        choices: ["バンコク", "オスロ", "ブエノスアイレス", "マドリード"],
        explanation: "ノルウェーの首都はオスロ、スペインはマドリード、アルゼンチンはブエノスアイレス、タイはバンコクです。"
        ),

        QuizQuestion.related(
        question: "【関連付け】日本国憲法で保障されている権利と、その内容を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "居住・移転の自由", match: "住む場所や移る場所を選ぶ"),
        QuizMatchingPair(prompt: "職業選択の自由", match: "自分の職業を選ぶ"),
        QuizMatchingPair(prompt: "裁判を受ける権利", match: "裁判所で裁判を受ける"),
        QuizMatchingPair(prompt: "国家賠償請求権", match: "公務員の違法な行為による損害の賠償を求める")
        ],
        choices: ["自分の職業を選ぶ", "公務員の違法な行為による損害の賠償を求める", "住む場所や移る場所を選ぶ", "裁判所で裁判を受ける"],
        explanation: "居住・移転の自由は住む場所などを選ぶ自由、職業選択の自由は職業を選ぶ自由です。また、裁判を受ける権利や、一定の場合に国などへ賠償を求める国家賠償請求権も保障されています。"
        ),

        QuizQuestion.classification(
        question: "【分類】選挙を、国政選挙と地方選挙に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "衆議院議員選挙", match: "国政選挙"),
        QuizMatchingPair(prompt: "参議院議員選挙", match: "国政選挙"),
        QuizMatchingPair(prompt: "都道府県議会議員選挙", match: "地方選挙"),
        QuizMatchingPair(prompt: "市区町村議会議員選挙", match: "地方選挙")
        ],
        categories: ["国政選挙", "地方選挙"],
        explanation: "衆議院議員と参議院議員を選ぶのは国政選挙、都道府県議会議員と市区町村議会議員を選ぶのは地方選挙です。"
        ),

        QuizQuestion.classification(
        question: "【分類】国を、島国と内陸国に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "日本", match: "島国"),
        QuizMatchingPair(prompt: "ニュージーランド", match: "島国"),
        QuizMatchingPair(prompt: "モンゴル", match: "内陸国"),
        QuizMatchingPair(prompt: "スイス", match: "内陸国")
        ],
        categories: ["島国", "内陸国"],
        explanation: "日本とニュージーランドは海に囲まれた島国です。モンゴルとスイスは海に面していない内陸国です。"
        ),

        QuizQuestion.classification(
        question: "【分類】国際協力の活動例を、主な分野に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "子どもへの予防接種を支援する", match: "保健・医療"),
        QuizMatchingPair(prompt: "現地の教員を研修する", match: "教育"),
        QuizMatchingPair(prompt: "森林を守るため植林する", match: "環境"),
        QuizMatchingPair(prompt: "安全な水を得るため井戸を整備する", match: "生活基盤")
        ],
        categories: ["保健・医療", "教育", "環境", "生活基盤"],
        explanation: "予防接種は保健・医療、教員研修は教育、植林は環境、井戸の整備は生活基盤に関わる国際協力です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】国会が内閣総理大臣を指名した後、新しい内閣ができるまでの流れを順に並べましょう。",
        choices: ["内閣総理大臣が国務大臣を任命する", "新しい内閣が発足する", "国会が内閣総理大臣を指名する", "天皇が内閣総理大臣を任命する"],
        orderedChoices: ["国会が内閣総理大臣を指名する", "天皇が内閣総理大臣を任命する", "内閣総理大臣が国務大臣を任命する", "新しい内閣が発足する"],
        explanation: "国会が内閣総理大臣を指名し、天皇がその指名に基づいて任命します。その後、内閣総理大臣が国務大臣を任命し、新しい内閣が発足します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】地方裁判所を第一審とする刑事事件で、被告人が判決に不服として上級の裁判所へ訴える場合の流れを並べましょう。",
        choices: ["最高裁判所に上告する", "地方裁判所が第一審の判決を出す", "高等裁判所が第二審の判決を出す", "高等裁判所に控訴する"],
        orderedChoices: ["地方裁判所が第一審の判決を出す", "高等裁判所に控訴する", "高等裁判所が第二審の判決を出す", "最高裁判所に上告する"],
        explanation: "地方裁判所の第一審判決に不服があるときは高等裁判所へ控訴し、その第二審判決にも不服がある場合は最高裁判所へ上告できます。"
        ),

        QuizQuestion.chronological(
        question: "【年代順に並べる】世界の環境問題に関する国際的な出来事を、古い順に並べましょう。",
        choices: ["京都議定書が採択される", "地球サミットが開かれる", "パリ協定が採択される", "国連人間環境会議が開かれる"],
        orderedChoices: ["国連人間環境会議が開かれる", "地球サミットが開かれる", "京都議定書が採択される", "パリ協定が採択される"],
        explanation: "国連人間環境会議は1972年、地球サミットは1992年、京都議定書は1997年、パリ協定は2015年です。"
        ),

        QuizQuestion.chronological(
        question: "【年代順に並べる】古代の日本の出来事を、古い順に並べましょう。",
        choices: ["墾田永年私財法が出される", "十七条の憲法が定められる", "平城京に都が移る", "大宝律令が定められる"],
        orderedChoices: ["十七条の憲法が定められる", "大宝律令が定められる", "平城京に都が移る", "墾田永年私財法が出される"],
        explanation: "十七条の憲法は604年、大宝律令は701年、平城京への遷都は710年、墾田永年私財法は743年です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】国土の面積が広い順に並べましょう。",
        choices: ["日本", "オーストラリア", "韓国", "フランス"],
        rankedChoices: ["オーストラリア", "フランス", "日本", "韓国"],
        explanation: "国土の面積は、オーストラリア、フランス、日本、韓国の順に広いです。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】首都の位置が東にある国から順に並べましょう。",
        choices: ["ギリシャ", "フィリピン", "トルコ", "ベトナム"],
        rankedChoices: ["フィリピン", "ベトナム", "トルコ", "ギリシャ"],
        explanation: "首都の経度を比べると、マニラ、ハノイ、アンカラ、アテネの順に東から西へ並びます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】資料を見て、日本国憲法第23条で保障されている自由を答えましょう。",
        answer: "学問の自由",
        acceptableAnswers: [],
        referenceTitle: "日本国憲法に定められた自由の例",
        referenceRows: [
        QuizReferenceRow(label: "第19条", value: "思想及び良心の自由"),
        QuizReferenceRow(label: "第20条", value: "信教の自由"),
        QuizReferenceRow(label: "第21条", value: "集会、結社及び言論、出版その他一切の表現の自由"),
        QuizReferenceRow(label: "第23条", value: "学問の自由")
        ],
        explanation: "資料では、第23条に『学問の自由』とあります。したがって答えは『学問の自由』です。"
        ),

        QuizQuestion(
        question: "鎌倉時代、武士のための法律『御成敗式目』を定めた人物はだれですか？",
        choices: [
        "北条泰時",
        "足利尊氏",
        "平清盛",
        "徳川吉宗"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『北条泰時』です。北条泰時は1232年に、武士の社会の慣習などをもとに御成敗式目を定めました。"
        ),

        QuizQuestion(
        question: "都道府県や市区町村の議会が、その地域の決まりとして定めるものを何といいますか？",
        choices: [
        "法律",
        "条例",
        "政令",
        "条約"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『条例』です。条例は、地方公共団体の議会が地域の実情に合わせて定める決まりです。"
        ),

        QuizQuestion(
        question: "国会で、法律案などを分野ごとに詳しく審査する場はどれですか？",
        choices: [
        "閣議",
        "公聴会",
        "委員会",
        "裁判員会議"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『委員会』です。国会では、法律案などを委員会で分野ごとに詳しく審査した後、本会議で議決します。"
        ),

        QuizQuestion(
        question: "内閣が、法律を実施するためなどに定める命令を何といいますか？",
        choices: [
        "条例",
        "法律",
        "規則",
        "政令"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『政令』です。政令は、憲法や法律を実施するためなどに内閣が定める命令です。"
        ),

        QuizQuestion(
        question: "警察などが人を逮捕したり家を捜索したりするとき、原則として裁判官が発する何が必要ですか？",
        choices: [
        "令状",
        "条例",
        "請願書",
        "判決書"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『令状』です。人を逮捕したり家を捜索したりするときは、現行犯の場合などを除き、原則として裁判官が発する令状が必要です。"
        ),

        QuizQuestion(
        question: "日本国憲法が保障する自由のうち、心の中でどのような考えをもつかを自分で決められる自由はどれですか？",
        choices: [
        "信教の自由",
        "思想・良心の自由",
        "居住・移転の自由",
        "学問の自由"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『思想・良心の自由』です。人がどのような考えや信念をもつかは、基本的人権として保障されています。"
        ),

        QuizQuestion(
        question: "首都がローマである国はどれですか？",
        choices: [
        "タイ",
        "ブラジル",
        "イタリア",
        "エジプト"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『イタリア』です。イタリアの首都はローマです。"
        ),

        QuizQuestion(
        question: "国や国際機関ではなく、民間の立場から国際協力を行う『非政府組織』の一般的な略称はどれですか？",
        choices: [
        "ODA",
        "PKO",
        "NPO",
        "NGO"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『NGO』です。NGOは非政府組織のことで、民間の立場から人道支援や環境保護などの国際協力を行います。"
        ),

        QuizQuestion(
        question: "明治政府が藩を廃止し、全国に府と県を置いた改革を何といいますか？",
        choices: [
        "廃藩置県",
        "地租改正",
        "徴兵令",
        "学制"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『廃藩置県』です。1871年、明治政府は藩を廃止して府と県を置き、中央集権的な国づくりを進めました。"
        ),

        QuizQuestion(
        question: "地方公共団体の予算や条例を議決する機関はどれですか？",
        choices: [
        "選挙管理委員会",
        "地方議会",
        "地方裁判所",
        "内閣"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『地方議会』です。都道府県や市区町村の地方議会は、予算や条例などを議決します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】国会が、政治が正しく行われているかを調べるためにもつ権限を ＿＿ といいます。",
        answer: "国政調査権",
        acceptableAnswers: ["国政調査"],
        explanation: "＿＿に入る言葉は『国政調査権』です。国会は国政について調査し、必要に応じて証人を呼んだり記録の提出を求めたりできます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】内閣のもとで、それぞれの分野の行政を担当する『○○省』などの機関をまとめて ＿＿ といいます。",
        answer: "省庁",
        acceptableAnswers: ["中央省庁", "府省庁"],
        explanation: "＿＿に入る言葉は『省庁』です。国の行政は、内閣のもとにある各省庁が分担して進めています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】最高裁判所の裁判官について、国民がその職にとどめてよいかを判断する制度を ＿＿ といいます。",
        answer: "国民審査",
        acceptableAnswers: ["最高裁判所裁判官国民審査"],
        explanation: "＿＿に入る言葉は『国民審査』です。最高裁判所の裁判官は、国民審査によって国民から審査を受けます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】国民が国や地方公共団体に対して、希望や要望を申し出ることができる権利を ＿＿ といいます。",
        answer: "請願権",
        acceptableAnswers: ["請願"],
        explanation: "＿＿に入る言葉は『請願権』です。請願権は、国民が国や地方公共団体に希望や要望を申し出ることができる権利です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】歴史上の人物と、その人物に関係する出来事を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "後醍醐天皇", match: "建武の新政を始める"),
        QuizMatchingPair(prompt: "足利義政", match: "東山文化が栄える時代の将軍となる"),
        QuizMatchingPair(prompt: "松平定信", match: "寛政の改革を行う"),
        QuizMatchingPair(prompt: "井伊直弼", match: "日米修好通商条約の締結を進める")
        ],
        choices: ["寛政の改革を行う", "日米修好通商条約の締結を進める", "建武の新政を始める", "東山文化が栄える時代の将軍となる"],
        explanation: "後醍醐天皇は建武の新政を始め、足利義政の時代には東山文化が栄えました。松平定信は寛政の改革を行い、井伊直弼は日米修好通商条約の締結を進めました。"
        ),

        QuizQuestion.related(
        question: "【関連付け】選挙に関する言葉と、その意味を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "選挙権", match: "選挙で投票できる権利"),
        QuizMatchingPair(prompt: "被選挙権", match: "選挙に立候補できる権利"),
        QuizMatchingPair(prompt: "普通選挙", match: "財産や納税額などを条件にせず選挙権を認める"),
        QuizMatchingPair(prompt: "秘密選挙", match: "だれに投票したかを他人に知られない")
        ],
        choices: ["だれに投票したかを他人に知られない", "選挙に立候補できる権利", "財産や納税額などを条件にせず選挙権を認める", "選挙で投票できる権利"],
        explanation: "選挙権は投票する権利、被選挙権は立候補する権利です。普通選挙は財産や納税額などを条件にせず選挙権を認める仕組みで、秘密選挙では投票先の秘密が守られます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】省庁と、その主な仕事を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "総務省", match: "地方自治や情報通信"),
        QuizMatchingPair(prompt: "外務省", match: "外交"),
        QuizMatchingPair(prompt: "文部科学省", match: "教育や科学技術"),
        QuizMatchingPair(prompt: "厚生労働省", match: "社会保障や労働")
        ],
        choices: ["教育や科学技術", "社会保障や労働", "外交", "地方自治や情報通信"],
        explanation: "総務省は地方自治や情報通信、外務省は外交、文部科学省は教育や科学技術、厚生労働省は社会保障や労働に関する仕事を主に担当します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】国際協力に関わる組織と、その主な活動を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ILO", match: "労働者の権利や労働条件の改善"),
        QuizMatchingPair(prompt: "UNDP", match: "開発途上国の発展を支援"),
        QuizMatchingPair(prompt: "UNEP", match: "環境問題への国際的な取り組み"),
        QuizMatchingPair(prompt: "赤十字国際委員会", match: "武力紛争の被害者への人道支援")
        ],
        choices: ["環境問題への国際的な取り組み", "武力紛争の被害者への人道支援", "開発途上国の発展を支援", "労働者の権利や労働条件の改善"],
        explanation: "ILOは労働問題、UNDPは開発支援、UNEPは環境問題に取り組み、赤十字国際委員会は武力紛争の被害者への人道支援を行います。"
        ),

        QuizQuestion.classification(
        question: "【分類】国会が開かれる場合を、常会・臨時会・特別会に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "毎年1回召集される", match: "常会"),
        QuizMatchingPair(prompt: "内閣が必要と認めたときなどに召集される", match: "臨時会"),
        QuizMatchingPair(prompt: "衆議院の総選挙後に召集される", match: "特別会"),
        QuizMatchingPair(prompt: "次の年度の予算案の審議が中心となる", match: "常会")
        ],
        categories: ["常会", "臨時会", "特別会"],
        explanation: "常会は毎年1回召集され、次年度の予算案などを審議します。臨時会は必要に応じて、特別会は衆議院の総選挙後に召集されます。"
        ),

        QuizQuestion.classification(
        question: "【分類】裁判の例を、民事裁判と刑事裁判に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "貸したお金の返済をめぐる争い", match: "民事裁判"),
        QuizMatchingPair(prompt: "交通事故の損害賠償をめぐる争い", match: "民事裁判"),
        QuizMatchingPair(prompt: "窃盗事件で被告人の有罪・無罪を判断する", match: "刑事裁判"),
        QuizMatchingPair(prompt: "傷害事件で被告人の刑罰を判断する", match: "刑事裁判")
        ],
        categories: ["民事裁判", "刑事裁判"],
        explanation: "個人や会社などの間の争いを扱うのが民事裁判で、犯罪について被告人の有罪・無罪や刑罰を判断するのが刑事裁判です。"
        ),

        QuizQuestion.classification(
        question: "【分類】基本的人権の例を、自由権・社会権・参政権に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "居住・移転の自由", match: "自由権"),
        QuizMatchingPair(prompt: "職業選択の自由", match: "自由権"),
        QuizMatchingPair(prompt: "勤労の権利", match: "社会権"),
        QuizMatchingPair(prompt: "被選挙権", match: "参政権")
        ],
        categories: ["自由権", "社会権", "参政権"],
        explanation: "居住・移転の自由と職業選択の自由は自由権、勤労の権利は社会権、被選挙権は政治に参加する参政権に分類されます。"
        ),

        QuizQuestion.chronological(
        question: "【年代順に並べる】近代日本と外国との関係に関する出来事を、古い順に並べましょう。",
        choices: ["第一次世界大戦が始まる", "韓国併合が行われる", "日清戦争が始まる", "日露戦争が始まる"],
        orderedChoices: ["日清戦争が始まる", "日露戦争が始まる", "韓国併合が行われる", "第一次世界大戦が始まる"],
        explanation: "日清戦争は1894年、日露戦争は1904年、韓国併合は1910年、第一次世界大戦は1914年に始まりました。"
        ),

        QuizQuestion.chronological(
        question: "【年代順に並べる】日本の選挙制度の変化に関する出来事を、古い順に並べましょう。",
        choices: ["選挙権年齢が18歳以上になる", "女性に選挙権が認められる", "普通選挙法が成立する", "男女が参加した戦後初の衆議院議員総選挙が行われる"],
        orderedChoices: ["普通選挙法が成立する", "女性に選挙権が認められる", "男女が参加した戦後初の衆議院議員総選挙が行われる", "選挙権年齢が18歳以上になる"],
        explanation: "普通選挙法は1925年に成立し、女性には1945年に選挙権が認められました。男女が参加した戦後初の衆議院議員総選挙は1946年に行われ、選挙権年齢は2016年に18歳以上になりました。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】衆議院で内閣不信任決議が可決され、内閣が衆議院の解散を選ばない場合の流れを並べましょう。",
        choices: ["国会が新しい内閣総理大臣を指名する", "内閣が総辞職する", "衆議院で内閣不信任決議が可決される", "内閣が10日以内に衆議院を解散しない"],
        orderedChoices: ["衆議院で内閣不信任決議が可決される", "内閣が10日以内に衆議院を解散しない", "内閣が総辞職する", "国会が新しい内閣総理大臣を指名する"],
        explanation: "内閣不信任決議が可決された場合、内閣は10日以内に衆議院を解散しなければ総辞職します。その後、国会が新しい内閣総理大臣を指名します。"
        ),

        QuizQuestion.chronological(
        question: "【年代順に並べる】地域どうしの国際協力に関する出来事を、古い順に並べましょう。",
        choices: ["AUが発足する", "APECが発足する", "ASEANが発足する", "EUが発足する"],
        orderedChoices: ["ASEANが発足する", "APECが発足する", "EUが発足する", "AUが発足する"],
        explanation: "ASEANは1967年、APECは1989年、EUは1993年、AUは2002年に発足または活動を開始しました。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】首都の位置が西にある国から順に並べましょう。",
        choices: ["インド", "日本", "イギリス", "エジプト"],
        rankedChoices: ["イギリス", "エジプト", "インド", "日本"],
        explanation: "首都の位置を比べると、西からロンドン、カイロ、ニューデリー、東京の順になります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】裁判所を、上級の裁判所から順に並べましょう。",
        choices: ["地方裁判所", "最高裁判所", "簡易裁判所", "高等裁判所"],
        rankedChoices: ["最高裁判所", "高等裁判所", "地方裁判所", "簡易裁判所"],
        explanation: "上級から、最高裁判所、高等裁判所、地方裁判所、簡易裁判所の順です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】資料を見て、参議院が議決しない場合に『10日』が基準となるものを答えましょう。",
        answer: "内閣総理大臣の指名",
        acceptableAnswers: ["内閣総理大臣指名", "首相の指名"],
        referenceTitle: "衆議院の優越に関する主な決まり",
        referenceRows: [
        QuizReferenceRow(label: "法律案", value: "衆議院が出席議員の3分の2以上で再可決すると法律になる"),
        QuizReferenceRow(label: "予算", value: "参議院が国会休会中を除いて30日以内に議決しないと衆議院の議決が国会の議決となる"),
        QuizReferenceRow(label: "条約", value: "参議院が国会休会中を除いて30日以内に議決しないと衆議院の議決が国会の議決となる"),
        QuizReferenceRow(label: "内閣総理大臣の指名", value: "参議院が国会休会中を除いて10日以内に議決しないと衆議院の議決が国会の議決となる")
        ],
        explanation: "資料では、『内閣総理大臣の指名』だけが10日となっています。したがって答えは『内閣総理大臣の指名』です。"
        ),

        QuizQuestion(
        question: "645年、中大兄皇子と中臣鎌足らが始めた政治改革を何といいますか？",
        choices: [
        "大化の改新",
        "明治維新",
        "承久の乱",
        "大政奉還"
        ],
        correctAnswerIndex: 0,
        explanation: "645年に中大兄皇子と中臣鎌足らが始めた政治改革を『大化の改新』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】人物と、その人物に関係する出来事を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "北条時宗", match: "元の襲来に備える"),
        QuizMatchingPair(prompt: "足利義満", match: "日明貿易を始める"),
        QuizMatchingPair(prompt: "徳川綱吉", match: "生類憐みの令を出す"),
        QuizMatchingPair(prompt: "板垣退助", match: "自由民権運動を進める")
        ],
        choices: ["自由民権運動を進める", "元の襲来に備える", "生類憐みの令を出す", "日明貿易を始める"],
        explanation: "北条時宗は元の襲来に備え、足利義満は日明貿易を始め、徳川綱吉は生類憐みの令を出し、板垣退助は自由民権運動を進めました。"
        ),

        QuizQuestion(
        question: "都道府県知事や市区町村長は、どのように選ばれますか？",
        choices: [
        "国会議員の投票で選ぶ",
        "住民の直接選挙で選ぶ",
        "内閣が任命する",
        "天皇が任命する"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『住民の直接選挙で選ぶ』です。都道府県知事や市区町村長は、その地域の住民による直接選挙で選ばれます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】国や地方公共団体の仕事に使われ、国民などが納めるお金を ＿＿ といいます。",
        answer: "税金",
        acceptableAnswers: ["税"],
        explanation: "国や地方公共団体の仕事に使われるために納めるお金を『税金』といいます。"
        ),

        QuizQuestion(
        question: "日本の国会を構成する二つの議院の組み合わせはどれですか？",
        choices: [
        "衆議院と最高裁判所",
        "参議院と内閣",
        "衆議院と参議院",
        "内閣と裁判所"
        ],
        correctAnswerIndex: 2,
        explanation: "日本の国会は、衆議院と参議院の二つの議院で構成されています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】国会の主な仕事と、その内容を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "法律", match: "制定する"),
        QuizMatchingPair(prompt: "予算", match: "議決する"),
        QuizMatchingPair(prompt: "条約", match: "承認する"),
        QuizMatchingPair(prompt: "内閣総理大臣", match: "指名する")
        ],
        choices: ["承認する", "指名する", "制定する", "議決する"],
        explanation: "国会は法律を制定し、予算を議決し、条約を承認し、内閣総理大臣を指名します。"
        ),

        QuizQuestion(
        question: "内閣の中心となり、国務大臣を任命するのはだれですか？",
        choices: [
        "衆議院議長",
        "最高裁判所長官",
        "都道府県知事",
        "内閣総理大臣"
        ],
        correctAnswerIndex: 3,
        explanation: "内閣総理大臣は内閣の中心となり、国務大臣を任命します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】内閣総理大臣と国務大臣が、内閣の方針などを話し合う会議を ＿＿ といいます。",
        answer: "閣議",
        acceptableAnswers: [],
        explanation: "内閣総理大臣と国務大臣が内閣の方針などを話し合う会議を『閣議』といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】同じ事件について、原則として三回まで異なる段階の裁判所で裁判を受けられる仕組みを ＿＿ といいます。",
        answer: "三審制",
        acceptableAnswers: [],
        explanation: "原則として三回まで裁判を受けられる仕組みを『三審制』といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】日本国憲法で保障される、健康で文化的な最低限度の生活を営む権利を ＿＿ といいます。",
        answer: "生存権",
        acceptableAnswers: [],
        explanation: "健康で文化的な最低限度の生活を営む権利を『生存権』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】国際協力に関わる組織と、主な活動を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "JICA", match: "開発途上国への技術協力"),
        QuizMatchingPair(prompt: "UNHCR", match: "難民の保護と支援"),
        QuizMatchingPair(prompt: "WFP", match: "食料支援"),
        QuizMatchingPair(prompt: "国境なき医師団", match: "医療支援")
        ],
        choices: ["食料支援", "開発途上国への技術協力", "医療支援", "難民の保護と支援"],
        explanation: "JICAは開発途上国への技術協力などを行い、UNHCRは難民を支援し、WFPは食料支援を行い、国境なき医師団は医療支援を行います。"
        ),

        QuizQuestion.classification(
        question: "【分類】歴史上の出来事を、古代・中世・近世・近代に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "墾田永年私財法", match: "古代"),
        QuizMatchingPair(prompt: "応仁の乱", match: "中世"),
        QuizMatchingPair(prompt: "島原・天草一揆", match: "近世"),
        QuizMatchingPair(prompt: "版籍奉還", match: "近代")
        ],
        categories: ["古代", "中世", "近世", "近代"],
        explanation: "墾田永年私財法は古代、応仁の乱は中世、島原・天草一揆は近世、版籍奉還は近代の出来事です。"
        ),

        QuizQuestion.classification(
        question: "【分類】国民が直接選ぶものと、国民が直接は選ばないものに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "衆議院議員", match: "国民が直接選ぶ"),
        QuizMatchingPair(prompt: "参議院議員", match: "国民が直接選ぶ"),
        QuizMatchingPair(prompt: "内閣総理大臣", match: "国民が直接は選ばない"),
        QuizMatchingPair(prompt: "最高裁判所長官", match: "国民が直接は選ばない")
        ],
        categories: ["国民が直接選ぶ", "国民が直接は選ばない"],
        explanation: "衆議院議員と参議院議員は選挙で国民が直接選びます。内閣総理大臣は国会が指名し、最高裁判所長官は内閣の指名に基づいて天皇が任命します。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】資料を見て、解散がある議院の名前を答えましょう。",
        answer: "衆議院",
        acceptableAnswers: [],
        referenceTitle: "二つの議院と解散",
        referenceRows: [
        QuizReferenceRow(label: "衆議院", value: "解散がある"),
        QuizReferenceRow(label: "参議院", value: "解散がない")
        ],
        explanation: "資料では、解散があるのは『衆議院』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】内閣が行うことと、内閣の助言と承認により天皇が行う国事行為に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "法律を誠実に執行する", match: "内閣"),
        QuizMatchingPair(prompt: "外交関係を処理する", match: "内閣"),
        QuizMatchingPair(prompt: "国会を召集する", match: "天皇の国事行為"),
        QuizMatchingPair(prompt: "栄典を授与する", match: "天皇の国事行為")
        ],
        categories: ["内閣", "天皇の国事行為"],
        explanation: "法律の執行と外交関係の処理は内閣の仕事です。国会の召集と栄典の授与は、内閣の助言と承認により天皇が行う国事行為です。"
        ),

        QuizQuestion(
        question: "裁判所が国会や内閣から独立している最も大切な理由はどれですか？",
        choices: [
        "公正な裁判を行うため",
        "法律を自由に変えるため",
        "税金を集めるため",
        "外交を進めるため"
        ],
        correctAnswerIndex: 0,
        explanation: "裁判所は、他の機関の影響を受けずに公正な裁判を行うため、国会や内閣から独立しています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】裁判所の種類と、主な役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "最高裁判所", match: "最終的な判断をする"),
        QuizMatchingPair(prompt: "高等裁判所", match: "主に第二審を行う"),
        QuizMatchingPair(prompt: "家庭裁判所", match: "家庭や少年に関する事件を扱う"),
        QuizMatchingPair(prompt: "簡易裁判所", match: "比較的軽い事件を扱う")
        ],
        choices: ["家庭や少年に関する事件を扱う", "最終的な判断をする", "比較的軽い事件を扱う", "主に第二審を行う"],
        explanation: "最高裁判所は最終的な判断をし、高等裁判所は主に第二審を行います。家庭裁判所は家庭や少年に関する事件を扱い、簡易裁判所は比較的軽い事件を扱います。"
        ),

        QuizQuestion(
        question: "日本国憲法の『すべて国民は、法の下に平等である』という考えを表す言葉はどれですか？",
        choices: [
        "国民主権",
        "法の下の平等",
        "平和主義",
        "地方自治"
        ],
        correctAnswerIndex: 1,
        explanation: "『すべて国民は、法の下に平等である』という考えは『法の下の平等』を表しています。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】国のきまりを、効力が強い順に並べましょう。",
        choices: ["条例", "政令", "日本国憲法", "法律"],
        rankedChoices: ["日本国憲法", "法律", "政令", "条例"],
        explanation: "国のきまりは、日本国憲法、法律、政令、条例の順に強い効力をもちます。"
        ),

        QuizQuestion(
        question: "次のうち、国土全体が南半球にある国はどれですか？",
        choices: [
        "日本",
        "中国",
        "オーストラリア",
        "カナダ"
        ],
        correctAnswerIndex: 2,
        explanation: "オーストラリアは国土全体が赤道より南の南半球にあります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】首都が北にある国から順に並べましょう。",
        choices: ["オーストラリア", "エジプト", "フランス", "日本"],
        rankedChoices: ["フランス", "日本", "エジプト", "オーストラリア"],
        explanation: "首都の緯度は、パリ、東京、カイロ、キャンベラの順に北から南へ並びます。"
        ),

        QuizQuestion(
        question: "日本政府が開発途上国の経済や社会の発展を支えるために行う『政府開発援助』の略称はどれですか？",
        choices: [
        "NGO",
        "PKO",
        "WTO",
        "ODA"
        ],
        correctAnswerIndex: 3,
        explanation: "政府開発援助は英語でOfficial Development Assistanceといい、略して『ODA』と呼ばれます。"
        ),

        QuizQuestion.chronological(
        question: "【年代順に並べる】日本と外国との関わりに関する出来事を、古い順に並べましょう。",
        choices: ["日英同盟を結ぶ", "鉄砲が伝わる", "遣隋使を送る", "日米和親条約を結ぶ"],
        orderedChoices: ["遣隋使を送る", "鉄砲が伝わる", "日米和親条約を結ぶ", "日英同盟を結ぶ"],
        explanation: "遣隋使は7世紀、鉄砲伝来は1543年、日米和親条約は1854年、日英同盟は1902年です。"
        ),

        QuizQuestion(
        question: "地方自治で、一定数の署名を集めて条例の制定や改廃を求めることができる制度はどれですか？",
        choices: [
        "直接請求",
        "国民審査",
        "国政調査",
        "住民投票"
        ],
        correctAnswerIndex: 0,
        explanation: "住民が一定数の署名を集め、条例の制定や改廃などを求める制度を『直接請求』といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】国の予算案が国会で審議される大まかな流れを、正しい順に並べましょう。",
        choices: ["参議院でも審議する", "内閣が予算案を作る", "衆議院で先に審議する", "予算案を衆議院に提出する"],
        orderedChoices: ["内閣が予算案を作る", "予算案を衆議院に提出する", "衆議院で先に審議する", "参議院でも審議する"],
        explanation: "予算案は内閣が作成し、国会に提出されます。予算は衆議院で先に審議され、その後、参議院でも審議されます。"
        ),

        QuizQuestion(
        question: "最高裁判所長官は、だれの指名に基づいて天皇が任命しますか？",
        choices: [
        "国会",
        "内閣",
        "最高裁判所",
        "国民"
        ],
        correctAnswerIndex: 1,
        explanation: "最高裁判所長官は、内閣の指名に基づいて天皇が任命します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】裁判員が刑事裁判に参加する大まかな流れを、正しい順に並べましょう。",
        choices: ["法廷で審理に参加する", "裁判員候補者に通知が届く", "裁判官と評議する", "裁判員を選ぶ手続きを行う"],
        orderedChoices: ["裁判員候補者に通知が届く", "裁判員を選ぶ手続きを行う", "法廷で審理に参加する", "裁判官と評議する"],
        explanation: "裁判員候補者への通知の後、裁判所で選任手続きを行い、選ばれた裁判員は審理に参加し、最後に裁判官と評議します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】日本国憲法を改正するときの手続きを、正しい順に並べましょう。",
        choices: ["天皇が国民の名で公布する", "国民投票を行う", "国会が各議院の総議員の3分の2以上の賛成で発議する", "国民投票で過半数の賛成を得る"],
        orderedChoices: ["国会が各議院の総議員の3分の2以上の賛成で発議する", "国民投票を行う", "国民投票で過半数の賛成を得る", "天皇が国民の名で公布する"],
        explanation: "憲法改正は、各議院の総議員の3分の2以上の賛成による国会の発議、国民投票、過半数の賛成、天皇による公布の順に進みます。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai6, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Shakai6ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai6ListView(isPresenting: .constant(false))
    }
}
