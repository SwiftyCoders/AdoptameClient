import SwiftUI

@Observable @MainActor
final class LoginViewModel {
    let registerUseCase = NewUserUseCase()
    let loginUseCase = LoginUseCase()
    
    var isUserLogged = false
    var showPrivacy = false
    var showTerms = false
    var userEmail: String = "Bito@gmail.com"
    var userPassword: String = "12345678"
    var isLoading = false
    var loggedSuccessfull = false
    
    func registerNewUser() async {
        let newUser = UserPostDTO(email: userEmail, password: userPassword)
        do {
            try await registerUseCase.execute(user: newUser)
        } catch {
            print("ERROR REGISTERING USER WITH EMAIL AND PASSWORD: \(error)")
        }
    }
    
    func loginUser() async {
        isLoading = true
        let user = UserPostDTO(email: userEmail, password: userPassword)
        do {
            try await loginUseCase.execute(user: user)
            try await Task.sleep(for: .seconds(2))
            loggedSuccessfull = true
            isLoading = false
        } catch {
            print("ERROR LOGIN USER: \(error)")
        }
    }
}
