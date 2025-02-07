import Foundation

struct PetDTO: Codable {
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
    
    var mapToModel: Pet {
        Pet(id: id,
            name: name,
            age: age,
            description: description,
            breed: breed,
            weight: weight,
            images: images,
            latitude: latitude,
            longitude: longitude,
            size: size,
            adoptionStatus: adoptionStatus,
            species: species)
    }
}
