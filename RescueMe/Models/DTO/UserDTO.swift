import Foundation

struct UserDTO {
    let id: UUID
    let name: String
    let role: UserRole
    let shelter: ShelterDTO?
    
    var mapToModel: User {
        User(id: id,
            name: name,
            role: role,
            shelter: shelter?.mapToModel)
    }
}
