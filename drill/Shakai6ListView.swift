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
            question: "日本国憲法で、国民に保障されている基本的人権の一つは次のうちどれですか？",
            choices: [
                "財産を所有する自由",
                "軍事行動の自由",
                "公共の福祉に反しない自由",
                "表現の自由"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法では、表現の自由が基本的人権の一つとして保障されています。"
        ),

        QuizQuestion(
            question: "日本が国際連合に加盟したのは次のうちどの年ですか？",
            choices: [
                "1945年",
                "1960年",
                "1970年",
                "1956年"
            ],
            correctAnswerIndex: 3,
            explanation: "日本は1956年に国際連合に加盟しました。"
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
            question: "日本国憲法で、国民に課されている義務の一つは次のうちどれですか？",
            choices: [
                "投票の義務",
                "兵役の義務",
                "宗教の義務",
                "納税の義務"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法では、国民に納税の義務が課せられています。"
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
            question: "日本国憲法において、国会が持つ唯一の権限は次のうちどれですか？",
            choices: [
                "行政権",
                "司法権",
                "外交権",
                "立法権"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法では、国会が唯一の立法機関として定められています。"
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
            question: "日本国憲法で定められている『三権分立』のうち、行政権を担うのは次のうちどれですか？",
            choices: [
                "裁判所",
                "国会",
                "地方自治体",
                "内閣"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法では、内閣が行政権を担う機関とされています。"
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
            question: "国際連合の加盟国数が最も多くなった年は次のうちどれですか？",
            choices: [
                "1945年",
                "1956年",
                "1990年",
                "1960年"
            ],
            correctAnswerIndex: 3,
            explanation: "1960年は、多くのアフリカ諸国が独立し、国際連合に加盟しました。"
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
            question: "日本国憲法で定められている教育を受ける権利は、何歳まで保障されていますか？",
            choices: [
                "15歳",
                "18歳",
                "20歳",
                "義務教育終了まで"
            ],
            correctAnswerIndex: 3,
            explanation: "日本国憲法では、義務教育の終了まで教育を受ける権利が保障されています。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai6, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Shakai6ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai6ListView(isPresenting: .constant(false))
    }
}
