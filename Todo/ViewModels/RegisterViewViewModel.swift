//
//  RegisterViewViewModel.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var loading = false
    init() {}
    
    
    func register() {
        guard validate() else {
            return
        }
        
        loading = true
        Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
            guard let userId = result?.user.uid else {
                self?.loading = false
                return
            }
            print(error.debugDescription)
            self?.inserUserRecord(id: userId)
            self?.loading = false
        })
    }
    
    private func inserUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all field."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Please enter valid password(>6)."
            return false
        }
        
        return true
    }
    
}
