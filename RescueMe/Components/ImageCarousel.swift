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
                            .scaledToFill()
                            .frame(width: 50)
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .background(.orange)
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
        ImageItem(imageName: .heartIcon),
        ImageItem(imageName: .logoAdoptifurro),
        ImageItem(imageName: .heartIcon)
    ]

    var body: some View {
        ImageCarousel(images: images) { Image($0.imageName) }
    }
}

#Preview {
    ExampleView()
}
