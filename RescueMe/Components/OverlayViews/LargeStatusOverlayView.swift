import SwiftUI

struct LargeStatusOverlayView: View {
    @Binding var isVisible: Bool
    let title: String
    let pet: Pet
    let description: String
    var systemName: String = "text.badge.checkmark"
    private let activeTime: Double = 1
    
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .sensoryFeedback(.success, trigger: isVisible)
        .accessibilityAddTraits(.isSummaryElement)
        .accessibilityLabel("\(pet.name) \(description)")
        .onAppear {
            Task {
                try await Task.sleep(for: .seconds(activeTime))
                await MainActor.run {
                    withAnimation {
                        isVisible = false
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var notification = false
    ZStack {
        Image(.dogImageMock)
        Button("Show") {
            notification.toggle()
        }
        .buttonStyle(.borderedProminent)
    }
    .sheet(isPresented: $notification) {
        LargeStatusOverlayView(isVisible: $notification, title: "Added", pet: .previewPet, description: "was added to your favorite list in Home.")
            .floatSheetStyle()
    }
    
}


