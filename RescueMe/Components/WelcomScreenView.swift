import SwiftUI

struct WelcomScreenView2: View {
    var body: some View {
        VStack {
            Image(.iphoneScreenShot)
                .resizable()
                .scaledToFit()
                .frame(width: .infinity, height: 1200)
                .padding(.top, 600)
                .background(Color.primaryOrange)
                .frame(width: .infinity, height: UIScreen.main.bounds.height / 2.2)
                .mask {
                    RoundedBottomRectangle()
//                        .frame(height: UIScreen.main.bounds.height / 2.2, alignment: .top)
                }
                .ignoresSafeArea()
//            Color(.primaryOrange)
//                .clipShape(RoundedBottomRectangle())
//                .ignoresSafeArea()
//                .frame(height: UIScreen.main.bounds.height / 2.2)
            Spacer()
            VStack(spacing: 30) {
                Text("Adoptify - Where Furry Tales Begin")
                    .font(.title)
                    .bold()
                Text("Embark on a heartwarming journey to find your perfect companion. Swipe, match, and open your heart to a new furry friend.")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            .lineSpacing(10)
            .multilineTextAlignment(.center)
            .safeAreaPadding()
            Spacer()
            
        }
    }
}


struct WelcomScreenView: View {
    var body: some View {
        ZStack {
            Color(.primaryOrange)
            Image(.iphoneScreenShot)
                .resizable()
                .scaledToFit()
                .padding(.top, 80)
            VStack {
                Spacer()
                RoundedBottomRectangle2()
                    .frame(height: UIScreen.main.bounds.height / 2)
                    .shadow(radius: 20)
                // ojo
                    .foregroundStyle(.white)
                    .overlay(alignment: .top) {
                        VStack(spacing: 30) {
                            Spacer()
                            Text("Adoptify - Where Furry Tales Begin")
                                .font(.title)
                                .bold()
                            Text("Embark on a heartwarming journey to find your perfect companion. Swipe, match, and open your heart to a new furry friend ")
                                .font(.callout)
                                .foregroundStyle(.gray)
                            Spacer()
//                            HStack {
//                                Button("Cosa una") {}
//                                Button("Cosa una") {}
//                            }
//                            .padding(.bottom, 20)
//                            .buttonStyle(.borderedProminent)
                        }
                        .lineSpacing(10)
                        .multilineTextAlignment(.center)
                        .safeAreaPadding()
                    }
            }
        }
        .ignoresSafeArea()
    }
}


struct RoundedBottomRectangle: Shape {
    var curveOffset: CGFloat = 80
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.maxY + curveOffset))
        path.addLine(to: CGPoint(x: 0, y: 0))
        return path
    }
}


struct RoundedBottomRectangle2: Shape {
    var curveOffset: CGFloat = 80
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: 0),
                          control: CGPoint(x: rect.midX, y: 0 + curveOffset))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        return path
    }
}

#Preview {
    WelcomScreenView()
}
