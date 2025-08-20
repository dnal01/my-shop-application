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
// state indicates that properties inside the object can be changed, and changes will be tracked in all places which
    @State var logInValidator = LogInValidator()
    
    var body: some Scene {
        WindowGroup {
            LogInView(logInValidator: logInValidator)
        }
    }
}
