import SwiftUI

struct PetDetailsView: View {
    var petModel: Pet
    let imagesTest: [ImageItem] = [
        ImageItem(imageName: .hiro1),
        ImageItem(imageName: .hiro2),
        ImageItem(imageName: .hiro3),
        ImageItem(imageName: .hiro4)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                if let _ = petModel.images {
                     ImageCarousel(images: imagesTest) { Image($0.imageName) }
                     .frame(height: 300)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .firstTextBaseline) {
                        Text("Hirochan")
                            .font(.title)
                            .bold()
                        Text("(BorderCollie)")
                            .italic()
                    }
                    
                    HStack {
                        Image(.locationIcon)
                            .foregroundColor(.orange)
                        Text("1,2 km")
                            .font(.body)
                    }
                }
                .padding(.bottom)
                .padding(.leading)
                
                HStack {
                    PetAttributeGridCell(title: .gender, value: "Male")
                    PetAttributeGridCell(title: .age, value: "Adult")
                    PetAttributeGridCell(title: .size, value: "Medium")
                }
                .padding(.horizontal)
                
                ShelterPreviewCell(shelter: .previewShelter) {
                    
                }
                .padding(.top)
                
                VStack {
                    textComponent(title: "About Mochi", description: "Mochi es un perrito muy cariñoso y lleno de energía. Siempre está dispuesto a jugar y explorar su entorno, especialmente en espacios abiertos como parques o jardines. Su carácter amigable lo convierte en un gran compañero para familias y personas activas.")

                    textComponent(title: "Personality Traits", description: "Mochi es un perro sociable y curioso. Le encanta conocer nuevas personas y otros animales, lo que lo hace ideal para hogares con más mascotas. Es un perro inteligente y aprende rápido, por lo que con la educación adecuada puede desarrollar habilidades y buenos modales.")

                    textComponent(title: "Ideal Home", description: "El hogar ideal para Mochi es un lugar donde tenga suficiente espacio para moverse y explorar. Aunque puede adaptarse a un departamento, necesita paseos regulares y estimulación mental para mantenerse feliz. Se sentiría más cómodo con una familia activa que disfrute de actividades al aire libre y pueda brindarle la atención que necesita.")

                    textComponent(title: "Adoption Information", description: "Mochi está completamente vacunado, desparasitado y en excelente estado de salud. Su adopción incluye una revisión veterinaria, su cartilla de vacunación al día y un seguimiento para asegurarnos de que se adapta bien a su nuevo hogar. Si estás interesado en adoptarlo, te invitamos a completar nuestro formulario de adopción y nuestro equipo se pondrá en contacto contigo para conocer más sobre tu hogar y estilo de vida. ")
                }
            }
        }
        .onAppear {
            UIScrollView.appearance().delaysContentTouches = false
        }
        .safeAreaInset(edge: .bottom, spacing: 24) {
            VStack {
                Divider()
                HStack(spacing: 18) {
                    HeartButton(size: 24,action: {})
                        
                    Button {
                        
                    } label: {
                        Text("I'm interested!")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(maxWidth: 250)
                            .padding(12)
                            .background(Color.primaryOrange)
                            .cornerRadius(30)
                    }
                }
                .padding(.top, 12)
                .padding(.horizontal)
            }
            .background(.thinMaterial)
        }
    }
    
    private func textComponent(title: String, description: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(description)
                .font(.body)
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        PetDetailsView(petModel: .previewPet)
    }
}
