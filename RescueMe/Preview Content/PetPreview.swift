import Foundation

extension Pet {
    static var previewPet: Pet {
        Pet(
            id: UUID(),
            name: "Paco",
            age: 9,
            description: "A friendly and playful dog, loves to run in the park.",
            breed: "Labrador Retriever",
            weight: 25.5,
            images: ["https://example.com/image1.jpg", "https://example.com/image2.jpg"],
            latitude: 40.7128,
            longitude: -74.0060,
            size: .medium,
            adoptionStatus: .adopted,
            species: .dog
        )
    }
}
