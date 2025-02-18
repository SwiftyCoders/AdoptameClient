import Foundation

protocol NewUserUseCaseProtocol {
    func execute(user: UserPostDTO) async throws
}

protocol LoginUseCaseProtocol {
    func execute(user: UserPostDTO) async throws
}

protocol UpdateUserUseCaseProtocol {
    func execute(user: UserDTO) async throws
}

protocol DeleteUserUseCaseProtocol {
    func execute() async throws
}

protocol GetUserUseCaseProtocol {
    func execute() async throws -> User
}
