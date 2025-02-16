import SwiftUI

struct ScrollHorizontalComponent<T: Identifiable, CONTENT: View> : View {
    let title: String
    let buttonTitle: String
    let items: [T]
    let componentHeight: CGFloat
    let componentWidth: CGFloat
    let itemView: (T) -> CONTENT
    let navigationAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.title2)
                    .lineLimit(1)
                    .bold()
                
                Spacer()
                
                Button(action: navigationAction) {
                    HStack {
                        Text("\(buttonTitle) \(Image(systemName: "arrow.forward"))")
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
        ScrollHorizontalComponent(title: "Pets Near You", buttonTitle: "View All", items: Pet.previewPets, componentHeight: 160, componentWidth: 200) { pet in
            PetCard(petModel: pet, heartButtonAction: {})
        } navigationAction: {
            
        }
        
        ScrollHorizontalComponent(title: "Pets Near You", buttonTitle: "View All", items: Shelter.previewShelters, componentHeight: 100, componentWidth: 400) { shelter in
            ShelterPreviewCell(shelter: shelter, onTapGesture: {})
        } navigationAction: {
            
        }
        .padding(.vertical)
    }
}
