import Foundation

enum APIEndpoint {
    static let baseURL = URL(string: "https://f8cf-79-154-216-32.ngrok-free.app")!

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
}
