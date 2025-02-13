import SwiftUI

@main
struct RescueMeApp: App {
    var body: some Scene {
        WindowGroup {
            MapView(shelters: Shelter.previewShelters)
        }
    }
}
