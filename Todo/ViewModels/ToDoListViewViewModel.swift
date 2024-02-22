//
//  ToDoListViewViewModel.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var showSheet = false
    
    func deleteItem(id: String) {
        let userId = Auth.auth().currentUser?.uid ?? ""
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    func toggleState(item: ToDoListItem) {
        let userId = Auth.auth().currentUser?.uid ?? ""
        let db = Firestore.firestore()
        var newItem = item
        newItem.isDone.toggle()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(item.id)
            .setData(newItem.asDictionary())
    }
}
