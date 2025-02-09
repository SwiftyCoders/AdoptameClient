//
//  PetsGrid.swift
//  RescueMe
//
//  Created by Alam Alonzo on 9/2/25.
//

import SwiftUI

struct PetsGrid: View {
    let shelter: Shelter
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(shelter.pets) { pet in
                    PetCardView(petModel: pet)
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    PetsGrid(shelter: .previewShelter)
}
