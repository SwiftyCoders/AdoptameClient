import SwiftUI

struct WelcomScreenView<Content: View>: View {
    var background: Color
    var heightRatio: CGFloat
    var curveOffset: CGFloat
    let content: Content
    
    init(_ background: Color = .orange, heightRatio: CGFloat = 2, curveOffset: CGFloat = 80 ,@ViewBuilder content: () -> Content) {
        self.background = background
        self.heightRatio = heightRatio
        self.curveOffset = curveOffset
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color(background)
            Image(.iphoneScreenShot)
                .resizable()
                .scaledToFit()
                .padding(.top, 80)
            VStack {
                Spacer()
                RoundedBottomRectangle(curveOffset: curveOffset)
                    .fill(.background)
                    .containerRelativeFrame(.vertical, { num, _ in
                        num / heightRatio
                    })
                    .shadow(radius: 20)
                    .overlay(alignment: .center) {
                        content
                    }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomScreenView(.green) {
        VStack(spacing: 0) {
            IntroDescriptionView(title: "Adoptify - Where Furry Tales Begin", description: "Embark on a heartwarming journey to find your perfect companion. Swipe, match, and open your heart to a new furry friend sad")
            HStack {
                Button("action 1") { }
                    .buttonStyle(.capsuleWide(.secondaryOrange, fg: .primaryOrange))
                Button("action 2") { }
                    .buttonStyle(.capsuleWide())
            }
            .padding(.bottom, 20)
            .safeAreaPadding()
        }
    }
}
