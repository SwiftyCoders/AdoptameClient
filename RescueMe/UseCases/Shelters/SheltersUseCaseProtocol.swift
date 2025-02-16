import Foundation

protocol GetAllSheltersUseCaseProtocol {
    func exectue() async throws -> [Shelter]
}

protocol GetSheltersByLocationUseCaseProtocol {
    func exectue(latitude: Double, longitude: Double) async throws -> [Shelter]
}

protocol GetShelterByIDUseCaseProtocol {
    func exectue(id: UUID) async throws -> Shelter
}

protocol AddNewShelterUseCaseProtocol {
    func exectue(shelter: PostShelterDTO) async throws
}

protocol DeleteShelterUseCaseProtocol {
    func execute(shelterID: UUID) async throws
}

protocol UpdateShelterUseCaseProtocol {
    func execute(shelterID: UUID, shelter: ShelterDTO) async throws
}
