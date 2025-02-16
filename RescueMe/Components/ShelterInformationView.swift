import SwiftUI

struct ShelterInformationView: View {
    var shelter: Shelter
    
    @State private var isZoomed = false
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(shelter.name)
                    .font(.title3)
                    .bold()
                
                shelterInfoRow("mappin.and.ellipse", text: shelter.formattedAddress)
                shelterInfoRow("phone.badge.waveform.fill", text: shelter.phone)
                shelterInfoRow("envelope.fill", text: shelter.email ?? "")
                shelterInfoRow("globe", text: shelter.formattedWebsite)
            }
        }
        .padding()
    }
    
    private func shelterInfoRow(_ iconName: String, text: String) -> some View {
        return HStack {
            Image(systemName: iconName)
                .foregroundStyle(.primaryOrange)
                .accessibilityHidden(true)
            Text(text)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .dynamicTypeSize(.medium ... .accessibility3)
            Spacer()
        }
        .accessibilityLabel("\(iconDescription(iconName)): \(text)")
    }
    
    private func iconDescription(_ iconName: String) -> String {
        switch iconName {
        case "mappin.and.ellipse": return "Address"
        case "phone.badge.waveform.fill": return "Phone number"
        case "envelope.fill": return "Email address"
        case "globe": return "Website"
        default: return "Information"
        }
    }
}

#Preview {
    HStack {
        ShelterInformationView(shelter: .previewShelter)
            .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray.opacity(0.2))
}
