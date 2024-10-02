//
//  fscalendar.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/02.
//

import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        typealias UIViewType = FSCalendar
        
        let fsCalendar = FSCalendar()
        
        // 選択された日付のハイライトの色をカスタマイズ
        fsCalendar.appearance.selectionColor = UIColor.yellow // massColor
        fsCalendar.appearance.titleSelectionColor = UIColor.red // color of date word
        
        // 今日の日付のハイライトの色のオプション
        fsCalendar.appearance.todayColor = UIColor.green // todays massColor
        fsCalendar.appearance.titleTodayColor = UIColor.black // todays word color
    
        
        
        return fsCalendar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
//        
    }
}
