//
//  NewItemViewViewModel.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var message = ""
    @Published var loading = false
    
    func save() {
        message = ""
        guard validate() else {
            message = "Please enter valid data"
            return
        }
        //        Get Current User
        guard let uId  = Auth.auth().currentUser?.uid else {
            message = "Invalid User"
            return
        }
        loading = true
        //        Create Model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            duDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false)
        
        //        Save Item on firebase
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary(), completion: { [weak self] _ in
                self?.loading = false
                self?.title = ""
                self?.dueDate = Date()
            })
    }
    
    
    func validate() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate > Date().addingTimeInterval(24*60*60) else {
            return false
        }
        
        return true
    }
}
