import SwiftUI

struct AdopterFinalStep: View {
    @State private var progress = 0.25
    @State private var userName = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Final Steps!")
                .font(.largeTitle)
            Text("we're almost there! fill in your personal details to create a profile and start your journey towards a furry friendships.")
                .lineLimit(3)
            ImagePicker()
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
            Spacer()
            Button("Finish") { }
                .buttonPrimaryStyle()
                .bold()
        }
        .safeAreaInset(edge: .top) {
            HStack {
                Gauge(value: progress) {}
                    .tint(.primaryOrange)
                Text(" \(Int(progress * 4)) / 4")
                    .padding(.leading)
            }
        }
        .safeAreaPadding(.horizontal)
    }
}

#Preview {
    AdopterFinalStep()
}
