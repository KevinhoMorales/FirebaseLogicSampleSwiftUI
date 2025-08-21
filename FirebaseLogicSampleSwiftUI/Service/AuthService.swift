//
//  AuthService.swift
//  FirebaseLogicSampleSwiftUI
//
//  Created by Kevinho Morales on 21/8/25.
//

import FirebaseAuth
import FirebaseAI

final class AuthService {
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                completion(.success(user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    func register(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                completion(.success(user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}

final class AIService {
    let ai = FirebaseAI.firebaseAI(backend: .googleAI())

    func generateWelcomeMessage(username: String) async throws -> String {
        let model = ai.generativeModel(modelName: "gemini-2.5-flash")
        let prompt = "Escribe un mensaje de bienvenida para el usuario: \(username). Solo dale la bienvenida, dile que su registro fue éxitoso y dile que vendran funcionalidades en breve 😄"
        let response = try await model.generateContent(prompt)
        return response.text ?? "Bienvenido 😊"
    }
}
