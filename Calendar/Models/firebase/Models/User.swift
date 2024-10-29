//
//  User.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/04.
//

struct User: Codable {
    var email: String
    var id: String
    
    init() {
        self.email = ""
        self.id = ""
    }
    
    init(email: String, id: String) {
        self.email = email
        self.id = id
    }
}
