//
//  HeaderView.swift
//  ToDoList
//
//  Created by gmac on 10/7/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angel: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(background)
                .rotationEffect(Angle(degrees: angel))
            
            VStack {
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                    .bold()
                
                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 30)
            
        }
        .frame(width: 500, height: 300)
        .frame(alignment: .top)
        .offset(x: 0, y: -100)
    }
}

struct HederView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subtitle: "Subtitle",
                   angel: 15,
                   background: .blue)
    }
}

#Preview {
    //LoginView()
    HeaderView(title: "Title",
               subtitle: "Subtitle",
               angel: 15,
               background: Color.blue)
}
