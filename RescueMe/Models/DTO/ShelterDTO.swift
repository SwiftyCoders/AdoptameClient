import Foundation

struct ShelterDTO: Codable {
    let id: UUID
    let name: String
    let description: String?
    let contactEmail: String
    let phone: String?
    let address: String?
    let latitude: Double
    let longitude: Double
    let website: String?
    let image: String?
    let pets: [PetDTO]
    
    var mapToModel: Shelter {
        Shelter(id: id,
            name: name,
            description: description,
            contactEmail: contactEmail,
            phone: phone,
            address: address,
            latitude: latitude,
            longitude: longitude,
            website: website,
            image: image,
            pets: pets.map(\.mapToModel))
    }
}
