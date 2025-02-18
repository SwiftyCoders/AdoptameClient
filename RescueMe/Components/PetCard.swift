import SwiftUI

struct PetCard: View {
    var petModel: Pet
    let heartButtonAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(.dogImageMock)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .overlay(alignment: .topTrailing) {
                    HeartButton {
                        heartButtonAction()
                    }
                    .padding(10)
                }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(petModel.name)
                    .font(.headline)
                    .bold()
                
                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.footnote)
                        .foregroundColor(.primaryOrange)
                    
                    Group {
                        Text(String(format: "%.1f km", petModel.shelter.latitude))
                        Text("•")
                        Text(petModel.breed)
                            .lineLimit(1)
                    }
                    .font(.footnote)
                    .foregroundColor(.secondary)
                }
            }
            .padding(.top, 8)
        }
    }
}

#Preview {
    ScrollView {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
            ForEach(Pet.previewPets) { pet in
                PetCard(petModel: .previewPet, heartButtonAction: {})
            }
        }
        .safeAreaPadding()
    }
}

#Preview {
    PetCard(petModel: .previewPet, heartButtonAction: {})
        .safeAreaPadding(.horizontal)
}
