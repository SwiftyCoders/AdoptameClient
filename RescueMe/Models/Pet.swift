import Foundation

struct Pet: Identifiable, Hashable {
    let id: UUID
    let name: String
    let age: Int?
    let description: String?
    let breed: String
    let weight: Double?
    let images: [String]?
    let latitude: Double
    let longitude: Double
    
    let size: PetSize
    let adoptionStatus: AdoptionStatus
    let species: Specie
}

enum Specie: Codable {
    case dog
    case cat
    case other
}

enum PetSize: Codable {
    case small
    case medium
    case large
}

enum AdoptionStatus: Codable {
    case available
    case inProgress
    case adopted
}
