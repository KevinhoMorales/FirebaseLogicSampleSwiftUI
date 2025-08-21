//
//  LoginViewModel.swift
//  FirebaseLogicSampleSwiftUI
//
//  Created by Kevinho Morales on 21/8/25.
//

import Foundation
import FirebaseAuth

final class LoginViewModel: ObservableObject {
    @Published var user: User?
    @Published var welcomeMessage: String?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let authService = AuthService()
    private let aiService = AIService()

    func register(email: String, password: String) {
        self.isLoading = true
        authService.register(email: email, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.user = user
                    Task {
                        do {
                            self.welcomeMessage = try await self.aiService.generateWelcomeMessage(username: email)
                        } catch {
                            self.welcomeMessage = "Bienvenido, \(email)"
                        }
                        self.isLoading = false
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
}
