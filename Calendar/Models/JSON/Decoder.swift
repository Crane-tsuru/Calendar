//
//  JSONDecoder.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/29.
//

import Foundation

class Decoder {
    private let decoder = JSONDecoder()
    
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
