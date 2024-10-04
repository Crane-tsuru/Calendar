//
//  Task.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/04.
//

struct Task {
    var title: String?
    var startTime: Int?
    var endTime: Int?
    var description: String?
    var location: String?
    var color: Int?
    var isFinished: Bool?
    
    init(taskData: [String: Any]) {
        self.title = taskData["title"] as? String ?? nil
        self.startTime = taskData["startTime"] as? Int ?? nil
        self.endTime = taskData["endTime"] as? Int ?? nil
        self.description = taskData["description"] as? String ?? nil
        self.location = taskData["location"] as? String ?? nil
        self.color = taskData["color"] as? Int ?? nil
        self.isFinished = taskData["isFinished"] as? Bool ?? nil
    }
}
