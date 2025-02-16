import SwiftUI

@main
struct RescueMeApp: App {
    
    @State private var navigationManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(navigationManager)
        }
    }
}
