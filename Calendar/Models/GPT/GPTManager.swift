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
    
    @MainActor
    func fetchGPTResponse(prompt: String, model: String = "gpt-4o-mini", maxTokens: Int = 100) -> String? {
        
        guard let url = URL(string: self.endpoint) else { return nil }
        let apiKey = getAPIKey()
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(String(describing: apiKey))", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody = RequestBody(model: model, messages: [Message(role: "user", content: prompt)], max_tokens: maxTokens, tools: [Tool(function: Function(strict: true))])
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
        
        
        do {
            let jsonData = try JSONEncoder().encode(requestBody)
            request.httpBody = jsonData
        } catch {
            print("Encoding Error: \(error)") //debug
            return nil
        }
        
        let responseContent: String? = getDataFromURLSession(request: request)
        
                
        return responseContent
    }
    
    private func getDataFromURLSession(request: URLRequest) -> String? {
        var responseContent: String?
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request Error: \(error)") //debug
                return
            }
            
            guard let data = data else {
                print("No data catched") //debug
                return
            }
            
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let choices = jsonResponse["choices"] as? [[String: Any]],
                   let message = choices.first?["message"] as? [String: Any],
                   let content = message["content"] as? String {
                        responseContent = content
                }
            }
        }.resume()
        
        return responseContent
    }
}
