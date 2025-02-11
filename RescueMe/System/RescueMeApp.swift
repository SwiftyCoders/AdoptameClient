//
//  RescueMeApp.swift
//  RescueMe
//
//  Created by Alberto Alegre Bravo on 3/2/25.
//

import SwiftUI

@main
struct RescueMeApp: App {
    var body: some Scene {
        WindowGroup {
            MapView(shelters: Shelter.previewShelters)
        }
    }
}
