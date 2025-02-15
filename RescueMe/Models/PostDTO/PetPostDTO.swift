import Foundation

struct PetPostDTO: Codable {
    let name: String
    let age: PetAge
    let about: String?
    let personality: String?
    let idealHome: String?
    let medicalCondition: String?
    let adoptionInfo: String?
    let breed: String
    let shelter: ShelterDTO
    let images: [Data]?
    
    let size: PetSize
    let adoptionStatus: AdoptionStatus
    let species: Specie
}
