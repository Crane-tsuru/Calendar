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
    func fetchGPTResponse(prompt: String, model: String = "gpt-3.5-turbo", maxTokens: Int = 100) -> String? {
        var myContent: String?
        
        guard let url = URL(string: self.endpoint) else { return nil }
        let apiKey = getAPIKey()
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(String(describing: apiKey))", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody = RequestBody(model: model, message: [Message(role: "user", content: prompt)], max_tokens: maxTokens)
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
        
        
        do {
            let jsonData = try JSONEncoder().encode(requestBody)
            request.httpBody = jsonData
        } catch {
            print("Encoding Error: \(error)")
            return nil
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data catched")
                return
            }
            
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                if let choices = jsonResponse["choices"] as? [[String: Any]],
                   let message = choices.first?["message"] as? [String: Any],
                   let content = message["content"] as? String {
                    myContent = content
                }
            }
        }.resume()
        
        // contentが空の場合にnilを返す
        return myContent
    }
}
