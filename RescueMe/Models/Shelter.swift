import Foundation
import MapKit

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
    
    var coordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
}
