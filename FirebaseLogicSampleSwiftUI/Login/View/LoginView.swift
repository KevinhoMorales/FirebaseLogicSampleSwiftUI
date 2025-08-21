//
//  LoginView.swift
//  FirebaseLogicSampleSwiftUI
//
//  Created by Kevinho Morales on 21/8/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authVM: LoginViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var goToHome = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                if authVM.isLoading {
                    ProgressView("Iniciando sesión...")
                } else {
                    Button("Iniciar sesión") {
                        authVM.register(email: email, password: password)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            if authVM.user != nil {
                                goToHome = true
                            }
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                NavigationLink(
                    destination: HomeView(message: authVM.welcomeMessage ?? "Bienvenido"),
                    isActive: $goToHome
                ) {
                    EmptyView()
                }
            }
            .padding()
            .alert(item: Binding(
                get: { authVM.errorMessage.map { ErrorWrapper(message: $0) } },
                set: { _ in authVM.errorMessage = nil }
            )) { wrapper in
                Alert(
                    title: Text("Error"),
                    message: Text(wrapper.message),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
