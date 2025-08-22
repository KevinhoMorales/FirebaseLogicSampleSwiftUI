//
//  AIService.swift
//  FirebaseLogicSampleSwiftUI
//
//  Created by Kevinho Morales on 21/8/25.
//

import FirebaseAI

final class AIService {
    let ai = FirebaseAI.firebaseAI(backend: .googleAI())

    func generateWelcomeMessage(username: String) async throws -> String {
        let model = ai.generativeModel(modelName: "gemini-2.5-flash")
        let prompt = "Escribe un mensaje de bienvenida para el usuario: \(username). Solo dale la bienvenida, dile que su registro fue éxitoso, que ha sido elegido como candidato para la vacante y dile que en pocas palabras es un placer tenerlo en el equipo. 😄"
        let response = try await model.generateContent(prompt)
        return response.text ?? "Bienvenido 😊"
    }
}
