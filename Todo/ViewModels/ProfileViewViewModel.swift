//
//  ProfileViewViewModel.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init() {
        fetchUser()
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("User not authenticated")
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .getDocument(completion: { [weak self] snapshot, error in
                if let error = error {
                    print("Error fetching user document: \(error.localizedDescription)")
                    return
                }
                
                guard let data = snapshot?.data() else {
                    print("User document not found")
                    return
                }
                
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0)
                
                print(data.description)
            })
    }
}
