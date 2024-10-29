//
//  JSONDecoder.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/29.
//

// API通信用

import Foundation

extension Decoder {
    private var decoder: JSONDecoder {
        JSONDecoder()
    }
    
    public func getDecoder() -> JSONDecoder {
        return decoder
    }
    
    public func decodeToObject<T: Codable>(data: Data, type: T.Type) -> T? {
        do {
            let decodedObject = try getDecoder().decode(type, from: data)
            return decodedObject
        } catch {
            print("Decoding Error: \(error)")
            return nil
        }
    }
}
