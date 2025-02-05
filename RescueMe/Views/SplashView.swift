import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Image(.logoAdoptifurro)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 250)
            Spacer()
            LoadingView(color: .white)
        }
        .padding(.vertical, 100)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange)
    }
}

#Preview {
    SplashView()
}
