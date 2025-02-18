import SwiftUI

@Observable
final class NavigationManager {
    //MARK: LOGIN
    enum LoginDestinationViews: Hashable {
        case register
        case login
        case roleSelection
        case shelterForm
    }
    
    var loginNavigationPath = NavigationPath()
    
    func navigate(to destination: LoginDestinationViews){
        loginNavigationPath.append(destination)
    }
    
    func goBackLogin() {
        loginNavigationPath.removeLast()
    }
    
    func goLoginRoot() {
        loginNavigationPath.removeLast(loginNavigationPath.count)
    }
    
    
    //MARK: HOME
    enum HomeDestinationViews: Hashable {
        case viewOne
    }
    
    var homeNavigationPath = NavigationPath()
    
    func navigateDetail(to destination: HomeDestinationViews){
        homeNavigationPath.append(destination)
    }
    
    func goBackHome() {
        homeNavigationPath.removeLast()
    }
    
    func goHomeRootView() {
        homeNavigationPath.removeLast(homeNavigationPath.count)
    }
}
