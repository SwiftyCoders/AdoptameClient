import SwiftUI

struct ShelterPreviewCell: View {
    var shelter: Shelter
    var onTapGesture: () -> Void
    
    var body: some View {
        
        Button(action: onTapGesture) {
            HStack(spacing: 16) {
                shelterImage
                shelterInformation
                chevronImage
            }
            .frame(maxWidth: .infinity)
        }
        .foregroundStyle(.primary)
    }
    
    private var shelterImage: some View {
        Image(.hiro1)
            .resizable()
            .scaledToFit()
            .frame(width: 80)
            .clipShape(Circle())
            .padding()
            .accessibilityHidden(true)
    }
    
    private var shelterInformation: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(shelter.name)
                .font(.title2)
                .bold()
                .dynamicTypeSize(.medium ... .accessibility3)
                .accessibilityLabel("Shelter name: \(shelter.name)")
                .accessibilityAddTraits(.isHeader)
                .accessibilitySortPriority(1)
            
            Text(shelter.formattedAddress)
                .font(.callout)
                .foregroundStyle(.secondary)
                .dynamicTypeSize(.medium ... .accessibility3)
        }
    }
    
    private var chevronImage: some View {
        Image(systemName: "chevron.right.circle.fill")
            .font(.title)
            .foregroundStyle(.primaryOrange)
    }
}


#Preview {
    VStack {
        ShelterPreviewCell(shelter: .previewShelter, onTapGesture: {})
    }
}
