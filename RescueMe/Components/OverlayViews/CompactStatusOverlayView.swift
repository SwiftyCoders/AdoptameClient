import SwiftUI

struct CompactStatusOverlayView: View {
    @Binding var isVisible: Bool
    let pet: Pet
    var description: String = "Added to favorite"
    var systemName: String = "checkmark.circle.fill"
    private let activeTime: Double = 1.3
    @State private var offset: CGFloat = -120
    
    var body: some View {
        HStack {
            Image(systemName: getPetRaceIcon(pet.species))
                .font(.title2)
            Spacer()
            VStack {
                Text("\(pet.name) pet.Raza")
                    .bold()
                Text(description)
                    .foregroundStyle(.gray)
            }
            .lineLimit(1)
            .font(.subheadline)
            Spacer()
            Image(systemName: systemName)
                .font(.title2)
                .foregroundStyle(.green)
        }
        .frame(maxWidth: 220)
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(.thickMaterial)
        .clipShape(Capsule())
        .shadow(radius: 5)
        .sensoryFeedback(.success, trigger: offset)
        .accessibilityAddTraits(.isSummaryElement)
        .accessibilityLabel("\(pet.name) \(description)")
        .offset(y: offset)
        .onAppear {
            withAnimation(.spring(duration: 0.1)) { offset = 0 }
            Task {
                try await Task.sleep(for: .seconds(activeTime))
                await MainActor.run {
                    withAnimation {
                        offset = -120
                        isVisible = false
                    }
                }
            }
        }
    }
    
    func getPetRaceIcon(_ race: Specie) -> String {
        return switch race {
        case .dog:
            "dog.circle.fill"
        case .cat:
            "cat.circle.fill"
        case .other:
            "bird.circle.fill"
        }
        
    }
}

#Preview {
    @Previewable @State var notification = false
    ZStack {
        Image(.dogImageMock)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
        Button("Show") {
            notification.toggle()
        }
        .buttonStyle(.borderedProminent)
    }
    .overlay(alignment: .top) {
        if notification {
            CompactStatusOverlayView(isVisible: $notification, pet: .previewPet)
        }
    }
}


