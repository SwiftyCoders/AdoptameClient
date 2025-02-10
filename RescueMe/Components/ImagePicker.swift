import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    var size: Double = 220
    
    var body: some View {
        ZStack {
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipShape(Circle())
                    .shadow(radius: 10)
            } else {
                Text("Selecciona tu imagen de perfil")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(.circle)
            }
            
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()
            ) {
                Image(systemName: "pencil")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(width: 40, height: 40)
                    .background(.primaryOrange)
                    .cornerRadius(10)
            }
            .onChange(of: selectedItem) { _, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            .offset(x: 60, y: 70)
        }
    }
}

#Preview {
    ImagePicker()
}
