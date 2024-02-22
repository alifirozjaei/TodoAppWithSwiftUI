//
//  NewItemView.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @State var errorAlert = false
    var body: some View {
        VStack {
            Text("Add New Item")
                .bold()
                .padding()
            
            Form  {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.plain)
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
            }
            .scrollContentBackground(.hidden)
            if viewModel.loading {
                ProgressView()
            }
            ButtonView(title: "Add", background: viewModel.loading ? .secondary : .blue) {
                viewModel.save()
                errorAlert = !viewModel.message.isEmpty
            }
            .disabled(viewModel.loading)
            .padding()
            Spacer()
        }
        .alert(viewModel.message, isPresented: $errorAlert) {}
    }
}

#Preview {
    NewItemView()
}
