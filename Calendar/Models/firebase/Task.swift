//
//  Task.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/04.
//

struct Task {
    var id: String
    var title: String?
    var startTime: Int?
    var endTime: Int?
    var description: String?
    
    init(taskData: [String: Any]) {
        self.id = taskData["id"] as? String ?? ""
        self.title = taskData["title"] as? String ?? nil
        self.startTime = taskData["startTime"] as? Int ?? nil
        self.endTime = taskData["endTime"] as? Int ?? nil
    }
}
