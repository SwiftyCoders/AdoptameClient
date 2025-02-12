import SwiftUI

struct WelcomScreenView<BackgroundContent: View, ForegroundContent: View>: View {
    var background: Color
    var heightRatio: CGFloat
    var curveOffset: CGFloat
    let backgroundContent: BackgroundContent
    let foregroundContent: ForegroundContent
    
    init(
        _ background: Color = .orange,
        heightRatio: CGFloat = 2,
        curveOffset: CGFloat = 80,
        @ViewBuilder backgroundContent: () -> BackgroundContent,
        @ViewBuilder foregroundContent: () -> ForegroundContent
    ) {
        self.background = background
        self.heightRatio = heightRatio
        self.curveOffset = curveOffset
        self.backgroundContent = backgroundContent()
        self.foregroundContent = foregroundContent()
    }

    var body: some View {
        ZStack {
            background
            backgroundContent
                .padding(.top, 80)
            VStack {
                Spacer()
                RoundedBottomRectangle(curveOffset: curveOffset)
                    .fill(.background)
                    .containerRelativeFrame(.vertical) { num, _ in
                        num / heightRatio
                    }
                    .shadow(radius: 20)
                    .overlay(alignment: .center) {
                        foregroundContent
                    }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomScreenView {
        Image(.iphoneScreenShot)
            .resizable()
            .scaledToFit()
    } foregroundContent: {
        VStack(spacing: 0) {
            Spacer()
            IntroDescription(title: "Adoptify - Where Furry Tales Begin", description: "Embark on a heartwarming journey to find your perfect companion. Swipe, match, and open your heart to a new furry friend sad")
            HStack {
                Button("action 1") { }
                    .buttonPrimaryStyle()
                Button("action 2") { }
                    .buttonSecundaryStyle()
            }
            .padding(.bottom, 20)
            .safeAreaPadding()
        }
    }
}
