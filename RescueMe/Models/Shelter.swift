import Foundation

struct Shelter: Identifiable, Hashable {
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
    
    var formattedAddress: String {
        address ?? "No address provided"
    }
    
    var formattedWebsite: String {
        website ?? "No website provided"
    }
}
