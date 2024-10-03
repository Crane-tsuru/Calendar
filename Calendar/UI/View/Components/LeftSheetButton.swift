//
//  LeftSheetButton.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/04.
//

import SwiftUI

struct LeftSheetButton: View {
    let systemName: SystemName
    
    @Binding var viewSelector: ViewSelect
    
    
    @Binding var toggle: Bool
    
    let buttonTitle: String
    
    var body: some View {
        HStack {
            Button(action: {
                viewSelector = viewSelector
                toggle.toggle()
            }, label: {
                Image(systemName: systemName.rawValue)
                Text(buttonTitle)
            })
            .foregroundColor(.black)
        }.padding()

    }
}

#Preview {
    LeftSheetButton(systemName: .list_bullet, viewSelector: .constant(.oneday), toggle: .constant(true), buttonTitle: "1日")
}
