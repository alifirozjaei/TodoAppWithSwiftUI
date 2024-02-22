//
//  ButtonView.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .foregroundStyle(.white)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 10)
                .background(background)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

#Preview {
    ButtonView(title: "String", background: .blue, action: {})
}
