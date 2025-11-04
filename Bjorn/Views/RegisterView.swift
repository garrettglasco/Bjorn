import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

    var body: some View {
        VStack(spacing: 20) {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start visualizing your progress",
                       angel: -15,
                       background: Color.deepIndigo)
                .frame(maxWidth: .infinity)
                .offset(y: 80)

            // Registration Form
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled(true)

                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)

                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled(true)

                TLButton(title: "Create Account",
                         backgroundColor: .vibrantGreen) {
                    viewModel.Register()
                }
            }
            .offset(y: 80)
            .frame(maxWidth: 400)           // limit width
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.deepIndigo)
        .ignoresSafeArea()
    }
}

#Preview {
    RegisterView()
}
