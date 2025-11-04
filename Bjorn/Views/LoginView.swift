import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 20) {
            // Header
            HeaderView(title: "Bjorn",
                       subtitle: "Stronger than yesterday",
                       angel: 15,
                       background: Color.deep)
            .offset(y: 80)

            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            }

            //Login Form
            Form {
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)

                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TLButton(title: "Login",
                         backgroundColor: Color.purpleGlow) {
                    viewModel.login()
                }
            }
            .offset(y: 80)
            .frame(maxWidth: 400)  // fill width
            .padding(.horizontal, 20)    // reasonable horizontal padding
            
            VStack {
                //Register Link
                Text("New around here?")
                NavigationLink("Create An Account",
                               destination: RegisterView())
            }
            .padding(80)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // fill screen
        .ignoresSafeArea()      // ignore navigation safe area padding
    }
}

#Preview {
    LoginView()
}
