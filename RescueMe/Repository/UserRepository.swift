import Foundation
import SCNetwork

protocol UserRepositoryProtocol {
    func newUser(user: UserPostDTO) async throws
    func loginUser(user: UserPostDTO) async throws
    func updateUser(user: UserDTO) async throws
    func deleteUser() async throws
    func getUser() async throws -> User
}

struct UserRepository: UserRepositoryProtocol, NetworkRepositoryProtocol {
    var session: URLSession = .shared
    
    func newUser(user: UserPostDTO) async throws {
        try await postJSON(urlReq: .APIRequest(url: APIEndpoint.newUser, httpMethod: .post, body: user), statusCode: 201)
    }
    
    func loginUser(user: UserPostDTO) async throws {
        let data = try await postJSON(urlReq: .APIRequest(url: APIEndpoint.loginUser, httpMethod: .post, body: user), statusCode: 200)
        
        if let data { KeychainManager.shared.storeKey(key: data, label: "usrTkn") }
    }
    
    func updateUser(user: UserDTO) async throws {
        
    }
    
    func deleteUser() async throws {
        
    }
    
    func getUser() async throws -> User {
        User.previewAdopter
    }
}
