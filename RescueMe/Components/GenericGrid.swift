import SwiftUI

struct GenericGrid<T: Identifiable, CONTENT: View> : View {
    let horizontalSpacing: CGFloat
    let verticalSpacing: CGFloat
    let numberOfColumns: Int
    let contentItems: [T]
    let content: (T) -> CONTENT
    let onItemTap: () -> Void
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: horizontalSpacing), count: numberOfColumns), spacing: verticalSpacing) {
                ForEach(contentItems) { item in
                    Button {
                        onItemTap()
                    } label: {
                        content(item)
                    }
                    .foregroundStyle(.primary)
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    GenericGrid(horizontalSpacing: 16, verticalSpacing: 16, numberOfColumns: 2, contentItems: Pet.previewPets) { pet in
        PetCard(petModel: pet)
    } onItemTap: {
        
    }
}
