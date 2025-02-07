import Foundation
import SCNetwork

protocol ShelterRepositoryProtocol {
    func getAllShelters() async throws -> [Shelter]
    func shelterByID(id: UUID) async throws -> Shelter
    func addNewShelter(shelter: ShelterDTO) async throws
    func deleteShelter(id: UUID) async throws
    func updateShelter(id: UUID, shelter: ShelterDTO) async throws
}

struct ShelterRepositoryProtocolRepository: NetworkRepositoryProtocol, ShelterRepositoryProtocol {
    var session: URLSession = .shared
    
    func getAllShelters() async throws -> [Shelter] {
        try await getJSON(urlReq: .APIRequest(url: APIEndpoint.getAllShelters), model: [ShelterDTO].self).map(\.mapToModel)
    }
    
    func shelterByID(id: UUID) async throws -> Shelter {
        try await getJSON(urlReq: .APIRequest(url: APIEndpoint.getShelter(id: id)), model: ShelterDTO.self).mapToModel
    }
    
    func addNewShelter(shelter: ShelterDTO) async throws {
        try await postJSON(urlReq: .APIRequest(url: APIEndpoint.createShelter(), httpMethod: .post, body: shelter), statusCode: 201)
    }
    
    func deleteShelter(id: UUID) async throws {
        try await postJSON(urlReq: .APIRequest(url: APIEndpoint.deleteShelter(id: id), httpMethod: .delete), statusCode: 200)
    }
    
    func updateShelter(id: UUID, shelter: ShelterDTO) async throws {
        try await postJSON(urlReq: .APIRequest(url: APIEndpoint.replaceShelter(id: id), httpMethod: .put, body: shelter), statusCode: 200)
    }
}
