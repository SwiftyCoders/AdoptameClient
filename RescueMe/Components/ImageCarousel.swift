import SwiftUI

struct ImageItem: Identifiable, Hashable {
    let id = UUID()
    let imageName: ImageResource
}

struct ImageCarousel<ImageType: Identifiable & Hashable>: View {
    @State private var currentIndex = 0
    @State private var timer: Timer?
    
    let images: [ImageType]
    let imageProvider: (ImageType) -> Image

    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(images.indices, id: \.self) { index in
                    VStack {
                        imageProvider(images[index])
                            .resizable()
                            .scaledToFit()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .background {
                ZStack {
                    if let bgImage = images.first {
                        imageProvider(bgImage)
                            .blur(radius: 10)
                    }
                    Color.black.opacity(0.7)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(maxWidth: .infinity, maxHeight: 300)
            .padding()
            .accessibilityLabel("Contiene las imágenes de la mascota")
            .onAppear {
                startAutoScroll()
            }
            .onDisappear {
                stopAutoScroll()
            }
        }
    }
    
    private func startAutoScroll() {
        timer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % images.count
            }
        }
    }
    
    func stopAutoScroll() {
        timer = nil
        timer?.invalidate()
    }
}

//MARK: USAGE EXAMPLE
struct ExampleView: View {
    let images: [ImageItem] = [
        ImageItem(imageName: .hiro1),
        ImageItem(imageName: .hiro2),
        ImageItem(imageName: .hiro3),
        ImageItem(imageName: .hiro4)
    ]

    var body: some View {
        ImageCarousel(images: images) { Image($0.imageName) }
    }
}

#Preview {
    ExampleView()
}
