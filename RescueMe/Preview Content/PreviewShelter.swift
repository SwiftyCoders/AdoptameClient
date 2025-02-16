import Foundation

extension Shelter {
    static var previewShelter: Shelter {
        Shelter(
            id: UUID(),
            name: "Refugio Esperanza",
            description: "Un hogar temporal para mascotas en busca de una familia.",
            adoptionPolicy: "POLITICA ADOPCIÓN",
            phone: "123-456-7890", email: "contacto@refugioesperanza.com",
            website: "https://www.refugioesperanza.com", address: "Calle 123, Ciudad Refugio",
            latitude: 10.123456,
            longitude: -74.123456,
            image: "https://example.com/shelter-image.jpg"
        )
    }
    
    static var previewShelters: [Shelter] {
        return [
            Shelter(
                id: UUID(),
                name: "Refugio Esperanza",
                description: "Un hogar temporal para mascotas en busca de una familia.",
                adoptionPolicy: "adopción",
                phone: "123-456-7890", email: "contacto@refugioesperanza.com",
                website: "https://www.refugioesperanza.com", address: "Calle 123, Ciudad Refugio",
                latitude: 10.123456,
                longitude: -74.123456,
                image: "https://example.com/shelter1.jpg"
            ),
            Shelter(
                id: UUID(),
                name: "Refugio Esperanza",
                description: "Un hogar temporal para mascotas en busca de una familia.",
                adoptionPolicy: "adopción",
                phone: "123-456-7890", email: "contacto@refugioesperanza.com",
                website: "https://www.refugioesperanza.com", address: "Calle 123, Ciudad Refugio",
                latitude: 10.123456,
                longitude: -74.123456,
                image: "https://example.com/shelter2.jpg"
            ),
            Shelter(
                id: UUID(),
                name: "Refugio Esperanza",
                description: "Un hogar temporal para mascotas en busca de una familia.",
                adoptionPolicy: "adopción",
                phone: "123-456-7890", email: "contacto@refugioesperanza.com",
                website: "https://www.refugioesperanza.com", address: "Calle 123, Ciudad Refugio",
                latitude: 10.123456,
                longitude: -74.123456,
                image: "https://example.com/shelter3.jpg"
            ),
            Shelter(
                id: UUID(),
                name: "Refugio Esperanza",
                description: "Un hogar temporal para mascotas en busca de una familia.",
                adoptionPolicy: "adopción",
                phone: "123-456-7890", email: "contacto@refugioesperanza.com",
                website: "https://www.refugioesperanza.com", address: "Calle 123, Ciudad Refugio",
                latitude: 10.123456,
                longitude: -74.123456,
                image: "https://example.com/shelter4.jpg"
            ),
            Shelter(
                id: UUID(),
                name: "Refugio Esperanza",
                description: "Un hogar temporal para mascotas en busca de una familia.",
                adoptionPolicy: "adopción",
                phone: "123-456-7890", email: "contacto@refugioesperanza.com",
                website: "https://www.refugioesperanza.com", address: "Calle 123, Ciudad Refugio",
                latitude: 10.123456,
                longitude: -74.123456,
                image: "https://example.com/shelter5.jpg"
            )
        ]
    }
}
