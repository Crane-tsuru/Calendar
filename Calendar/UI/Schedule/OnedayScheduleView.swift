//
//  OnedayScheduleView.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/02.
//

import SwiftUI

struct OnedayScheduleView: View {
    let column = [GridItem()]
    private let onedayHours = 24
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: column, alignment: .leading) {
                ForEach(0...onedayHours, id: \.self) { hour in
                    ScheduleGrid(hour: hour)
                }
            }
        }
    }
}

#Preview {
    OnedayScheduleView()
}


