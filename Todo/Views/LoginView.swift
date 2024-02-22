//
//  LoginView.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewViewModel = LoginViewViewModel()
    var body: some View {
        VStack {
            //            Header
            HeaderView(title: "ToDo App", subTitle: "Login Page", angel: 15, background: .pink)
            
            //            Login  View
            Form {
                Section {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(.plain)
                    
                    SecureField("Password", text: $viewModel.password)
                } header: {
                    Text("Login From")
                }
            }.scrollContentBackground(.hidden)
                .foregroundStyle(.primary)
            
            if (viewModel.loading) {
                ProgressView()
            }
            
            ButtonView(title: "Login", background: viewModel.loading ? .secondary : .blue, action: {
                viewModel.login()
            })
            .disabled(viewModel.loading)
            .padding()
            
            //            Create Account
            VStack {
                Text("New around heare?")
                NavigationLink(destination: RegisterView(), label: {
                    Text("Create an account")
                        .foregroundStyle(.blue)
                })
            }.padding(.vertical, 50)
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
