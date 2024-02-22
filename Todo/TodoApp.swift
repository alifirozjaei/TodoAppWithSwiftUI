//
//  TodoApp.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//
import FirebaseCore
import SwiftUI


@main
struct TodoApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
