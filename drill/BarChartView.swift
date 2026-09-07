//
//  BarChartView.swift
//  moneyQuiz
//
//  Created by hashimo ryoya on 2023/12/20.
//

import SwiftUI
import Firebase

struct DailyData {
    let date: String
    let count: Int

    init(date: Date, count: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.date = dateFormatter.string(from: date)
        self.count = count
    }
}

struct BarChartView: View {
    @ObservedObject var authManager: AuthManager
    @State private var currentDate = Date()
    @State var data: [DailyData] = []
    @State private var isDataAvailable = false
    @State private var isLoading: Bool = true
    @State private var loadedMonthKey = ""
    @State private var animateChart = false

    private var displayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d"
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter
    }

    private var yearMonthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年 M月"
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter
    }

    private var monthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "M月"
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter
    }

    private var fullDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "M月 d日"
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter
    }

    private var chartData: [DailyData] {
        data.isEmpty ? placeholderMonthData : data
    }

    private var totalAnswers: Int {
        data.reduce(0) { $0 + $1.count }
    }

    private var activeDayCount: Int {
        data.filter { $0.count > 0 }.count
    }

    private var bestDayCount: Int {
        data.map(\.count).max() ?? 0
    }

    private var maxMonthlyCount: Int {
        max(chartData.map(\.count).max() ?? 0, 1)
    }

    private var placeholderMonthData: [DailyData] {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        guard
            let startDate = calendar.date(from: DateComponents(year: year, month: month)),
            let range = calendar.range(of: .day, in: .month, for: startDate)
        else {
            return []
        }

        return range.map { day in
            let date = calendar.date(from: DateComponents(year: year, month: month, day: day)) ?? currentDate
            return DailyData(date: date, count: 0)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            monthHeader

            if isLoading {
                loadingCard
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        graphCard

                        if isDataAvailable {
                            summaryCard
                            dailyListCard
                        } else {
                            noDataCard
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 18)
                    .padding(.bottom, 100)
                }
            }
        }
        .background(Color.clear)
        .gesture(monthSwipeGesture)
        .onAppear {
            loadCurrentMonth()
        }
    }

    private var monthHeader: some View {
        HStack(spacing: 16) {
            monthButton(systemName: "chevron.left", direction: -1)

            Spacer()

            VStack(spacing: 4) {
                Text("学習記録")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.secondary)
                Text(yearMonthFormatter.string(from: currentDate))
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(AnalysisTheme.ink)
            }

            Spacer()

            monthButton(systemName: "chevron.right", direction: 1)
        }
        .padding(.horizontal, 20)
        .padding(.top, 18)
        .padding(.bottom, 8)
    }

    private func monthButton(systemName: String, direction: Int) -> some View {
        Button {
            generateHapticFeedback()
            changeMonth(by: direction)
        } label: {
            Image(systemName: systemName)
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .background(AnalysisTheme.primaryGradient, in: Circle())
                .shadow(color: AnalysisTheme.primary.opacity(0.22), radius: 8, y: 4)
        }
        .buttonStyle(.plain)
    }

    private var loadingCard: some View {
        VStack(spacing: 16) {
            ActivityIndicator()
            Text("読み込み中")
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.secondary)
        }
        .padding(28)
        .background(AnalysisTheme.card, in: RoundedRectangle(cornerRadius: 24))
        .shadow(color: AnalysisTheme.primary.opacity(0.12), radius: 16, x: 0, y: 8)
        .padding(.horizontal, 20)
    }

    private var graphCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(AnalysisTheme.primaryGradient)
                        .frame(width: 48, height: 48)
                    Image(systemName: "chart.bar.fill")
                        .font(.system(size: 21, weight: .bold))
                        .foregroundStyle(.white)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text("学習グラフ")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(AnalysisTheme.ink)
                    Text("合計 \(totalAnswers)問")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }

            GeometryReader { geometry in
                let barWidth = calculatedBarWidth(in: geometry.size.width)
                let maxHeight = geometry.size.height - 28

                HStack(alignment: .bottom, spacing: 4) {
                    ForEach(Array(chartData.enumerated()), id: \.offset) { index, item in
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(
                                    item.count > 0
                                    ? AnyShapeStyle(AnalysisTheme.primaryGradient)
                                    : AnyShapeStyle(Color.gray.opacity(0.18))
                                )
                                .frame(
                                    width: barWidth,
                                    height: animateChart ? barHeight(for: item.count, maxHeight: maxHeight) : 8
                                )
                                .shadow(
                                    color: item.count > 0 ? AnalysisTheme.primary.opacity(0.18) : .clear,
                                    radius: 4,
                                    y: 2
                                )

                            Text(dayLabel(for: item.date, index: index))
                                .font(.system(size: 9, weight: .medium))
                                .foregroundStyle(.secondary)
                                .frame(width: barWidth + 4)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            .frame(height: 210)
        }
        .padding(20)
        .background(AnalysisTheme.card, in: RoundedRectangle(cornerRadius: 24))
        .shadow(color: AnalysisTheme.primary.opacity(0.12), radius: 16, x: 0, y: 8)
        .onAppear {
            withAnimation(.easeOut(duration: 0.75)) {
                animateChart = true
            }
        }
    }

    private var summaryCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("学習サマリー")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(AnalysisTheme.ink)

            HStack(spacing: 12) {
                summaryMetric(title: "月間回答数", value: "\(totalAnswers)", icon: "pencil", color: AnalysisTheme.primary)
                summaryMetric(title: "学習日数", value: "\(activeDayCount)", icon: "calendar", color: AnalysisTheme.green)
                summaryMetric(title: "最高回答", value: "\(bestDayCount)", icon: "flame.fill", color: AnalysisTheme.secondary)
            }
        }
        .padding(22)
        .background(AnalysisTheme.card, in: RoundedRectangle(cornerRadius: 24))
        .shadow(color: AnalysisTheme.primary.opacity(0.08), radius: 18, y: 8)
    }

    private func summaryMetric(title: String, value: String, icon: String, color: Color) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)
            Text(value)
                .font(.title2.bold())
                .foregroundStyle(AnalysisTheme.ink)
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(color.opacity(0.08), in: RoundedRectangle(cornerRadius: 16))
    }

    private var dailyListCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Label("日別回答数", systemImage: "calendar")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(AnalysisTheme.ink)
                Spacer()
            }

            VStack(spacing: 0) {
                ForEach(data.filter { $0.count > 0 }, id: \.date) { item in
                    HStack {
                        Text(formattedDate(from: item.date))
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(AnalysisTheme.ink)
                        Spacer()
                        Text("\(item.count)")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(AnalysisTheme.primary)
                        Text("問")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 12)

                    if item.date != data.filter({ $0.count > 0 }).last?.date {
                        Divider()
                    }
                }
            }
        }
        .padding(18)
        .background(AnalysisTheme.card, in: RoundedRectangle(cornerRadius: 24))
        .shadow(color: AnalysisTheme.primary.opacity(0.1), radius: 14, x: 0, y: 8)
    }

    private var noDataCard: some View {
        VStack(spacing: 14) {
            Image("ライムグラフ")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
            Text("\(monthFormatter.string(from: currentDate))はデータがありません")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(AnalysisTheme.ink)
            Text("問題を解くと、ここに毎日の回答数が表示されます")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(AnalysisTheme.card, in: RoundedRectangle(cornerRadius: 24))
        .shadow(color: AnalysisTheme.primary.opacity(0.1), radius: 14, x: 0, y: 8)
    }

    private var monthSwipeGesture: some Gesture {
        DragGesture()
            .onEnded { gesture in
                if gesture.translation.width > 50 {
                    changeMonth(by: -1)
                } else if gesture.translation.width < -50 {
                    changeMonth(by: 1)
                }
            }
    }

    private func calculatedBarWidth(in width: CGFloat) -> CGFloat {
        let count = CGFloat(max(chartData.count, 1))
        let totalSpacing = CGFloat(max(chartData.count - 1, 0)) * 4
        return max(5, min(12, (width - totalSpacing) / count))
    }

    private func barHeight(for count: Int, maxHeight: CGFloat) -> CGFloat {
        guard count > 0 else { return 8 }
        let ratio = CGFloat(count) / CGFloat(maxMonthlyCount)
        return max(18, maxHeight * ratio)
    }

    private func dayLabel(for dateString: String, index: Int) -> String {
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        let day = Calendar.current.component(.day, from: date)
        return day == 1 || day % 5 == 0 || index == chartData.count - 1 ? "\(day)" : ""
    }

    func formattedDate(from dateString: String) -> String {
        if let date = dateFormatter.date(from: dateString) {
            return fullDateFormatter.string(from: date)
        }
        return ""
    }

    func isSmallDevice() -> Bool {
        return UIScreen.main.bounds.width < 390
    }

    static func createSampleData() -> [DailyData] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return [
            DailyData(date: dateFormatter.date(from: "2023-12-01")!, count: 10),
            DailyData(date: dateFormatter.date(from: "2023-12-02")!, count: 15),
            DailyData(date: dateFormatter.date(from: "2023-12-03")!, count: 20)
        ]
    }

    private var dataFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }

    func displayDate(from dateString: String) -> String {
        if let date = dataFormatter.date(from: dateString) {
            return displayFormatter.string(from: date)
        }
        return ""
    }

    func shouldDisplayLabel(for date: Date) -> Bool {
        let calendar = Calendar.current
        let dayComponent = calendar.component(.day, from: date)
        return [1, 6, 11, 16, 21, 26].contains(dayComponent)
    }

    func changeMonth(by months: Int) {
        if let newDate = Calendar.current.date(byAdding: .month, value: months, to: currentDate) {
            currentDate = newDate
            animateChart = false
            loadCurrentMonth(force: true)
        }
    }

    private func loadCurrentMonth(force: Bool = false) {
        guard let userId = authManager.currentUserId else {
            data = []
            isDataAvailable = false
            isLoading = false
            loadedMonthKey = ""
            animateChart = true
            return
        }

        fetchData(userId: userId, for: currentDate, force: force)
    }

    func fetchData(userId: String, for date: Date, force: Bool = false) {
        let ref = Database.database().reference(withPath: "answers").child(userId)
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let monthKey = monthKeyFormatter.string(from: date)

        if !force, monthKey == loadedMonthKey, !isLoading {
            return
        }

        let dateComponents = DateComponents(year: year, month: month)
        let startDate = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        isLoading = true
        loadedMonthKey = monthKey

        ref.observeSingleEvent(of: .value) { snapshot in
            var dailyTotals = [String: Int]()

            if let userDict = snapshot.value as? [String: Any] {
                for (_, categoryDict) in userDict {
                    if let categoryDict = categoryDict as? [String: Any] {
                        for (date, count) in categoryDict {
                            if let count = count as? Int {
                                dailyTotals[date, default: 0] += count
                            }
                        }
                    }
                }
            }

            let monthlyData = range.map { day -> DailyData in
                let dateComponents = DateComponents(year: year, month: month, day: day)
                let date = Calendar.current.date(from: dateComponents)!
                let count = dailyTotals[dateFormatter.string(from: date)] ?? 0
                return DailyData(date: date, count: count)
            }

            DispatchQueue.main.async {
                self.data = monthlyData
                self.isDataAvailable = monthlyData.contains { $0.count > 0 }
                self.isLoading = false
                withAnimation(.easeOut(duration: 0.75)) {
                    self.animateChart = true
                }
            }
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }

    private var monthKeyFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        return formatter
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleData = createSampleData()

        ZStack {
            AnalysisTheme.backgroundGradient.ignoresSafeArea()
            BarChartView(authManager: AuthManager(), data: sampleData)
        }
    }

    static func createSampleData() -> [DailyData] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return [
            DailyData(date: dateFormatter.date(from: "2023-12-01")!, count: 10),
            DailyData(date: dateFormatter.date(from: "2023-12-02")!, count: 15),
            DailyData(date: dateFormatter.date(from: "2023-12-03")!, count: 20)
        ]
    }
}
