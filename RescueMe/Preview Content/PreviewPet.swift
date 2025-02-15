import Foundation

extension Pet {
    static var previewPet: Pet {
        Pet(id: UUID(), name: "HiroChan", age: .adult, about: "El Mejor", personality: "Adorable", idealHome: "La mía", medicalCondition: "Sanísimo", adoptionInfo: "Es perfecto", breed: "BorderCollie", shelter: .previewShelter, images: [], size: .medium, adoptionStatus: .adopted, species: .dog)
    }

    static var previewPets: [Pet] {
        return [
            Pet(id: UUID(), name: "Lucio", age: .young, about: "El diablo", personality: "Malísimo", idealHome: "La de laura", medicalCondition: "Sano", adoptionInfo: "No se adopta", breed: "Tigreso", shelter: .previewShelter, images: [], size: .medium, adoptionStatus: .adopted, species: .cat),
            Pet(id: UUID(), name: "Lucio", age: .young, about: "El diablo", personality: "Malísimo", idealHome: "La de laura", medicalCondition: "Sano", adoptionInfo: "No se adopta", breed: "Tigreso", shelter: .previewShelter, images: [], size: .medium, adoptionStatus: .adopted, species: .cat),
            Pet(id: UUID(), name: "Lucio", age: .young, about: "El diablo", personality: "Malísimo", idealHome: "La de laura", medicalCondition: "Sano", adoptionInfo: "No se adopta", breed: "Tigreso", shelter: .previewShelter, images: [], size: .medium, adoptionStatus: .adopted, species: .cat),
            Pet(id: UUID(), name: "Lucio", age: .young, about: "El diablo", personality: "Malísimo", idealHome: "La de laura", medicalCondition: "Sano", adoptionInfo: "No se adopta", breed: "Tigreso", shelter: .previewShelter, images: [], size: .medium, adoptionStatus: .adopted, species: .cat),
            Pet(id: UUID(), name: "Lucio", age: .young, about: "El diablo", personality: "Malísimo", idealHome: "La de laura", medicalCondition: "Sano", adoptionInfo: "No se adopta", breed: "Tigreso", shelter: .previewShelter, images: [], size: .medium, adoptionStatus: .adopted, species: .cat),
            Pet(id: UUID(), name: "Lucio", age: .young, about: "El diablo", personality: "Malísimo", idealHome: "La de laura", medicalCondition: "Sano", adoptionInfo: "No se adopta", breed: "Tigreso", shelter: .previewShelter, images: [], size: .medium, adoptionStatus: .adopted, species: .cat)
        ]
    }
}
