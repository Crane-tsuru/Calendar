//
//  SwiftUIView.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/11/11.
//

import SwiftUI

struct ScrollingScheduleView: View {
    
    private let timeStringManager = TimeStringManager()
    
    private let cellWidth: CGFloat = 70
    
    private let cellHeight: CGFloat = 50
    
    private let dateList: [String] = (1...7).map { String(format: "%2d", $0) }
    
    
    @State private var offset = CGPoint.zero
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 0) {
                // empty corner
                Color.clear.frame(width: cellWidth, height: cellHeight)
                ScrollView([.vertical]) {
                    rowsHeader
                        .offset(y: offset.y)
                }
                .disabled(true)
                .scrollIndicators(.hidden)
            }
            VStack(alignment: .leading, spacing: 0) {
                ScrollView([.horizontal]) {
                    colsHeader
                        .offset(x: offset.x)
                }
                .disabled(true)

                table
                    .coordinateSpace(name: "scroll")
            }
        }
        .padding()
    }
    
    var colsHeader: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(dateList, id: \.self) { date in
                Text(date)
                    .foregroundColor(.blue)
                    .font(.caption)
                    .frame(width: cellWidth, height: cellHeight)
                    .border(Color.blue)
            }
        }
    }
    
    var rowsHeader: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(timeStringManager.getHoursOneDate(), id:\.self) { hour in
                Text(hour)
                    .foregroundColor(.secondary)
                    .font(.caption)
                    .frame(width: cellWidth, height: cellHeight)
                    .border(Color.blue)
            }
        }
    }
    
    var table: some View {
        ScrollView([.vertical, .horizontal]) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0...timeStringManager.hours, id: \.self) { row in
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(0..<dateList.count, id: \.self) { col in
                            // Cell
                            Text("(\(row), \(col))")
                                .frame(width: cellWidth, height: cellHeight)
                                .border(Color.blue)
                                .id("\(row)_\(col)")
                        }
                    }
                }
            }
            .background( GeometryReader { geo in
                Color.clear
                    .preference(key: ViewOffsetKey.self, value: geo.frame(in: .named("scroll")).origin)
            })
            .onPreferenceChange(ViewOffsetKey.self) { value in
                print("offset >> \(value)")
                offset = value
            }
        }
    }
    
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGPoint
    static var defaultValue = CGPoint.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.x += nextValue().x
        value.y += nextValue().y
    }
}

#Preview {
    ScrollingScheduleView()
}
