import SwiftUI

@main
struct RescueMeApp: App {
    @State private var navigationManager = NavigationManager()
    @State private var loginVM = LoginViewModel()
    private var appConfig = AppConfig.shared
    
    var body: some Scene {
        WindowGroup {
            if loginVM.isUserLogged {
                Text("HOME")
            } else {
                LoginView()
                    .environment(navigationManager)
                    .environment(loginVM)
            }
        }
    }
}
