//
//  LeftSheetView.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/03.
//

import SwiftUI


struct LeftSheetView: View {
    @Binding var isPresented: Bool

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Spacer()
                    Button("Close") {
                        withAnimation {
                            isPresented.toggle()
                        }
                    }
                }
                .padding()
                
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
    LeftSheetView(isPresented: .constant(true))
}
