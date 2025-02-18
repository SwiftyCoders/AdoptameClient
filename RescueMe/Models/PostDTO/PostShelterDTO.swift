import Foundation

struct PostShelterDTO: Codable {
    let name: String
    let description: String?
    let adoptionPolicy: String?
    let phone: String
    let contactEmail: String?
    let website: String?
    let address: String?
    let latitude: Double
    let longitude: Double
    private let imageBase64: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case adoptionPolicy
        case phone
        case contactEmail
        case website
        case address
        case latitude
        case longitude
        case imageBase64 = "image"
    }
    
    init(name: String,
         description: String? = nil,
         adoptionPolicy: String? = nil,
         phone: String,
         contactEmail: String? = nil,
         website: String? = nil,
         address: String? = nil,
         latitude: Double,
         longitude: Double,
         image: Data? = nil) {
        self.name = name
        self.description = description
        self.adoptionPolicy = adoptionPolicy
        self.phone = phone
        self.contactEmail = contactEmail
        self.website = website
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.imageBase64 = image?.base64EncodedString()
    }
}
