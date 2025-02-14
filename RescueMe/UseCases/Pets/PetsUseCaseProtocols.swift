import Foundation

protocol GetAllPetsUseCaseProtocol {
    func exectue() async throws -> [Pet]
}

protocol GetPetsByTypeUseCaseProtocol {
    func exectue(type: Specie) async throws -> [Pet]
}

protocol GetPetsByLocationUseCaseProtocol {
    func exectue(latitude: Double, longitude: Double) async throws -> [Pet]
}

protocol GetPetByIDUseCaseProtocol {
    func exectue(id: UUID) async throws -> Pet
}

protocol AddNewPetUseCaseProtocol {
    func exectue(pet: PetDTO) async throws
}

protocol DeletePetUseCaseProtocol {
    func execute(petID: UUID) async throws
}

protocol UpdatePetUseCaseProtocol {
    func execute(petID: UUID, pet: PetDTO) async throws
}

protocol GetFilteredPetsUseCaseProtocol {
    func execute(latitude: Double, longitude: Double, specie: Specie, gender: PetGender, size: PetSize, age: PetAge,  adoptionType: AdoptionType) async throws -> [Pet]
}
