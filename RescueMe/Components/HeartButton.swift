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
                .padding(12)
                .background(.primaryOrange)
                .clipShape(Circle())
                .foregroundStyle(.white)
        }
        .accessibilityHint(Text("Double tap to add to favorites"))
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    HeartButton(action: {})
}
