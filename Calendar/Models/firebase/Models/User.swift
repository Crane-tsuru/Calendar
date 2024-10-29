//
//  User.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/04.
//

struct User: Codable {
    var email: String
    var id: String
    var password: String
    
    init() {
        self.email = ""
        self.id = ""
        self.password = ""
    }
    
    init(email: String, id: String, password: String) {
        self.email = email
        self.id = id
        self.password = password
    }
}
