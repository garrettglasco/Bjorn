//
//  RegisterView.swift
//  ToDoList
//
//  Created by gmac on 10/7/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register",
                       subtitle: "Start Organizing Your Life",
                       angel: -15,
                       background: Color.orange)

            //Form
            Form {
                TextField("FullName", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled(true)
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TLButton(title: "Create Account",
                         backgroundColor: .green) {
                    viewModel.Register()
                }
            }
        }
        .offset(y: -50)
        .padding(50)
    }
}

#Preview {
    RegisterView()
}
