import Foundation
import MapKit

struct PetDTO: Codable {
    let id: UUID
    let name: String
    let age: PetAge
    let about: String?
    let personality: String?
    let idealHome: String?
    let medicalCondition: String?
    let adoptionInfo: String?
    let breed: String
    let shelter: ShelterDTO
    let images: [String]?
    
    let size: PetSize
    let adoptionStatus: AdoptionStatus
    let species: Specie
    
    var mapToModel: Pet {
        Pet(id: id,
            name: name,
            age: age,
            about: about,
            personality: personality,
            idealHome: idealHome,
            medicalCondition: medicalCondition,
            adoptionInfo: adoptionInfo,
            breed: breed,
            shelter: shelter.mapToModel,
            images: images,
            size: size,
            adoptionStatus: adoptionStatus,
            species: species)
    }
}
