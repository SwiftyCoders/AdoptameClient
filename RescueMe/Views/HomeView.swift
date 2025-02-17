import SwiftUI

struct HomeView: View {
    
    @Environment(NavigationManager.self) private var navigationManager
    
    @State private var showUserProfile = false
    
    var body: some View {
        
        @Bindable var bNavManager = navigationManager
        
        NavigationStack(path: $bNavManager.homeNavigationPath) {
            ScrollView(showsIndicators: false){
                VStack(spacing: 30) {
                    HomeBannerCarousel()
                    
                    HStack(spacing: 20) {
                        PetButtonCell(emoji: "🐕", petCategory: "Dog", gridType: .circle) {}
                        PetButtonCell(emoji: "🐈", petCategory: "Cat", gridType: .circle) {}
                        PetButtonCell(emoji: "🐾", petCategory: "Other", gridType: .circle) {}
                    }
                    
                    ScrollHorizontalComponent(title: "Pets Near You", buttonTitle: "View All", items: Pet.previewPets, componentHeight: 160, componentWidth: 200) { pet in
                        PetCard(petModel: pet, heartButtonAction: {})
                    } navigationAction: {}
                    
                    ScrollHorizontalComponent(title: "Shelters Near You", buttonTitle: "View All", items: Pet.previewPets, componentHeight: 160, componentWidth: 200) { pet in
                        PetCard(petModel: pet, heartButtonAction: {})
                    } navigationAction: {}
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal, content: {
                    AppNavigationBar(logoApp: .logoAdoptifurro, imageUser: Image("person.circle.fill"), tapToNavigation: {
                        showUserProfile.toggle()
                    })
                })
            }
            .fullScreenCover(isPresented: $showUserProfile) {
                // MARK: TODO: Create UserProfileView
                Text("User Profile")
                Button {
                    showUserProfile.toggle()
                } label: {
                    Text("Close Profile")
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(NavigationManager())
}
