//
//  LeftSheetView.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/03.
//

import SwiftUI


struct LeftSheetView: View {
    @Binding var isShowModal: Bool
    
    @Binding var viewSelector: ViewSelect

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack {
                    Text("AI スケジューラ")
                        .font(.largeTitle)
                    Spacer()
                }
                .padding(.top, 60)
                .padding(.leading)
                
                
                Divider()
                
                LeftSheetButton(systemName: .calendar, viewSelector: $viewSelector, destination: .calendar, toggle: $isShowModal, buttonTitle: "カレンダー")
                
                LeftSheetButton(systemName: .list_bullet, viewSelector: $viewSelector, destination: .oneday, toggle: $isShowModal, buttonTitle: "1日")
                
                
                Spacer()
            }
            .frame(width: geometry.size.width * 0.75) // 画面幅の75%のシート
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .offset(x: 0)
            .edgesIgnoringSafeArea(.all)
        }
    }
}


#Preview {
    LeftSheetView(isShowModal: .constant(true), viewSelector: .constant(.calendar))
}
