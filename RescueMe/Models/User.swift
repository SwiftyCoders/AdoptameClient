import Foundation

struct User {
    let id: UUID
    let name: String
    let role: UserRole
    let shelter: Shelter?
}

enum UserRole {
    case adopter
    case shelter
}
