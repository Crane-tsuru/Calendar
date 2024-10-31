//
//  Task.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/04.
//

struct Task: Codable {
    var id: String
    var title: String
    var startTime: Int
    var endTime: Int
    var description: String

    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.startTime = try container.decode(Int.self, forKey: .startTime)
        self.endTime = try container.decode(Int.self, forKey: .endTime)
        self.description = try container.decode(String.self, forKey: .description)
    }
}
