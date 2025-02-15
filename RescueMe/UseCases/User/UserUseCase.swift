import Foundation

final class NewUserUseCase: NewUserUseCaseProtocol {
    let userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func execute(user: UserDTO) async throws {
        try await userRepository.newUser(user: user)
    }
}

final class UpdateUserUseCase: UpdateUserUseCaseProtocol {
    let userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func execute(user: UserDTO) async throws {
        try await userRepository.updateUser(user: user)
    }
}

final class DeleteUserUseCase: DeleteUserUseCaseProtocol {
    let userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func execute() async throws {
        try await userRepository.deleteUser()
    }
}

final class GetUserUseCase: GetUserUseCaseProtocol {
    let userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func execute() async throws -> User {
        try await userRepository.getUser()
    }
}

