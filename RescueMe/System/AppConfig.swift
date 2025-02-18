import Foundation

struct AppConfig {
    static let shared = AppConfig()
    private let manager = KeychainManager.shared
    
    var userToken: String?
    
    private init() {
        readUserToken()
    }
    
    mutating private func readUserToken() {
        guard let data = manager.readKey(label: "usrTkn") else { return }
        userToken = String(data: data, encoding: .utf8)
    }
}
