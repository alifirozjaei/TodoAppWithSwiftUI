//
//  RegisterView.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack {
            HeaderView(title: "Register", subTitle: "create your account on ToDo App", angel: 15, background: .yellow)
                .offset(y: -30)
            Form {
                Section {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("FullName", text: $viewModel.name)
                    TextField("Email", text: $viewModel.email)
                    SecureField("Password", text: $viewModel.password)
                } header: {
                    Text("Login From")
                }
            }.scrollContentBackground(.hidden)
                .foregroundStyle(.primary)
            
            if (viewModel.loading) {
                ProgressView()
            }
            
            ButtonView(title: "Register", background: viewModel.loading ? .secondary : .blue) {
                viewModel.register()
            }
            .disabled(viewModel.loading)
            .padding()
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
