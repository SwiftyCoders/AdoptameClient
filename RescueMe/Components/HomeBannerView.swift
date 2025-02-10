import SwiftUI

struct HomeBannerView: View {
    @State private var currentIndex = 0
    @State private var timer: Timer?
    private let banners: [ImageResource] = [.banners1, .banners2, .banners3]
    private let bannerDescriptions: [String] = [
            "Promoción especial en productos DogsFest",
            "Nuevos productos disponibles",
            "Descubre las últimas novedades en perrolandia"
        ]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(banners.indices, id: \.self) { index in
                Link(destination: URL(string: "https://www.apple.com")!) {
                    Image(banners[index])
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 6)
                        .accessibilityLabel(bannerDescriptions[index])
                        .overlay(alignment: .leading) {
                            Text(bannerDescriptions[index])
                                .containerRelativeFrame(.horizontal) { num , _  in
                                    num / 1.8
                                }
                                .font(.title2)
                                .foregroundStyle(Color.white)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                                .padding(.horizontal)
                        }
                }
                .accessibilityElement(children: .combine)
            }
        }
        .frame(height: 150)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .accessibilityHidden(true)
        .onAppear { autoScroll() }
    }
    
    private func autoScroll() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { time in
            withAnimation(.easeInOut) {
                currentIndex = (currentIndex + 1) % banners.count
            }
        }
    }
    
    func stopAutoScroll() {
        timer = nil
        timer?.invalidate()
    }
}

#Preview {
    HomeBannerView()
        .safeAreaPadding()
}
