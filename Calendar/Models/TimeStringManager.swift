//
//  TimeStringListGetter.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/11/13.
//

final class TimeStringManager {
    let hours = 24
    
    func getHoursOneDate() -> [String] {
        
        let hoursList = (0...hours).map { String(format: "%02d:00", $0) }
        
        return hoursList
    }
}
