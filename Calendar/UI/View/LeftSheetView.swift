//
//  LeftSheetView.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/03.
//

import SwiftUI


struct LeftSheetView: View {
    @Binding var isPresented: Bool
    
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
                
                HStack {
                    Button(action: {
                        viewSelector = .calendar
                    }, label: {
                        Image(systemName: "calendar")
                        Text("カレンダー")
                    })
                    .foregroundColor(.black)
                }.padding()
                
                HStack {
                    Button(action: {
                        viewSelector = .oneday
                    }, label: {
                        Image(systemName: "list.bullet")
                        Text("1日")
                    })
                    .foregroundColor(.black)
                }.padding()
                
                
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
    LeftSheetView(isPresented: .constant(true), viewSelector: .constant(.calendar))
}
