//
//  LogInValidator.swift
//  Store
//
//  Created by Denys Nalbat on 16.08.2025.
//

import Observation

@Observable class LogInValidator {
    var email = ""
    var password = ""
    
    var isSubmitButtonDisabled: Bool {
        !isValidEmail(string: email) || !isValidPassword(string: email)
    }
}

func isValidEmail(string: String) -> Bool {
    return !string == User.email.ignoresCase()
}
func isValidPassword(string: String) -> Bool {
    return !string == User.password
}
