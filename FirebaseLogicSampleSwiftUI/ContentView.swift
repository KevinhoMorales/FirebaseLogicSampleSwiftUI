//
//  ContentView.swift
//  FirebaseLogicSampleSwiftUI
//
//  Created by Kevinho Morales on 21/8/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authVM = LoginViewModel()

    var body: some View {
        if let _ = authVM.user {
            if let msg = authVM.welcomeMessage {
                Text(msg)
                    .font(.title)
                    .padding()
            } else {
                ProgressView("Generando mensaje...")
            }
        } else {
            LoginView(authVM: authVM)
        }
    }
}
