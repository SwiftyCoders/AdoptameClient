import SwiftUI

struct StatusOverlayView: View {
    @Binding var isVisible: Bool
    let title: String
    let pet: Pet
    let description: String
    var systemName: String = "text.badge.checkmark"
    private let activeTime: Double = 1.3
    @State private var scaleEffect: CGFloat = 0.9
    @State private var opacity: Double = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 100, maxWidth: 105)
                .padding(.bottom, 50)
            Group {
                Text(title)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 4)
                Text("\(Text(pet.name).bold()) \(description)")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .lineSpacing(6)
                    .lineLimit(3)
            }
            .frame(width: 220)
        }
        .padding(.horizontal, 36)
        .padding(.top, 40)
        .padding(.bottom, 20)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .opacity(opacity)
        .scaleEffect(scaleEffect)
        .sensoryFeedback(.success, trigger: opacity)
        .accessibilityAddTraits(.isSummaryElement)
        .accessibilityLabel("\(title) \(pet.name) \(description)")
        .onAppear {
            withAnimation(.easeOut(duration: 0.15)) {
                scaleEffect = 1.0
                opacity = 1.0
            }
            Task {
                try await Task.sleep(for: .seconds(activeTime))
                await MainActor.run {
                    withAnimation(.easeIn(duration: 0.1)) {
                        scaleEffect = 0.9
                        opacity = 0.4
                        isVisible = false
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var notification = false
    NavigationStack {
        ZStack {
            Image(.dogImageMock)
            VStack {
                Button("Show") {
                    notification.toggle()
                }
                .buttonStyle(.borderedProminent)
            }
            if notification {
                StatusOverlayView(isVisible: $notification, title: "Added", pet: .previewPet, description: "was added to your favorite list in Home.")
            }
        }
    }
}
