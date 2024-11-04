//
//  GPTManager.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/11/03.
//

import Foundation

class GPTManager {
    private let endpoint = "https://api.openai.com/v1/chat/completions"
    
    func getAPIKey() -> String? {
        guard let key = Bundle.main.infoDictionary?["GPTKEY"] as? String else {
            return nil
        }
        
        return key
    }
    
    func fetchGPTResponse(prompt: String) {
        let url = URL(string: self.endpoint)
        
    }
}
