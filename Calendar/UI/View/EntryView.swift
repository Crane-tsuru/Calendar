//
//  EntryView.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/03.
//

//import SwiftUI
//
//struct EntryView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    EntryView()
//}

import SwiftUI

struct EntryView: View {
    @State private var showModal = false

    var body: some View {
        ZStack {
            Button("Show Left Modal") {
                withAnimation {
                    showModal.toggle()
                }
            }
            
            // 背景を半透明にしてモーダルをオーバーレイする
            if showModal {
                Color.black.opacity(0.4) // 背景を半透明の黒にする
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showModal = false
                        }
                    }
                
                LeftSheetView(isPresented: $showModal)
                    .transition(.move(edge: .leading)) // 左からスライドイン
                    .animation(.easeInOut)
            }
        }
    }
}



#Preview {
    EntryView()
}
