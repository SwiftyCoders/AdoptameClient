import SwiftUI

struct LoadingView: View {
    @State var isAnimating = false
    
    var color: Color = .primaryOrange
    var size: Double = 70
    
    var body: some View {
        VStack {
            Color.black.opacity(0.4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .overlay {
            VStack {
                Circle()
                    .trim(from: 0.1, to: 0.9)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [color.opacity(0), color, color]),
                            center: .center
                        ),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .frame(width: size, height: size)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .animation(
                        Animation.linear(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: isAnimating
                    )
            }
            .frame(maxWidth: 300, maxHeight: 200)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .onAppear {
                isAnimating = true
            }
        }
        
    }
}

#Preview {
    LoadingView()
}
