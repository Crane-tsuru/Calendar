//
//  GPTManager.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/11/03.
//

import Foundation

class GPTManager {
    private let endpoint = "https://api.openai.com/v1/chat/completions"
    
    private func getAPIKey() -> String? {
        guard let key = Bundle.main.infoDictionary?["GPTKEY"] as? String else {
            return nil
        }
        
        return key
    }
    
    func fetchGPTResponse(prompt: String, model: String = "gpt-3.5-turbo", maxTokens: Int = 100) {
        guard let url = URL(string: self.endpoint) else { return }
        let apiKey = getAPIKey()
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(String(describing: apiKey))", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody = RequestBody(model: model, message: [Message(role: "user", content: prompt)], max_tokens: maxTokens)
        
        do {
            
        }
    }
}
