//
//  TaskViewModel.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/05.
//

import FirebaseFirestore
import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    private let db = Firestore.firestore()
    
    private let collectionName: String = CollectionName.collectionName.rawValue
    private let subCollectionName: String = CollectionName.subCollectionName.rawValue
    
    func fetchTasks(userid: String) {
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
    
    func saveTask(userid: String, task: Task) {
        let docRef = db.collection(collectionName).document(userid).collection(subCollectionName).document(task.id)
        
        do {
            try docRef.setData(from: task)
        } catch {
            print("Failed Saving Task Data: \(error)")
        }
    }
}
