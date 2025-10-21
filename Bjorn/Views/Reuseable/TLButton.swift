//
//  TLButton.swift
//  ToDoList
//
//  Created by gmac on 10/8/25.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(backgroundColor)
                        .opacity(0.9)
                )
        }
        .buttonStyle(.plain)
        .padding()
    }
}

#Preview("TLButton Preview") {
    VStack(spacing: 16) {
        TLButton(title: "Primary", backgroundColor: .blue) {
            // Preview action
        }
        TLButton(title: "Destructive", backgroundColor: .red) {
            // Preview action
        }
    }
    .padding()
    .background(Color.black.opacity(0.2))
}
