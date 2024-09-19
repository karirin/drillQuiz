//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Kokugo2ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは夏休みの自由研究で…』",
            choices: [
                "植物を観察しました",
                "昆虫を集めました",
                "星を観察しました",
                "お城を作りました"
            ],
            correctAnswerIndex: 2,
            explanation: "夏休みの自由研究では、星の観察が人気のテーマです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうはお父さんと一緒に…』",
            choices: [
                "庭の手入れをしました",
                "釣りに行きました",
                "料理を作りました",
                "サッカーをしました"
            ],
            correctAnswerIndex: 1,
            explanation: "お父さんと一緒に釣りに行くことは楽しい休日の過ごし方です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは動物園で…』",
            choices: [
                "象にえさをあげました",
                "ライオンを見ました",
                "キリンを観察しました",
                "友達と遊びました"
            ],
            correctAnswerIndex: 1,
            explanation: "動物園ではライオンを見るのが人気のアトラクションです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日はたろうの誕生日なので…』",
            choices: [
                "友達を家に呼びました",
                "お母さんとケーキを作りました",
                "家族でパーティーをしました",
                "映画を見に行きました"
            ],
            correctAnswerIndex: 2,
            explanation: "誕生日には家族でパーティーを開くことがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうはキャンプで…』",
            choices: [
                "テントを張りました",
                "焚き火をしました",
                "山を登りました",
                "魚を釣りました"
            ],
            correctAnswerIndex: 1,
            explanation: "キャンプでは、焚き火を囲んで過ごすことが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは運動会で…』",
            choices: [
                "リレーに出場しました",
                "応援団に入りました",
                "友達と遊びました",
                "かけっこで一番になりました"
            ],
            correctAnswerIndex: 3,
            explanation: "運動会のかけっこで一番になると、とても誇らしいことです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは家族で旅行に行き…』",
            choices: [
                "ホテルに泊まりました",
                "海で泳ぎました",
                "山に登りました",
                "お土産を買いました"
            ],
            correctAnswerIndex: 0,
            explanation: "旅行に行くと、ホテルに泊まることが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日はお母さんと一緒にお料理をして…』",
            choices: [
                "カレーを作りました",
                "サラダを作りました",
                "クッキーを焼きました",
                "スープを作りました"
            ],
            correctAnswerIndex: 2,
            explanation: "お母さんと一緒にクッキーを焼くのは楽しい経験です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは冬休みに…』",
            choices: [
                "雪だるまを作りました",
                "友達と遊びました",
                "スキーに行きました",
                "図書館で本を借りました"
            ],
            correctAnswerIndex: 0,
            explanation: "冬休みには雪だるまを作ることがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは春休みに…』",
            choices: [
                "友達と公園で遊びました",
                "おじいちゃんの家に行きました",
                "お花見に行きました",
                "学校の宿題をしました"
            ],
            correctAnswerIndex: 2,
            explanation: "春休みには、お花見に行くのが一般的です。"
        ),
        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは動物園で…』",
            choices: [
                "キリンを見ました",
                "お弁当を食べました",
                "友達と遊びました",
                "走り回りました"
            ],
            correctAnswerIndex: 0,
            explanation: "動物園ではキリンや他の動物を見ることが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは海で…』",
            choices: [
                "泳ぎました",
                "砂のお城を作りました",
                "アイスクリームを食べました",
                "友達と遊びました"
            ],
            correctAnswerIndex: 1,
            explanation: "海では砂のお城を作ることがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは夏休みの間に…』",
            choices: [
                "友達と旅行に行きました",
                "山に登りました",
                "川で泳ぎました",
                "おばあちゃんの家に行きました"
            ],
            correctAnswerIndex: 3,
            explanation: "夏休みにおばあちゃんの家に行くことが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは夜空を見上げて…』",
            choices: [
                "星を数えました",
                "月を見ました",
                "花火を見ました",
                "流れ星を探しました"
            ],
            correctAnswerIndex: 2,
            explanation: "夏の夜には花火を見上げることが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは雨の日に…』",
            choices: [
                "家で絵を描きました",
                "友達と外で遊びました",
                "図書館に行きました",
                "お菓子を作りました"
            ],
            correctAnswerIndex: 0,
            explanation: "雨の日には、家で絵を描くことがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは学校で…』",
            choices: [
                "新しい友達を作りました",
                "本を読みました",
                "お弁当を食べました",
                "リレーに出ました"
            ],
            correctAnswerIndex: 1,
            explanation: "学校では本を読む時間があります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは家族と一緒に…』",
            choices: [
                "ピクニックに行きました",
                "お祭りに行きました",
                "映画を見ました",
                "夕食を食べました"
            ],
            correctAnswerIndex: 3,
            explanation: "家族と一緒に夕食を食べるのは日常的なことです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは友達と一緒に…』",
            choices: [
                "公園でサッカーをしました",
                "映画を見ました",
                "アイスクリームを食べました",
                "宿題をしました"
            ],
            correctAnswerIndex: 0,
            explanation: "友達と公園でサッカーをするのは一般的な遊びです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうはクリスマスに…』",
            choices: [
                "友達にプレゼントをあげました",
                "お母さんとケーキを作りました",
                "ツリーを飾りました",
                "外で雪遊びをしました"
            ],
            correctAnswerIndex: 2,
            explanation: "クリスマスには、ツリーを飾ることがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは新年に…』",
            choices: [
                "初詣に行きました",
                "お年玉をもらいました",
                "おせち料理を食べました",
                "凧をあげました"
            ],
            correctAnswerIndex: 1,
            explanation: "新年にはお年玉をもらうのが楽しみです。"
        ),
        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日は早く起きたので、たろうは…』",
            choices: [
                "友達と遊びました",
                "公園に行きました",
                "宿題を終わらせました",
                "テレビを見ました"
            ],
            correctAnswerIndex: 2,
            explanation: "早起きした日は、宿題を先に終わらせることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは友達と遊んでいると…』",
            choices: [
                "雨が降ってきました",
                "お菓子を食べました",
                "お母さんに呼ばれました",
                "先生が来ました"
            ],
            correctAnswerIndex: 0,
            explanation: "外で遊んでいるとき、急に雨が降ることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは夏休みに山に登って…』",
            choices: [
                "頂上でお弁当を食べました",
                "友達と遊びました",
                "海に行きました",
                "宿題をしました"
            ],
            correctAnswerIndex: 0,
            explanation: "山の頂上ではお弁当を食べることがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうはお母さんと一緒に買い物をして…』",
            choices: [
                "友達の家に行きました",
                "おもちゃを買ってもらいました",
                "公園で遊びました",
                "お昼ご飯を食べました"
            ],
            correctAnswerIndex: 1,
            explanation: "買い物の後、おもちゃを買ってもらうことがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『お父さんと釣りに行ったら、たろうは…』",
            choices: [
                "大きな魚を釣りました",
                "お弁当を食べました",
                "友達に魚をあげました",
                "何も釣れませんでした"
            ],
            correctAnswerIndex: 0,
            explanation: "釣りに行くと、大きな魚を釣ることが目標です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは夜遅くまで起きていたので…』",
            choices: [
                "学校に遅刻しました",
                "早起きしました",
                "宿題を忘れました",
                "先生に怒られました"
            ],
            correctAnswerIndex: 0,
            explanation: "夜遅くまで起きていると、翌朝学校に遅刻することがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは体育の授業で…』",
            choices: [
                "サッカーをしました",
                "走り回りました",
                "友達と遊びました",
                "プールに入りました"
            ],
            correctAnswerIndex: 3,
            explanation: "体育の授業では、プールに入ることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは宿題を早く終わらせて…』",
            choices: [
                "友達と遊びました",
                "公園に行きました",
                "テレビを見ました",
                "映画を見に行きました"
            ],
            correctAnswerIndex: 1,
            explanation: "宿題を終わらせた後、公園で遊ぶことがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは学校の運動会で…』",
            choices: [
                "リレーに出場しました",
                "お弁当を食べました",
                "友達と遊びました",
                "走り回りました"
            ],
            correctAnswerIndex: 0,
            explanation: "運動会ではリレーに出場することがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは今日、初めて…』",
            choices: [
                "友達の家に行きました",
                "自転車に乗りました",
                "宿題を終わらせました",
                "お菓子を作りました"
            ],
            correctAnswerIndex: 1,
            explanation: "初めて自転車に乗る経験は大きなイベントです。"
        ),
        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは誕生日に…』",
            choices: [
                "ケーキを食べました",
                "学校に行きました",
                "テレビを見ました",
                "宿題をしました"
            ],
            correctAnswerIndex: 0,
            explanation: "誕生日にはケーキを食べることが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは日曜日の朝に…』",
            choices: [
                "宿題をしました",
                "公園で遊びました",
                "おばあちゃんの家に行きました",
                "テレビを見ました"
            ],
            correctAnswerIndex: 3,
            explanation: "日曜日の朝にはテレビを見ることがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは友達の家に行って…』",
            choices: [
                "一緒に宿題をしました",
                "お菓子を食べました",
                "ゲームをしました",
                "テレビを見ました"
            ],
            correctAnswerIndex: 2,
            explanation: "友達の家に行くと、ゲームをすることがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは朝ごはんを食べ終わって…』",
            choices: [
                "学校に行きました",
                "友達と遊びました",
                "本を読みました",
                "公園に行きました"
            ],
            correctAnswerIndex: 0,
            explanation: "朝ごはんを食べ終わったら学校に行くのが普通です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『お母さんと一緒に買い物に行った後…』",
            choices: [
                "宿題をしました",
                "公園に行きました",
                "アイスクリームを食べました",
                "映画を見ました"
            ],
            correctAnswerIndex: 2,
            explanation: "買い物の後、アイスクリームを食べることが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは夏休みにおじいちゃんの家に行って…』",
            choices: [
                "畑で野菜を収穫しました",
                "友達と遊びました",
                "海に行きました",
                "ゲームをしました"
            ],
            correctAnswerIndex: 0,
            explanation: "おじいちゃんの家では、畑での活動が一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは冬休みに…』",
            choices: [
                "スキーに行きました",
                "友達と遊びました",
                "図書館に行きました",
                "宿題をしました"
            ],
            correctAnswerIndex: 0,
            explanation: "冬休みにはスキーに行くことがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうはお母さんと一緒に夕飯を作って…』",
            choices: [
                "家族で一緒に食べました",
                "お父さんと外で食べました",
                "友達を呼びました",
                "テレビを見ました"
            ],
            correctAnswerIndex: 0,
            explanation: "夕飯を作った後は、家族で一緒に食べることが普通です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは運動会の後で…』",
            choices: [
                "友達と遊びました",
                "お弁当を食べました",
                "疲れて寝ました",
                "宿題をしました"
            ],
            correctAnswerIndex: 2,
            explanation: "運動会の後は疲れて寝ることが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『雨が降っていたので、たろうは…』",
            choices: [
                "公園に行きました",
                "家で遊びました",
                "傘を持って出かけました",
                "友達の家に行きました"
            ],
            correctAnswerIndex: 1,
            explanation: "雨の日は家で遊ぶことが多いです。"
        ),
        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは今日、初めて…』",
            choices: [
                "自転車に乗りました",
                "テレビを見ました",
                "友達とけんかしました",
                "学校に行きました"
            ],
            correctAnswerIndex: 0,
            explanation: "初めて自転車に乗る経験はよくあることです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは図書館で本を借りて…』",
            choices: [
                "家で読書をしました",
                "そのまま本を返しました",
                "友達に貸しました",
                "学校に持って行きました"
            ],
            correctAnswerIndex: 0,
            explanation: "図書館で本を借りたら、家で読むことが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは朝早く起きて…』",
            choices: [
                "公園に走りに行きました",
                "お弁当を作りました",
                "テレビを見ました",
                "宿題をしました"
            ],
            correctAnswerIndex: 3,
            explanation: "朝早く起きたら、宿題をすることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日はおばあちゃんの家に行って…』",
            choices: [
                "お菓子をもらいました",
                "ゲームをしました",
                "宿題をしました",
                "公園で遊びました"
            ],
            correctAnswerIndex: 0,
            explanation: "おばあちゃんの家に行ったら、お菓子をもらうことがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは夕ご飯の後で…』",
            choices: [
                "友達と遊びました",
                "宿題をしました",
                "お風呂に入りました",
                "公園に行きました"
            ],
            correctAnswerIndex: 2,
            explanation: "夕ご飯の後にはお風呂に入ることが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは運動会のリレーで…』",
            choices: [
                "転んでしまいました",
                "一番になりました",
                "友達とけんかしました",
                "途中でやめました"
            ],
            correctAnswerIndex: 1,
            explanation: "運動会のリレーで一番になることは嬉しい出来事です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『お母さんが忙しかったので、たろうは…』",
            choices: [
                "お手伝いをしました",
                "テレビを見ました",
                "お菓子を食べました",
                "宿題をしました"
            ],
            correctAnswerIndex: 0,
            explanation: "お母さんが忙しいときは、お手伝いをすることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは家族みんなで出かけて…』",
            choices: [
                "映画を見ました",
                "動物園に行きました",
                "友達に会いました",
                "旅行に行きました"
            ],
            correctAnswerIndex: 1,
            explanation: "家族で動物園に行くことは楽しいイベントです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『雨が降り始めたので、たろうは…』",
            choices: [
                "家に帰りました",
                "傘をさしました",
                "雨の中で遊びました",
                "友達の家に行きました"
            ],
            correctAnswerIndex: 1,
            explanation: "雨が降り始めたときは傘をさすのが普通です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは学校の休み時間に…』",
            choices: [
                "教室で本を読みました",
                "友達と鬼ごっこをしました",
                "おやつを食べました",
                "外に出ました"
            ],
            correctAnswerIndex: 1,
            explanation: "休み時間に友達と鬼ごっこをするのは楽しい活動です。"
        ),
        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日はお母さんと公園に行きました。そこで…』",
            choices: [
                "友達に会いました",
                "一緒にアイスクリームを食べました",
                "犬と遊びました",
                "自転車に乗りました"
            ],
            correctAnswerIndex: 1,
            explanation: "公園では一緒にアイスクリームを食べることがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは学校から帰ってくると…』",
            choices: [
                "宿題を始めました",
                "ゲームをしました",
                "友達の家に行きました",
                "テレビを見ました"
            ],
            correctAnswerIndex: 0,
            explanation: "学校から帰ってくると宿題をすることがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『朝ごはんを食べ終えた後、たろうは…』",
            choices: [
                "遊びに行きました",
                "学校に行きました",
                "本を読みました",
                "お母さんを手伝いました"
            ],
            correctAnswerIndex: 1,
            explanation: "朝ごはんを食べた後、学校に行くのが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『お正月には家族みんなで…』",
            choices: [
                "ゲームをしました",
                "旅行に行きました",
                "おせち料理を食べました",
                "お風呂に入りました"
            ],
            correctAnswerIndex: 2,
            explanation: "お正月には家族でおせち料理を食べることが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは夏休みに…』",
            choices: [
                "海に行きました",
                "図書館で勉強しました",
                "山に登りました",
                "友達と映画を見ました"
            ],
            correctAnswerIndex: 0,
            explanation: "夏休みには海に行くことが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『学校が終わった後、たろうは…』",
            choices: [
                "公園に行きました",
                "図書館で本を読みました",
                "友達の家に行きました",
                "家に帰りました"
            ],
            correctAnswerIndex: 1,
            explanation: "学校が終わった後、図書館で本を読むことがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『雨が降ってきたので…』",
            choices: [
                "傘をさしました",
                "家に走って帰りました",
                "濡れながら遊びました",
                "友達と別れました"
            ],
            correctAnswerIndex: 0,
            explanation: "雨が降ってきたら、傘をさすことが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは友達と一緒に…』",
            choices: [
                "ゲームをしました",
                "公園でサッカーをしました",
                "一緒に宿題をしました",
                "映画を見ました"
            ],
            correctAnswerIndex: 1,
            explanation: "友達と一緒に公園でサッカーをすることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日はとても寒かったので…』",
            choices: [
                "厚いコートを着ました",
                "外で遊びました",
                "窓を開けました",
                "氷を食べました"
            ],
            correctAnswerIndex: 0,
            explanation: "寒い日には、厚いコートを着ることが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『学校の運動会で、たろうは…』",
            choices: [
                "走り回りました",
                "お弁当を食べました",
                "本を読みました",
                "友達と遊びました"
            ],
            correctAnswerIndex: 1,
            explanation: "運動会では、お弁当を食べることが一般的です。"
        ),
        QuizQuestion(
            question: "次の文に続くものはどれですか？『学校の遠足で、たろうは…』",
            choices: [
                "一日中寝ていました",
                "お弁当を食べました",
                "ボールで遊びました",
                "友達とけんかしました"
            ],
            correctAnswerIndex: 1,
            explanation: "遠足ではお弁当を食べるのが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは自転車で公園に行きました。そこで…』",
            choices: [
                "友達と会いました",
                "犬と遊びました",
                "お昼寝をしました",
                "走り回りました"
            ],
            correctAnswerIndex: 0,
            explanation: "公園では友達と会うことが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日は晴れたので、みんなで…』",
            choices: [
                "家にこもっていました",
                "運動をしました",
                "映画を見ました",
                "ゲームをしました"
            ],
            correctAnswerIndex: 1,
            explanation: "晴れた日は運動することが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『夕飯を食べた後、たろうは…』",
            choices: [
                "すぐに寝ました",
                "勉強をしました",
                "テレビを見ました",
                "友達と遊びました"
            ],
            correctAnswerIndex: 2,
            explanation: "夕飯の後には、テレビを見ることが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうはお店でお母さんと一緒に…』",
            choices: [
                "友達に会いました",
                "おもちゃを買いました",
                "走り回りました",
                "本を読みました"
            ],
            correctAnswerIndex: 1,
            explanation: "お店でお母さんと一緒にいるときに、おもちゃを買うことがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『運動会で、たろうは…』",
            choices: [
                "たくさん走りました",
                "お弁当を食べました",
                "家でゲームをしました",
                "本を読みました"
            ],
            correctAnswerIndex: 0,
            explanation: "運動会では、たくさん走ることが普通です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『土曜日の午後、たろうは…』",
            choices: [
                "学校に行きました",
                "遊びに行きました",
                "テレビを見ました",
                "掃除をしました"
            ],
            correctAnswerIndex: 1,
            explanation: "土曜日の午後は、遊びに行くことが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは風邪をひいたので…』",
            choices: [
                "公園で遊びました",
                "お医者さんに行きました",
                "友達と遊びました",
                "家でテレビを見ました"
            ],
            correctAnswerIndex: 1,
            explanation: "風邪をひいたときは、お医者さんに行くことが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは今日はたくさん勉強したので…』",
            choices: [
                "テレビを見ました",
                "早く寝ました",
                "友達と遊びました",
                "公園に行きました"
            ],
            correctAnswerIndex: 1,
            explanation: "たくさん勉強した後、早く寝ることが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは雨の日に…』",
            choices: [
                "外で遊びました",
                "本を読みました",
                "映画を見ました",
                "お菓子を買いました"
            ],
            correctAnswerIndex: 2,
            explanation: "雨の日は、映画を見ることが多いです。"
        ),
        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは学校の帰り道で…』",
            choices: [
                "友達と会いました",
                "公園で遊びました",
                "お菓子を買いました",
                "家に帰りました"
            ],
            correctAnswerIndex: 2,
            explanation: "学校の帰りにお菓子を買うことはよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日はお父さんと一緒に…』",
            choices: [
                "公園に行きました",
                "宿題をしました",
                "掃除をしました",
                "買い物に行きました"
            ],
            correctAnswerIndex: 3,
            explanation: "お父さんと一緒に買い物に行くことがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『日曜日の午後、たろうは…』",
            choices: [
                "友達と遊びました",
                "本を読みました",
                "映画を見ました",
                "昼寝をしました"
            ],
            correctAnswerIndex: 3,
            explanation: "日曜日の午後は、昼寝をすることがよくあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日はたくさん運動したので…』",
            choices: [
                "家に帰りました",
                "たくさんご飯を食べました",
                "友達と遊びました",
                "映画を見ました"
            ],
            correctAnswerIndex: 1,
            explanation: "運動をたくさんした後は、たくさんご飯を食べることが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『お母さんが料理を作っている間、たろうは…』",
            choices: [
                "宿題をしていました",
                "テレビを見ていました",
                "本を読んでいました",
                "手伝いをしていました"
            ],
            correctAnswerIndex: 3,
            explanation: "お母さんが料理を作っている間、手伝いをすることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『朝ごはんを食べた後、たろうは…』",
            choices: [
                "家で遊びました",
                "学校に行きました",
                "テレビを見ました",
                "おやつを食べました"
            ],
            correctAnswerIndex: 1,
            explanation: "朝ごはんの後は、通常学校に行くことが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日は友達と約束していたので…』",
            choices: [
                "宿題をしました",
                "学校に行きました",
                "一緒に遊びました",
                "映画を見ました"
            ],
            correctAnswerIndex: 2,
            explanation: "友達と約束していた場合、一緒に遊ぶことが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『遠足に行った日は、たろうは…』",
            choices: [
                "家で寝ていました",
                "友達と遊びました",
                "お弁当を食べました",
                "先生にほめられました"
            ],
            correctAnswerIndex: 2,
            explanation: "遠足の日は、お弁当を食べるのが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日は図書館で本を借りたあと…』",
            choices: [
                "友達と遊びました",
                "本を読みました",
                "お昼ごはんを食べました",
                "家に帰りました"
            ],
            correctAnswerIndex: 1,
            explanation: "図書館で本を借りた後、すぐに読むことがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日は雨が降っていたので…』",
            choices: [
                "家で寝ていました",
                "傘を持って出かけました",
                "友達と遊びました",
                "映画を見ました"
            ],
            correctAnswerIndex: 1,
            explanation: "雨の日は、傘を持って出かけることが普通です。"
        ),
        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日は寒かったので、たろうは…』",
            choices: [
                "薄着で外に出ました",
                "コートを着ました",
                "泳ぎに行きました",
                "窓を開けました"
            ],
            correctAnswerIndex: 1,
            explanation: "寒い日はコートを着るのが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『家の中でずっと遊んでいたので、たろうは…』",
            choices: [
                "外に遊びに行きました",
                "眠くなりました",
                "学校に行きました",
                "おやつを食べました"
            ],
            correctAnswerIndex: 1,
            explanation: "家の中で長時間遊ぶと、眠くなることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『太郎は友達とサッカーをしていました。すると…』",
            choices: [
                "家に帰りました",
                "雨が降ってきました",
                "ボールを忘れました",
                "みんなで走りました"
            ],
            correctAnswerIndex: 2,
            explanation: "サッカーをしているとき、ボールを忘れることがあるかもしれません。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『学校が終わったあと、たろうは…』",
            choices: [
                "宿題をしました",
                "友達の家に行きました",
                "家でテレビを見ました",
                "図書館に行きました"
            ],
            correctAnswerIndex: 3,
            explanation: "学校の後、たろうは図書館に行ったという内容が自然です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『夏休みになったので、たろうは…』",
            choices: [
                "学校に行きました",
                "宿題を始めました",
                "海に行きました",
                "勉強しました"
            ],
            correctAnswerIndex: 2,
            explanation: "夏休みには海に行くのが一般的な活動です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日はみんなで大掃除をして、最後に…』",
            choices: [
                "学校を出ました",
                "おやつを食べました",
                "授業を受けました",
                "先生にほめられました"
            ],
            correctAnswerIndex: 3,
            explanation: "みんなで大掃除をした後、先生にほめられることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日はとても暑かったので、みんなで…』",
            choices: [
                "勉強をしました",
                "アイスクリームを食べました",
                "お風呂に入りました",
                "遊びに行きました"
            ],
            correctAnswerIndex: 1,
            explanation: "暑い日には、みんなでアイスクリームを食べることが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『運動会の日、たろうは…』",
            choices: [
                "家で寝ていました",
                "走り回っていました",
                "本を読んでいました",
                "家でテレビを見ていました"
            ],
            correctAnswerIndex: 1,
            explanation: "運動会では、走り回ることが通常の活動です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日は久しぶりに友達に会ったので、みんなで…』",
            choices: [
                "遊びました",
                "ケンカをしました",
                "家に帰りました",
                "勉強をしました"
            ],
            correctAnswerIndex: 0,
            explanation: "久しぶりに会った友達とは、遊ぶことが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『お母さんと一緒にお出かけをして、最後に…』",
            choices: [
                "走り回りました",
                "公園に行きました",
                "買い物をしました",
                "お昼ご飯を食べました"
            ],
            correctAnswerIndex: 2,
            explanation: "お出かけの最後には、買い物をすることがよくあります。"
        ),
        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日は雨が降っていました。だから…』",
            choices: [
                "傘を持って出かけました",
                "外で遊びました",
                "泳ぎに行きました",
                "友達の家に泊まりました"
            ],
            correctAnswerIndex: 0,
            explanation: "雨の日は傘を持って出かけることが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『山に登ったあと、たろうは…』",
            choices: [
                "お昼ご飯を食べました",
                "山を降り始めました",
                "友達と遊びました",
                "映画を見ました"
            ],
            correctAnswerIndex: 1,
            explanation: "山に登った後は通常、山を降り始めます。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『教室で静かにしていたので、先生は…』",
            choices: [
                "みんなにお菓子をくれました",
                "授業を始めました",
                "全員を叱りました",
                "家に帰しました"
            ],
            correctAnswerIndex: 1,
            explanation: "教室で静かにしていると、先生は通常授業を始めます。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『みんなで協力して掃除をしたので、教室は…』",
            choices: [
                "とてもきれいになりました",
                "ごちゃごちゃになりました",
                "だれも掃除をしませんでした",
                "誰かが倒れました"
            ],
            correctAnswerIndex: 0,
            explanation: "協力して掃除をすれば、教室はきれいになります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『今日は早く寝たので、明日…』",
            choices: [
                "元気に学校に行けるでしょう",
                "遅刻するでしょう",
                "朝ごはんを食べないでしょう",
                "眠れないでしょう"
            ],
            correctAnswerIndex: 0,
            explanation: "早く寝た場合、次の日は元気に過ごせることが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『たろうは絵を描いていました。すると…』",
            choices: [
                "友達がやってきました",
                "絵を破りました",
                "泣き出しました",
                "本を読みました"
            ],
            correctAnswerIndex: 0,
            explanation: "絵を描いているときに友達が来ることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『ゆうこは家に帰るとすぐに…』",
            choices: [
                "宿題を始めました",
                "お風呂に入りました",
                "テレビを見ました",
                "ご飯を食べました"
            ],
            correctAnswerIndex: 2,
            explanation: "家に帰るとテレビを見る子どもが多いです。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『友達と公園で遊んでいました。すると…』",
            choices: [
                "雨が降り始めました",
                "家に帰りました",
                "先生が来ました",
                "犬がやってきました"
            ],
            correctAnswerIndex: 3,
            explanation: "公園では、犬が散歩に来ることがあります。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『動物園に行ったら、たろうは…』",
            choices: [
                "ライオンを見ました",
                "ご飯を食べました",
                "友達と遊びました",
                "お菓子を買いました"
            ],
            correctAnswerIndex: 0,
            explanation: "動物園に行くと、ライオンなどの動物を見るのが一般的です。"
        ),

        QuizQuestion(
            question: "次の文に続くものはどれですか？『まいこは新しい靴を買いました。その後…』",
            choices: [
                "すぐに外に出かけました",
                "友達に靴をあげました",
                "靴を捨てました",
                "学校に行きました"
            ],
            correctAnswerIndex: 0,
            explanation: "新しい靴を買ったら、すぐに履いて外に出かけることがよくあります。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .kokugo2, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Kokugo2ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo2ListView(isPresenting: .constant(false))
    }
}
