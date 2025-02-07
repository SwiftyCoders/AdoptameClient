import Foundation

enum APIEndpoint {
    static let baseURL = URL(string: "https://f8cf-79-154-216-32.ngrok-free.app")!

    // MARK: - Pets
    static let getAllPets = baseURL.appendingPathComponent("pets")
    static func getPet(id: UUID) -> URL {
        baseURL.appendingPathComponent("pets/\(id)")
    }
    static func createPet() -> URL {
        baseURL.appendingPathComponent("pets")
    }
    static func replacePet(id: UUID) -> URL {
        baseURL.appendingPathComponent("pets/\(id)")
    }
    static func updatePet(id: UUID) -> URL {
        baseURL.appendingPathComponent("pets/\(id)")
    }
    static func deletePet(id: UUID) -> URL {
        baseURL.appendingPathComponent("pets/\(id)")
    }

    // MARK: - Shelters
    static let getAllShelters = baseURL.appendingPathComponent("shelters")
    static func getShelter(id: UUID) -> URL {
        baseURL.appendingPathComponent("shelters/\(id)")
    }
    static func createShelter() -> URL {
        baseURL.appendingPathComponent("shelters")
    }
    static func replaceShelter(id: UUID) -> URL {
        baseURL.appendingPathComponent("shelters/\(id)")
    }
    static func updateShelter(id: UUID) -> URL {
        baseURL.appendingPathComponent("shelters/\(id)")
    }
    static func deleteShelter(id: UUID) -> URL {
        baseURL.appendingPathComponent("shelters/\(id)")
    }    
    static func petsFromShelter(id: UUID) -> URL {
        baseURL.appendingPathComponent("shelters/\(id)/pets")
    }
}
