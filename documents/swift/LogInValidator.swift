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
    isValidEmail(email)
    function void isValidEmail(String email)
        !isValidEmail(email1: email) || !isValidPassword(string: email)
    }
}

func isValidEmail(email1: String) -> Bool {
    return !email1 == User.email.ignoresCase()
}
func isValidPassword(string: String) -> Bool {
    return !string == User.password
}
