import Foundation
import SCNetwork

protocol PetRepositoryProtocol {
    func getAllPets() async throws -> [Pet]
    func petByID(id: UUID) async throws -> Pet
    func addNewPet(pet: PetDTO) async throws
    func deletePet(id: UUID) async throws
    func updatePet(id: UUID, pet: PetDTO) async throws
}

struct PetRepository: NetworkRepositoryProtocol, PetRepositoryProtocol {
    var session: URLSession = .shared
    
    func getAllPets() async throws -> [Pet] {
        try await getJSON(urlReq: .APIRequest(url: APIEndpoint.getAllPets), model: [PetDTO].self).map(\.mapToModel)
    }
    
    func petByID(id: UUID) async throws -> Pet {
        try await getJSON(urlReq: .APIRequest(url: APIEndpoint.getPet(id: id)), model: PetDTO.self).mapToModel
    }
    
    func addNewPet(pet: PetDTO) async throws {
        try await postJSON(urlReq: .APIRequest(url: APIEndpoint.createPet(), httpMethod: .post, body: pet), statusCode: 201)
    }
    
    func deletePet(id: UUID) async throws {
        try await postJSON(urlReq: .APIRequest(url: APIEndpoint.deletePet(id: id), httpMethod: .delete), statusCode: 200)
    }
    
    func updatePet(id: UUID, pet: PetDTO) async throws {
        try await postJSON(urlReq: .APIRequest(url: APIEndpoint.replacePet(id: id), httpMethod: .put, body: pet), statusCode: 200)
    }
}
