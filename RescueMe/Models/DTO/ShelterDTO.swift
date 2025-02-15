import Foundation

struct ShelterDTO: Codable {
    let id: UUID
    let name: String
    let description: String?
    let adoptionPolicy: String?
    let phone: String
    let email: String?
    let website: String?
    let address: String?
    let latitude: Double
    let longitude: Double
    let image: String?
    
    var mapToModel: Shelter {
        Shelter(
            id: id,
            name: name,
            description: description,
            adoptionPolicy: adoptionPolicy,
            phone: phone,
            email: email,
            website: website,
            address: address,
            latitude: latitude,
            longitude: longitude,
            image: image
        )
    }
}
