import SwiftUI

struct AdopterFinalStep: View {
    @State private var progress = 0.25
    @State private var userName = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            VStack(alignment: .leading, spacing: 6){
                Text("Final Steps!")
                    .bold()
                    .font(.largeTitle)
                    .accessibilityAddTraits(.isHeader)
                Text("we're almost there! fill in your personal details to create a profile and start your journey towards a furry friendships.")
                    .accessibilityLabel("Estamos casi listos. Ingresa tus datos personales para crear tu perfil y comenzar tu camino hacia nuevas amistades.")
                    .lineLimit(3)
            }
            HStack {
                Spacer()
                ImagePicker(size: 180)
                    .accessibilityLabel("Selecciona una imagen de perfil")
                Spacer()
            }
            CustomTextField(
                input: $userName,
                label: "User Name",
                prompt: "How would you like us to call you?",
                systemName: "person",
                isFocused: true) { value in
                    if value.isEmpty {
                        return "Lo de sexy... lo dejamos para luego"
                    } else {
                        return nil
                    }
                }
                .accessibilityElement(children: .combine)
            Spacer()
            Button("Finish") { }
                .buttonPrimaryStyle()
                .bold()
                .accessibilityLabel("Finalizar")
                .accessibilityHint("Completa el proceso de creación de tu perfil")
        }
        .safeAreaInset(edge: .top) {
            HStack {
                Gauge(value: progress) {}
                    .tint(.primaryOrange)
                Text(" \(Int(progress * 4)) / 4")
                    .padding(.leading)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Progreso")
            .accessibilityValue("\(Int(progress * 4)) de 4 completados")
        }
        .safeAreaPadding(.horizontal)
    }
}

#Preview {
    AdopterFinalStep()
}
