import Foundation

extension Pet {
    static var previewPet: Pet {
        Pet(
            id: UUID(),
            name: "Max",
            age: 3,
            description: "Un perro cariñoso y juguetón que ama los paseos.",
            breed: "Labrador",
            weight: 25.0,
            images: [
                "https://example.com/max1.jpg",
                "https://example.com/max2.jpg"
            ],
            latitude: 10.123456,
            longitude: -74.123456,
            size: .medium,
            adoptionStatus: .available,
            species: .dog
        )
    }

    static var previewPets: [Pet] {
        return [
            Pet(
                id: UUID(),
                name: "Luna",
                age: 2,
                description: "Gata tranquila y amorosa. Perfecta para un hogar pacífico.",
                breed: "Siamese",
                weight: 4.2,
                images: ["https://example.com/luna.jpg"],
                latitude: 10.123456,
                longitude: -74.123456,
                size: .small,
                adoptionStatus: .inProgress,
                species: .cat
            ),
            Pet(
                id: UUID(),
                name: "Rocky",
                age: 4,
                description: "Perro enérgico que necesita mucho ejercicio.",
                breed: "Border Collie",
                weight: 18.5,
                images: ["https://example.com/rocky.jpg"],
                latitude: 10.123456,
                longitude: -74.123456,
                size: .large,
                adoptionStatus: .available,
                species: .dog
            ),
            Pet(
                id: UUID(),
                name: "Coco",
                age: 1,
                description: "Conejo juguetón que disfruta de las zanahorias.",
                breed: "Rex",
                weight: 1.8,
                images: ["https://example.com/coco.jpg"],
                latitude: 10.123456,
                longitude: -74.123456,
                size: .small,
                adoptionStatus: .adopted,
                species: .other
            ),
            Pet(
                id: UUID(),
                name: "Bella",
                age: 5,
                description: "Una perrita dulce que ama acurrucarse.",
                breed: "Golden Retriever",
                weight: 28.0,
                images: ["https://example.com/bella.jpg"],
                latitude: 10.123456,
                longitude: -74.123456,
                size: .large,
                adoptionStatus: .inProgress,
                species: .dog
            ),
            Pet(
                id: UUID(),
                name: "Oliver",
                age: 3,
                description: "Gato juguetón que ama explorar nuevos lugares.",
                breed: "Maine Coon",
                weight: 6.0,
                images: ["https://example.com/oliver.jpg"],
                latitude: 10.123456,
                longitude: -74.123456,
                size: .medium,
                adoptionStatus: .available,
                species: .cat
            )
        ]
    }
}
