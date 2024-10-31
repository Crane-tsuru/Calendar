//
//  UserViewModel.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/29.
//

import FirebaseFirestore

class UserViewModel: ObservableObject {
    private let db = Firestore.firestore()
    private let collectionName: String = CollectionName.collectionName.rawValue
    
    
    @Published var user: User?
    
    func fetchUser(userid: String) {
        let docRef = db.collection(collectionName).document(userid)
        
        docRef.getDocument { document, error in
            if let error = error as NSError? {
                print("Error getting document: \(error.localizedDescription)")
                return
            }
            
            guard let document = document, let data = document.data() else {
                return
            }
            
            do {
                self.user = try document.data(as: User.self)
            } catch {
                print("Convert Error for User: \(error)")
            }

        }
    }
    
    // mailをdocumentidにする
    func saveUser(user: User) {
        let docRef = db.collection(collectionName).document(user.email)
        
        do {
            try docRef.setData(from: user)
        } catch {
            print(error)
        }
    }
}
