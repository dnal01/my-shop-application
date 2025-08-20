//
//  UserValidator.swift
//  Store
//
//  Created by Denys Nalbat on 16.08.2025.
//

import Observation

@Observable class UserValidator {
    var name = ""
    var email = ""
    var password = ""
    
    var isSubmitButtonDisabled: Bool {
        name.isEmpty || !isValidEmail(string: email) || password.count < 8
    }
}

func isValidEmail(string: String) -> Bool {
    let emailRegex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/.ignoresCase()
    return !string.ranges(of: email
    Regex).isEmpty
}
