import SwiftUI

struct ShelterSegmentedView: View {
    @State private var selection = 0
    let shelter: Shelter = .previewShelter
    
    var body: some View {
        VStack {
            Picker("Select View or Details", selection: $selection) {
                Text("Pets: \(shelter.pets.count)")
                    .tag(0)
                    .accessibilityLabel("Pets available: \(shelter.pets.count)")
                Text("Adoption Policy")
                    .tag(1)
                    .accessibilityLabel("Adoption Policy Information")
            }
            .foregroundStyle(.red)
            .pickerStyle(.segmented)
            .safeAreaPadding(.horizontal)
            .onAppear {
                UISegmentedControl.appearance().selectedSegmentTintColor = .primaryOrange
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            }
            Spacer()
            switch selection {
            case 0:
                PetsGrid(shelter: shelter)
                    .accessibilityLabel("Grid of available pets")
            default:
                Text("Adoption Policy WIP")
                    .accessibilityLabel("Adoption policy")
            }
            Spacer()
        }
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    ShelterSegmentedView()
}
