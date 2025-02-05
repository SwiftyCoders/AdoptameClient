import SwiftUI

struct IntroDescriptionView: View {
    var title: String
    var description: String
    var lineSpacing: CGFloat = 10
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text(title)
                .font(.title)
                .bold()
            Text(description)
                .font(.callout)
                .foregroundStyle(.gray)
            Divider()
        }
        .lineLimit(4)
        .safeAreaPadding(.horizontal)
        .lineSpacing(lineSpacing)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    IntroDescriptionView(title: "Adoptify - Where Furry Tales Begin", description: "Embark on a heartwarming journey to find your perfect companion. Swipe, match, and open your heart to a new furry friend ")
}
