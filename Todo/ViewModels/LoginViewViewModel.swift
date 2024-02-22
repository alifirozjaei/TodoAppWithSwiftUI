//
//  LoginViewViewModel.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var loading = false
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        loading = true
        Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] _,_ in
            self?.loading = false
        })
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all field."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
}
