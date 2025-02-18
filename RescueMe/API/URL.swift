import Foundation

enum APIEndpoint {
    static let baseURL = URL(string: "http://127.0.0.1:8080")!

    // MARK: - Pets
    static let getAllPets = baseURL.appending(path: "pets")
    static func getPet(id: UUID) -> URL {
        baseURL.appending(path: "pets/\(id)")
    }
    static func createPet() -> URL {
        baseURL.appending(path: "pets")
    }
    static func replacePet(id: UUID) -> URL {
        baseURL.appending(path: "pets/\(id)")
    }
    static func updatePet(id: UUID) -> URL {
        baseURL.appending(path: "pets/\(id)")
    }
    static func deletePet(id: UUID) -> URL {
        baseURL.appending(path: "pets/\(id)")
    }

    // MARK: - Shelters
    static let getAllShelters = baseURL.appending(path: "shelters")
    static func getShelter(id: UUID) -> URL {
        baseURL.appending(path: "shelters/\(id)")
    }
    static func createShelter() -> URL {
        baseURL.appending(path: "shelters")
    }
    static func replaceShelter(id: UUID) -> URL {
        baseURL.appending(path: "shelters/\(id)")
    }
    static func updateShelter(id: UUID) -> URL {
        baseURL.appending(path: "shelters/\(id)")
    }
    static func deleteShelter(id: UUID) -> URL {
        baseURL.appending(path: "shelters/\(id)")
    }
    static func petsFromShelter(id: UUID) -> URL {
        baseURL.appending(path: "shelters/\(id)/pets")
    }
    
    // MARK: - Users
    static let newUser: URL = baseURL.appending(path: "auth/create")
    
    static let loginUser = baseURL.appending(path: "auth/login")
}
