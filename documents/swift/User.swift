import Foundation

struct User {
    var firstName = "John"
    var lastName = "Ludvik"
    var email = "john.ludvik@gmail.com"
    var password = "12345"

    var description: String {
        "User \(firstName) \(lastName). Information email: \(email)"
    }
}