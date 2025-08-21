//
//  HomeView.swift
//  FirebaseLogicSampleSwiftUI
//
//  Created by Kevinho Morales on 21/8/25.
//

import SwiftUI

struct HomeView: View {
    let message: String
    
    var body: some View {
        VStack {
            ScrollView {
                Text(message)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
        }
        .navigationTitle("Home")
    }
}

#Preview {
    HomeView(message: "Bienvenido, kevinho@example.com")
}
