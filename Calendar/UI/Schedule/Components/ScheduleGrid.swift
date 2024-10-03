//
//  ScheduleGridView.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/02.
//

import SwiftUI

struct ScheduleGrid: View {
    let hour: Int
    
    var event: String?
    
    var body: some View {
        VStack {
            HStack {
                Text(String(hour)+":00")
                    .padding(.leading, 1)
                VStack {
                    Divider()
                }
            }.padding()
            
            Text(event ?? "")
        }
    }
}

#Preview {
    ScheduleGrid(hour: 9)
}
