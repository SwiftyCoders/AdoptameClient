import SwiftUI

struct HeartButton: View {
    var size: Double = 20
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(.heartIcon)
                .resizable()
                .scaledToFit()
                .frame(width: size)
                .padding(6)
                .background(.orange)
                .clipShape(Circle())
                .foregroundStyle(.white)
        }
        .accessibilityHint(Text("Double tap to add to favorites"))
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    VStack {
        HeartButton(action: {})
        HStack {
            Image(.customHome)
            Image(.customLocation)
            Image(.customLocationFill)
            Image(.customHousePet)
            Image(.customHousePetFill)
            Image(.customPetHeart)
            Image(.customPetHeartFill)
        }
        .font(.largeTitle)
        
    }
    
}
