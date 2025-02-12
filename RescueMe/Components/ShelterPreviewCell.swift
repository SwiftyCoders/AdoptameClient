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
    
    private var chevronImage: some View {
        Image(systemName: "chevron.right.circle.fill")
            .font(.title)
            .foregroundStyle(.primaryOrange)
    }
    
    private var shelterImage: some View {
        Image(.hiro1)
            .resizable()
            .scaledToFit()
            .frame(width: 80)
            .clipShape(Circle())
            .padding()
            .accessibilityLabel("Shelter image of \(shelter.name)")
    }
    
    private var shelterInformation: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(shelter.name)
                .font(.title2)
                .bold()
                .accessibilityLabel("Shelter name: \(shelter.name)")
                .accessibilityAddTraits(.isHeader)
                .accessibilitySortPriority(1)
            
            Text(shelter.formattedAddress)
                .font(.callout)
                .foregroundStyle(.secondary)
                .dynamicTypeSize(.medium ... .accessibility3)
        }
    }
}


#Preview {
    VStack {
        ShelterPreviewCell(shelter: .previewShelter, onTapGesture: {})
    }
}
