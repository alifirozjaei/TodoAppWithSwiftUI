//
//  ToDoListView.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery(collectionPath: "/users/\(Auth.auth().currentUser?.uid ?? "")/todos") var items: [ToDoListItem]
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(items) { item in
                        TodoListItemView(item: item, toggleAction: viewModel.toggleState)
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.deleteItem(id: items[indexSet.first!].id)
                    })
                }
            }.navigationTitle("Todo List")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button {
                        viewModel.showSheet = true
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
                .sheet(isPresented: $viewModel.showSheet, content: {
                    NewItemView()
                })
            
            NavigationLink(destination: NewItemView(), label: {
                Image(systemName: "plus.circle")
            })
        }
    }
    

}

//#Preview {
//    ToDoListView()
//}
