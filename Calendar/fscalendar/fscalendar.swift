//
//  fscalendar.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/02.
//

import SwiftUI
import FSCalendar
struct CalendarView: UIViewRepresentable {
    @Binding var selectedDate: Date?
    
    typealias UIViewType = FSCalendar
    
    func makeUIView(context: Context) -> UIViewType {
        
        let fsCalendar = FSCalendar()
        
        fsCalendar.delegate = context.coordinator // SwiftUI側でdidSetを呼び出せるようにする
        
        // 選択された日付のハイライトの色をカスタマイズ
        fsCalendar.appearance.selectionColor = UIColor.yellow // massColor
        fsCalendar.appearance.titleSelectionColor = UIColor.red // color of date word
        
        // 今日の日付のハイライトの色のオプション
        fsCalendar.appearance.todayColor = UIColor.green // todays massColor
        fsCalendar.appearance.titleTodayColor = UIColor.black // todays word color
    
        
        
        return fsCalendar
    }
    
    class Coordinator: NSObject, FSCalendarDelegate {
        var parent: CalendarView
        
        init(parent: CalendarView) {
            self.parent = parent
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
