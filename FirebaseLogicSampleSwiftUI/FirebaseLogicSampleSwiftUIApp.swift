//
//  FirebaseLogicSampleSwiftUIApp.swift
//  FirebaseLogicSampleSwiftUI
//
//  Created by Kevinho Morales on 21/8/25.
//

import SwiftUI
import Firebase
import FirebaseAppCheck

@main
struct FirebaseLogicApp: App {
    init() {
        AppCheck.setAppCheckProviderFactory(AppCheckDebugProviderFactory())
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
