import SwiftUI

struct PetsGrid: View {
    let shelter: Shelter
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(Pet.previewPets) { pet in
                    Button {
                        
                    } label: {
                        PetCard(petModel: pet)
                    }
                    .foregroundStyle(.primary)
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    PetsGrid(shelter: .previewShelter)
}
