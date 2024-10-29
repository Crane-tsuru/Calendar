//
//  User.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/04.
//

struct User: Codable {
    var email: String
    var userName: String
    var password: String
    
    init() {
        self.email = ""
        self.userName = ""
        self.password = ""
    }
    
    init(email: String, id: String, password: String) {
        self.email = email
        self.userName = id
        self.password = password
    }
}
