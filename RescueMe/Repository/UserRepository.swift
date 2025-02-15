import Foundation

protocol UserRepositoryProtocol {
    func newUser(user: UserDTO) async throws
    func updateUser(user: UserDTO) async throws
    func deleteUser() async throws
    func getUser() async throws -> User
}

struct UserRepository: UserRepositoryProtocol {
    func newUser(user: UserDTO) async throws {
        
    }
    
    func updateUser(user: UserDTO) async throws {
        
    }
    
    func deleteUser() async throws {
        
    }
    
    func getUser() async throws -> User {
        User.previewAdopter
    }
}
