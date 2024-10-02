//
//  ScheduleGridView.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/02.
//

import SwiftUI

struct ScheduleGridView: View {
    let hour: Int
    
    var body: some View {
        HStack {
            Text(String(hour)+":00")
                .padding(.leading, 1)
            VStack {
                Divider()
            }
        }.padding()
    }
}

#Preview {
    ScheduleGridView(hour: 9)
}
