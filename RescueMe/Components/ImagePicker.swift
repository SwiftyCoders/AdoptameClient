//
//  SwiftUIView.swift
//  RescueMe
//
//  Created by María Pérez Pascual on 7/2/25.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        
        ZStack {
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .shadow(radius: 10)
            } else {
                Text("Selecciona tu imagen de perfil")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 250)
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
                    .background(Color(red: 222 / 255, green: 153 / 255, blue: 54 / 255))
                    .cornerRadius(10)
            }
            .onChange(of: selectedItem) { _, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            .offset(x: 80, y: 90)
        }
        
    }
}

#Preview {
    ImagePicker()
}
