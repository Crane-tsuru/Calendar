//
//  RequestBody.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/11/04.
//

import Foundation

struct RequestBody: Codable {
    let model: String
    let message: [Message]
    let max_tokens: Int
}
