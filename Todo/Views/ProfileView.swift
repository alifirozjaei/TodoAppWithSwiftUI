//
//  ProfileView.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.blue)
                    .frame(width: 125, height: 125)
                
                if let user = viewModel.user {
                    Form {
                        Section("Account Detail") {
                            HStack {
                                Text("Name: ")
                                TextField("Name", text: .constant(user.name))
                                    .disabled(true)
                                    .foregroundStyle(.secondary)
                            }
                            HStack {
                                Text("Email: ")
                                TextField("Email", text: .constant(user.email))
                                    .disabled(true)
                                    .foregroundStyle(.secondary)
                            }
                            HStack {
                                Text("Join: ")
                                TextField("Join", text: .constant(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted)))
                                    .disabled(true)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                } else {
                    ProgressView()
                        .font(.largeTitle)
                        .padding()
                }
                
                Spacer()
                
                ButtonView(title: "Logout", background: .pink) {
                    viewModel.logout()
                }.padding()
            }.navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
