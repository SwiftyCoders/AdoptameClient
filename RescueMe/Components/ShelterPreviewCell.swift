import SwiftUI

struct ShelterPreviewCell: View {
    var shelter: Shelter
    var onTapGesture: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            HStack(spacing: 8) {
                shelterImage
                shelterInformation
                Spacer()
                chevronImage
            }
        }
        .buttonStyle(.bordered)
        .foregroundStyle(.primary)
        .padding(.horizontal)
    }
    
    private var shelterImage: some View {
        Image(.shelterDemo)
            .resizable()
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            .accessibilityHidden(true)
            .padding(.vertical, 4)
    }
    
    private var shelterInformation: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(shelter.name)
                .lineLimit(1)
                .font(.title3)
                .bold()
                .dynamicTypeSize(.medium ... .accessibility3)
                .accessibilityLabel("Shelter name: \(shelter.name)")
                .accessibilityAddTraits(.isHeader)
                .accessibilitySortPriority(1)
            
            Text(shelter.formattedAddress)
                .lineLimit(1)
                .font(.callout)
                .foregroundStyle(.secondary)
                .dynamicTypeSize(.medium ... .accessibility3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var chevronImage: some View {
        Image(systemName: "chevron.right")
            .font(.title2)
            .bold()
            .padding(.trailing, 10)
    }
}

#Preview {
    VStack {
        ShelterPreviewCell(shelter: .previewShelter, onTapGesture: {})
    }
}
