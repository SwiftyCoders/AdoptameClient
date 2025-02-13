import Foundation

extension Shelter {
    static var previewShelter: Shelter {
        Shelter(
            id: UUID(),
            name: "Refugio Esperanza",
            description: "Un hogar temporal para mascotas en busca de una familia.",
            contactEmail: "contacto@refugioesperanza.com",
            phone: "123-456-7890",
            address: "Calle 123, Ciudad Refugio",
            latitude: 10.123456,
            longitude: -74.123456,
            website: "https://www.refugioesperanza.com",
            image: "https://example.com/shelter-image.jpg",
            pets: Pet.previewPets 
        )
    }
    
    static var previewShelters: [Shelter] {
           return [
               Shelter(
                   id: UUID(),
                   name: "Refugio Esperanza",
                   description: "Un hogar temporal para mascotas en busca de una familia.",
                   contactEmail: "contacto@refugioesperanza.com",
                   phone: "123-456-7890",
                   address: "Calle 123, Ciudad Refugio",
                   latitude: 4.675318,
                   longitude: -74.052233,
                   website: "https://www.refugioesperanza.com",
                   image: "https://example.com/shelter1.jpg",
                   pets: Pet.previewPets
               ),
               Shelter(
                   id: UUID(),
                   name: "Hogar Peludo",
                   description: "Refugio que rescata perros de la calle y les da una segunda oportunidad.",
                   contactEmail: "contacto@hogarpeludo.com",
                   phone: "555-789-1234",
                   address: "Avenida Canina 456",
                   latitude: 4.673960,
                   longitude: -74.054634,
                   website: "https://www.hogarpeludo.com",
                   image: "https://example.com/shelter2.jpg",
                   pets: Pet.previewPets
               ),
               Shelter(
                   id: UUID(),
                   name: "Gatitos Felices",
                   description: "Un santuario para gatos en busca de un hogar.",
                   contactEmail: "info@gatitosfelices.com",
                   phone: "321-654-9870",
                   address: "Calle Felina 789",
                   latitude: 4.663732,
                   longitude: -74.048437,
                   website: "https://www.gatitosfelices.com",
                   image: "https://example.com/shelter3.jpg",
                   pets: Pet.previewPets
               ),
               Shelter(
                   id: UUID(),
                   name: "Patas en Acción",
                   description: "Rescate y rehabilitación de animales en situación de calle.",
                   contactEmail: "ayuda@patasenaccion.com",
                   phone: "999-111-2222",
                   address: "Camino al Rescate 321",
                   latitude: 4.672531,
                   longitude: -74.051977,
                   website: "https://www.patasenaccion.com",
                   image: "https://example.com/shelter4.jpg",
                   pets: Pet.previewPets
               ),
               Shelter(
                   id: UUID(),
                   name: "El Arca de Noé",
                   description: "Refugio multiespecie con animales de todo tipo en adopción.",
                   contactEmail: "info@arcadenoé.com",
                   phone: "888-777-6666",
                   address: "Avenida Salvación 555",
                   latitude: 4.667461,
                   longitude: -74.053558,
                   website: "https://www.arcadenoé.com",
                   image: "https://example.com/shelter5.jpg",
                   pets: Pet.previewPets
               )
           ]
       }
}
