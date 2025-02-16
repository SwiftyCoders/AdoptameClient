import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 30) {
                
                HomeBannerCarousel()
                
                HStack(spacing: 20) {
                    PetSelectableCell(emoji: "🐕", petCategory: "Dog", isSelected: true, gridType: .circle) {
                    }
                    PetSelectableCell(emoji: "🐈", petCategory: "Cat", isSelected: false, gridType: .circle) {
                        
                    }
                    PetSelectableCell(emoji: "🐾", petCategory: "Other", isSelected: false, gridType: .circle) {
                        
                    }
                }
                
                ScrollHorizontalView(title: "Pets Near You", navigationButtonTitle: "View All", items: Pet.previewPets, componentHeight: 160, componentWidth: 200) { pet in
                    PetCard(petModel: pet, heartButtonAction: {})
                } navigationAction: {
                
                }
                
                ScrollHorizontalView(title: "Based on your preferences", navigationButtonTitle: "View All", items: Pet.previewPets, componentHeight: 160, componentWidth: 200) { pet in
                    PetCard(petModel: pet, heartButtonAction: {})
                } navigationAction: {
                
                }
            }
        }
        .safeAreaPadding(.vertical)
    }
}

#Preview {
    HomeView()
}
