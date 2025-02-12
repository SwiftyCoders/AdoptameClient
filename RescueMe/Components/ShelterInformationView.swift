import SwiftUI

struct ShelterInformationView: View {
    var shelter: Shelter
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 16) {
            VStack {
                Image(.hiro1)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .accessibilityLabel("Shelter image of \(shelter.name)")
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(shelter.name)
                    .font(.title3)
                    .bold()
                    .accessibilityLabel("Shelter name: \(shelter.name)")
                    .accessibilityAddTraits(.isHeader)
                    .accessibilitySortPriority(1)
                
                shelterInfoRow("mappin.and.ellipse", text: shelter.formattedAddress)
                shelterInfoRow("phone.badge.waveform.fill", text: shelter.formattedPhone)
                shelterInfoRow("envelope.fill", text: shelter.contactEmail)
                shelterInfoRow("globe", text: shelter.formattedWebsite)
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .accessibilityElement(children: .combine)
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
