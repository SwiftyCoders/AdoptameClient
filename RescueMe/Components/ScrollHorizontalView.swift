import SwiftUI

struct ScrollHorizontalView <T: Identifiable, content: View> : View {
    
    let title: String
    let navigationButtonTitle: String
    let items: [T]
    let componentHeight: CGFloat
    let componentWidth: CGFloat
    let itemView: (T) -> content
    let navigationAction: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                    .lineLimit(1)
                    .bold()
                
                Spacer()
                
                Button(action: navigationAction) {
                    HStack {
                        Text("\(navigationButtonTitle) \(Image(systemName: "arrow.forward"))")
                            .foregroundStyle(.primaryOrange)
                            .bold()
                    }
                }
                .foregroundStyle(.primary)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(items) { item in
                        itemView(item)
                            .frame(maxWidth: componentWidth)
                    }
                }
            }
            .frame(height: componentHeight)
            .padding(.horizontal)
        }
    }
}

#Preview {
    VStack(spacing: 25) {
        
        ScrollHorizontalView(title: "Pets Near You", navigationButtonTitle: "View All", items: Pet.previewPets, componentHeight: 160, componentWidth: 200) { pet in
            PetCard(petModel: pet, heartButtonAction: {})
        } navigationAction: {
        
        }

        
        ScrollHorizontalView(title: "Pets Near You", navigationButtonTitle: "View All", items: Shelter.previewShelters, componentHeight: 100, componentWidth: 400) { shelter in
            ShelterPreviewCell(shelter: shelter, onTapGesture: {})
        } navigationAction: {
        
        }
        .padding(.vertical)
    }
}
