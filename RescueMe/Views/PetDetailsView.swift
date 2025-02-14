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
        ScrollView {
            VStack(alignment: .leading) {
                if let images = petModel.images {
                    // ImageCarousel(images: imagesTest) { Image($0.imageName) }
                    // .frame(height: 300)
                }
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.orange)
                    Text("1,2 km")
                        .font(.body)
                }
                .padding(.leading)


                HStack {
                    PetAttributeGridCell(title: .gender, value: "Male")
                    PetAttributeGridCell(title: .age, value: "Adult")
                    PetAttributeGridCell(title: .size, value: "Medium")
                }
                .padding(.horizontal)
                
                ShelterPreviewCell(shelter: .previewShelter, onTapGesture: {})
                
                textComponent(title: "About Mochi", description: "Mochi es un perrito muy cariñoso y lleno de energía. Siempre está dispuesto a jugar y explorar su entorno, especialmente en espacios abiertos como parques o jardines. Su carácter amigable lo convierte en un gran compañero para familias y personas activas.")

                textComponent(title: "Personality Traits", description: "Mochi es un perro sociable y curioso. Le encanta conocer nuevas personas y otros animales, lo que lo hace ideal para hogares con más mascotas. Es un perro inteligente y aprende rápido, por lo que con la educación adecuada puede desarrollar habilidades y buenos modales.")

                textComponent(title: "Ideal Home", description: "El hogar ideal para Mochi es un lugar donde tenga suficiente espacio para moverse y explorar. Aunque puede adaptarse a un departamento, necesita paseos regulares y estimulación mental para mantenerse feliz. Se sentiría más cómodo con una familia activa que disfrute de actividades al aire libre y pueda brindarle la atención que necesita.")

                textComponent(title: "Adoption Information", description: "Mochi está completamente vacunado, desparasitado y en excelente estado de salud. Su adopción incluye una revisión veterinaria, su cartilla de vacunación al día y un seguimiento para asegurarnos de que se adapta bien a su nuevo hogar. Si estás interesado en adoptarlo, te invitamos a completar nuestro formulario de adopción y nuestro equipo se pondrá en contacto contigo para conocer más sobre tu hogar y estilo de vida. ")
                
                HStack {
                    HeartButton(action: {})
                        .padding(.bottom, 20)
                
                    Button {
                    } label: {
                        Text("Adopt")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.primaryOrange)
                            .cornerRadius(30)
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 20)
                }
                .padding()
            }
        }
        .navigationTitle(petModel.name)
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
