//
//  HeaderView.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angel: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(background)
                .rotationEffect(.degrees(angel))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                
                Text(subTitle)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "Test Title", subTitle: "test subtitle", angel: 20, background: .red)
}
