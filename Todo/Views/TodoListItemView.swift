//
//  TodoListItemView.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import SwiftUI

struct TodoListItemView: View {
    let item: ToDoListItem
    let toggleAction: (ToDoListItem) -> Void
    
    var body: some View {
        HStack(alignment:.center) {
            VStack(alignment:.leading) {
                Text(item.title)
                    .font(.headline)
                Text("\(Date(timeIntervalSince1970: item.duDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                toggleAction(item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle" : "circle")
                    .foregroundStyle(item.isDone ? .green : .primary)
                    .font(.system(size: 20))
            }
        }
    }
}

//#Preview {
//    TodoListItemView()
//}
