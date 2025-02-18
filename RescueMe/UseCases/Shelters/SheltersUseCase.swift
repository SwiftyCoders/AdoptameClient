import Foundation

final class GetAllSheltersUseCase: GetAllSheltersUseCaseProtocol {
    let shelterRepository: ShelterRepositoryProtocol
    
    init(shelterRepository: ShelterRepositoryProtocol = ShelterRepository()) {
        self.shelterRepository = shelterRepository
    }
    
    func exectue() async throws -> [Shelter] {
        try await shelterRepository.getAllShelters()
    }
}

final class GetSheltersByLocationUseCase: GetSheltersByLocationUseCaseProtocol {
    let shelterRepository: ShelterRepositoryProtocol
    
    init(shelterRepository: ShelterRepositoryProtocol = ShelterRepository()) {
        self.shelterRepository = shelterRepository
    }
    
    func exectue(latitude: Double, longitude: Double) async throws -> [Shelter] {
        try await shelterRepository.getShelterByLocation(latitude: latitude, longitude: longitude)
    }
}

final class GetShelterByIDUseCase: GetShelterByIDUseCaseProtocol {
    let shelterRepository: ShelterRepositoryProtocol
    
    init(shelterRepository: ShelterRepositoryProtocol = ShelterRepository()) {
        self.shelterRepository = shelterRepository
    }
    
    func exectue(id: UUID) async throws -> Shelter {
        try await shelterRepository.shelterByID(id: id)
    }
}

final class AddNewShelterUseCase: AddNewShelterUseCaseProtocol {
    let shelterRepository: ShelterRepositoryProtocol
    
    init(shelterRepository: ShelterRepositoryProtocol = ShelterRepository()) {
        self.shelterRepository = shelterRepository
    }
    
    func exectue(shelter: PostShelterDTO) async throws {
        try await shelterRepository.addNewShelter(shelter: shelter)
    }
}

final class DeleteShelterUseCase: DeleteShelterUseCaseProtocol {
    let shelterRepository: ShelterRepositoryProtocol
    
    init(shelterRepository: ShelterRepositoryProtocol = ShelterRepository()) {
        self.shelterRepository = shelterRepository
    }
    
    func execute(shelterID: UUID) async throws {
        try await shelterRepository.deleteShelter(id: shelterID)
    }
}

final class UpdateShelterUseCase: UpdateShelterUseCaseProtocol {
    let shelterRepository: ShelterRepositoryProtocol
    
    init(shelterRepository: ShelterRepositoryProtocol = ShelterRepository()) {
        self.shelterRepository = shelterRepository
    }
    
    func execute(shelterID: UUID, shelter: ShelterDTO) async throws {
        try await shelterRepository.updateShelter(id: shelterID, shelter: shelter)
    }
}
