//
//  ContentView.swift
//  Todo
//
//  Created by 1 on 12/1/‍1402 AP.
//



import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewViewModel()
    var body: some View {
        if viewModel.isSiginIn && !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            NavigationView {
                LoginView()
            }
        }
    }
    
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
