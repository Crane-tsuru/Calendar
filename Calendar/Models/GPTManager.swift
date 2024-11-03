//
//  GPTManager.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/11/03.
//

import Foundation

class GPTManager {
    
    func getAPIKey() -> String? {
        guard let key = Bundle.main.infoDictionary?["GPTKEY"] as? String else {
            return nil
        }
        
        return key
    }
}
