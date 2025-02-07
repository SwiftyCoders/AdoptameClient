import Foundation

extension User {
    static var previewAdopter: User {
        User(
            id: UUID(),
            name: "Laura Gómez",
            role: .adopter,
            shelter: nil
        )
    }

    static var previewShelterUser: User {
        User(
            id: UUID(),
            name: "Carlos Pérez",
            role: .shelter,
            shelter: Shelter.previewShelter
        )
    }

    static var previewUsers: [User] {
        return [
            User(
                id: UUID(),
                name: "Laura Gómez",
                role: .adopter,
                shelter: nil
            ),
            User(
                id: UUID(),
                name: "Carlos Pérez",
                role: .shelter,
                shelter: Shelter.previewShelter
            ),
            User(
                id: UUID(),
                name: "Mariana Rodríguez",
                role: .adopter,
                shelter: nil
            ),
            User(
                id: UUID(),
                name: "Fernando López",
                role: .shelter,
                shelter: Shelter.previewShelters[1]
            ),
            User(
                id: UUID(),
                name: "Elena García",
                role: .shelter,
                shelter: Shelter.previewShelters[2]
            )
        ]
    }
}
