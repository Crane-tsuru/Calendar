//
//  TaskViewModel.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/05.
//

import Foundation
import FirebaseFirestore

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func fetchTasks(userid: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userid).collection("tasks").getDocuments { snapshot, error in
            if let error = error {
                print(error)
            }
            
            guard let documents = snapshot?.documents else {
                print("document not found")
                return
            }
            
            self.tasks = documents.compactMap { document in
                try? document.data(as: Task.self)
            }
        }
    }
}
