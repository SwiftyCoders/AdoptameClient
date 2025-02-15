import Foundation

struct Pet: Identifiable, Hashable {
    let id: UUID
    let name: String
    let age: PetAge
    let about: String?
    let personality: String?
    let idealHome: String?
    let medicalCondition: String?
    let adoptionInfo: String?
    let breed: String
    let shelter: Shelter
    let images: [String]?
    
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

enum PetGender: Codable {
    case male
    case female
}

enum PetAge: Codable {
    case baby
    case young
    case adult
    case senior
}

enum AdoptionType: Codable {
    case bigInvisibles
    case pairsAdoptions
    case urgent
    case fosterCare
}
