//
//  TaskViewModel.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/05.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func fetchTasks() {
        
    }
}
