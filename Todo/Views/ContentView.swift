//
//  ContentView.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import FirebaseCore

import SwiftUI

struct ContentView: View {
    init () {
        FirebaseApp.configure()
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
