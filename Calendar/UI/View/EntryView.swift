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
    
    @State var selectedDate = Date()
    
    @State var viewSelector: ViewSelect = .calendar

    var body: some View {
        ZStack {
            Button("Show Left Modal") {
                withAnimation {
                    showModal.toggle()
                }
            }
            
            NavigationStack {
                VStack {
                    if viewSelector == .calendar {
                        CalendarView(selectedDate: $selectedDate)
                    } else if viewSelector == .oneday {
                        OnedayScheduleView()
                    }
                }
                .frame(height: 500)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            withAnimation {
                                showModal.toggle()
                            }
                        }, label: {
                            Image(systemName: "list.bullet")
                                .scaleEffect(1.8)
                                .padding(.leading, 20)
                                .padding(.top, 30)
                        })
                    }
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
                
                LeftSheetView(isShowModal: $showModal, viewSelector: $viewSelector)
                    .transition(.move(edge: .leading)) // 左からスライドイン
                    .animation(.easeInOut, value: showModal)
            }
        }
    }
}



#Preview {
    EntryView()
}
