//
//  RequestBody.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/11/04.
//

import Foundation

struct RequestBody: Codable {
    let model: String
    let messages: [Message]
    let max_tokens: Int
//    let response_schema: ResponseSchema
}
