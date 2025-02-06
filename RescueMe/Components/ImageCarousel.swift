import SwiftUI

struct ImageItem: Identifiable, Hashable {
    let id = UUID()
    let imageName: ImageResource
}

struct ImageCarousel<ImageType: Identifiable & Hashable>: View {
    let images: [ImageType]
    let imageProvider: (ImageType) -> Image

    var body: some View {
        VStack {
            TabView {
                ForEach(images) { imageItem in
                    VStack {
                        imageProvider(imageItem)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
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
        }
        Spacer()
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
