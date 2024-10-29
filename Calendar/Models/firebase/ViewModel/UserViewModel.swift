//
//  UserViewModel.swift
//  Calendar
//
//  Created by 鶴見駿 on 2024/10/29.
//

import FirebaseFirestore

class UserViewModel: ObservableObject {
    private let db = Firestore.firestore()
    private let collectionName = "users"
    
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
            
            let email = data["email"] as? String ?? ""
            let userid = data["id"] as? String ?? ""
            let password = data["password"] as? String ?? ""
            self.user = User(email: email, id: userid, password: password)

        }
    }
}
