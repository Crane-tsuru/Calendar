//
//  AkatukiView.swift
//  Calendar
//
//  Created by yamamotokento on 2024/10/07.
//

import SwiftUI

struct AkatukiView: View {
    @State private var selectedDate = Date()
    @State private var hours = Array(0...23)
    
    var body: some View{
        NavigationView{
            VStack{
//                週の日付のビュー
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(getWeekDates(), id: \ .self) { date in
                            VStack {
                                Text(getWeekdayItem(from: date))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(getDay(from: date))
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(date == selectedDate ? .red : .black)
                            }
                            .padding()
                            .background(date == selectedDate ? Color.red.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedDate = date
                            }
                        }
                    }
                    .padding()
                }
//                1日のスケジュールのビュー
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(hours, id: \ .self) { hour in
                            HStack {
                                Text("\(hour):00")
                                    .font(.subheadline)
                                    .frame(width: 50, alignment: .leading)
                                    .foregroundColor(.gray)
                                Divider()
                                Spacer()
                            }
                            .frame(height: 60)
                        }
                    }
                    .padding(.leading, 16)
                }
                Spacer()
            }
        }
    }
    
//    週の日付の取得
    private func getWeekDates() -> [Date] {
        let calendar = Calendar.current
        var dates = [Date]()
        for i in -3...3 {
            if let date = calendar.date(byAdding: .day, value: i, to: Date()) {
                dates.append(date)
            }
        }
        return dates
    }
    
//    月火水とかの取得
    private func getWeekdayItem(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }
    
//    月の日付取得
    private func getDay(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
}

#Preview {
    AkatukiView()
}
