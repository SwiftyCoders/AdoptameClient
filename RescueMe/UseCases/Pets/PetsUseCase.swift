import Foundation

final class GetAllPetsUseCase: GetAllPetsUseCaseProtocol {
    let petRepository: PetRepositoryProtocol
    
    init(petRepository: PetRepositoryProtocol = PetRepository()) {
        self.petRepository = petRepository
    }
    
    func exectue() async throws -> [Pet] {
        try await petRepository.getAllPets()
    }
}

final class GetAllPetsByTypeUseCase: GetPetsByTypeUseCaseProtocol {
    let petRepository: PetRepositoryProtocol
    
    init(petRepository: PetRepositoryProtocol = PetRepository()) {
        self.petRepository = petRepository
    }
    
    func exectue(type: Specie) async throws -> [Pet] {
        try await petRepository.getPetByType(specie: type)
    }
}

final class GetPetsByLocationUseCase: GetPetsByLocationUseCaseProtocol {
    let petsRepository: PetRepositoryProtocol
    
    init(petsRepository: PetRepositoryProtocol = PetRepository()) {
        self.petsRepository = petsRepository
    }
    
    func exectue(latitude: Double, longitude: Double) async throws -> [Pet] {
        try await petsRepository.getNearestPets(latitude: latitude, longitude: longitude)
    }
}

final class GetPetByIDUseCase: GetPetByIDUseCaseProtocol {
    let petRepository: PetRepositoryProtocol
    
    init(repository: PetRepositoryProtocol = PetRepository()) {
        self.petRepository = repository
    }
    
    func exectue(id: UUID) async throws -> Pet {
        try await petRepository.petByID(id: id)
    }
}

final class AddNewPetUseCase: AddNewPetUseCaseProtocol {
    let petRepository: PetRepositoryProtocol
    
    init(petRepository: PetRepositoryProtocol = PetRepository()) {
        self.petRepository = petRepository
    }
    
    func exectue(pet: PetDTO) async throws {
        try await petRepository.addNewPet(pet: pet)
    }
}

final class DeletePetUseCase: DeletePetUseCaseProtocol {
    let petRepository: PetRepositoryProtocol
    
    init(petRepository: PetRepositoryProtocol = PetRepository()) {
        self.petRepository = petRepository
    }
    
    func execute(petID: UUID) async throws {
        try await petRepository.deletePet(id: petID)
    }
}

final class UpdatePetUseCase: UpdatePetUseCaseProtocol {
    let petRepository: PetRepositoryProtocol
    
    init(petRepository: PetRepositoryProtocol = PetRepository()) {
        self.petRepository = petRepository
    }
    
    func execute(petID: UUID, pet: PetDTO) async throws {
        try await petRepository.updatePet(id: petID, pet: pet)
    }
}

final class GetFilteredPetsUseCase: GetFilteredPetsUseCaseProtocol {
    let petRepository: PetRepositoryProtocol
    
    init(petRepository: PetRepositoryProtocol = PetRepository()) {
        self.petRepository = petRepository
    }
    
    func execute(latitude: Double, longitude: Double, specie: Specie, gender: PetGender, size: PetSize, age: PetAge,  adoptionType: AdoptionType) async throws -> [Pet] {
        try await petRepository.getFilteredPets(latitude: latitude, longitude: longitude, specie: specie, gender: gender, size: size, age: age, adoptionType: adoptionType)
    }
}
