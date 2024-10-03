//
//  ContentView.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/02.
//

import SwiftUI

struct ContentView: View {
    @State var selectedDate: Date
    
    var body: some View {
        VStack {
            CalendarView(selectedDate: $selectedDate)
                .frame(height: 500)
            
            Text(selectedDate.convertDateToString())
        }
    }
}

#Preview {
    ContentView(selectedDate: Date())
}
