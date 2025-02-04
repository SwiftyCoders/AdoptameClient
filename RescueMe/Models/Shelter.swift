import Foundation

struct Shelter: Identifiable, Hashable {
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
    let pets: [Pet]
}
