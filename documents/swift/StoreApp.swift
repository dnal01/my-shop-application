//
//  StoreApp.swift
//  Store
//
//  Created by Denys Nalbat on 15.08.2025.
//

import SwiftUI
import SwiftData

@main
struct StoreApp: App {
    @State var userValidator = UserValidator()
    
    var body: some Scene {
        WindowGroup {
            CreateAccountView(userValidator: userValidator)
            LogInView(userValidator: userValidator)
        }
    }
}
