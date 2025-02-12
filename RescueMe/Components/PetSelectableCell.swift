import SwiftUI

struct PetSelectableCell: View {
    
    enum PetsGridType {
        case rectangle
        case circle
    }
    
    let emoji: String
    let petCategory: String
    let isSelected: Bool
    let gridType: PetsGridType
    let onTapAction: () -> Void
    
    var body: some View {
        Group {
            switch gridType {
            case .rectangle:
                Button {
                    onTapAction()
                } label: {
                    VStack(spacing: 8) {
                        Text(emoji)
                            .font(.system(size: 40))
                        
                        Text(petCategory)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                    .frame(width: 110, height: 120)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(
                                isSelected ? Color.primaryOrange : Color.gray.opacity(0.5),
                                lineWidth: isSelected ? 2 : 1
                            )
                    )
                }
                .accessibilityLabel("\(petCategory) emoji")
                .accessibilityHint("Tap to select \(petCategory)")
                .accessibilityValue(isSelected ? "Selected" : "Not Selected")
                .accessibilityAddTraits(isSelected ? .isSelected : [])
                
            case .circle:
                VStack(spacing: 8) {
                    Button {
                        onTapAction()
                    } label: {
                        Text(emoji)
                            .font(.system(size: 40))
                        
                            .frame(width: 100, height: 100)
                            .overlay(
                                Circle()
                                    .stroke(
                                        isSelected ? Color.primaryOrange : Color.gray.opacity(0.5), lineWidth: isSelected ? 2 : 1)
                            )
                    }
                    .accessibilityLabel("\(petCategory) emoji")
                    .accessibilityHint("Tap to select \(petCategory)")
                    .accessibilityValue(isSelected ? "Selected" : "Not Selected")
                    .accessibilityAddTraits(isSelected ? .isSelected : [])
                    
                    Text(petCategory)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
        }
        .accessibilityElement(children: .combine)
    }
}


#Preview {
    VStack(spacing: 32) {
        HStack(spacing: 16) {
            PetSelectableCell(emoji: "🐈", petCategory: "Cats", isSelected: false, gridType: .rectangle, onTapAction: {})
            PetSelectableCell(emoji: "🐕", petCategory: "Dogs", isSelected: true, gridType: .rectangle, onTapAction: {})
            PetSelectableCell(emoji: "🦅", petCategory: "Birds", isSelected: false, gridType: .rectangle, onTapAction: {})
            
        }
        
        HStack(spacing: 16) {
            PetSelectableCell(emoji: "🐈", petCategory: "Cats", isSelected: true, gridType: .circle, onTapAction: {})
            PetSelectableCell(emoji: "🐕", petCategory: "Dogs", isSelected: false, gridType: .circle, onTapAction: {})
            PetSelectableCell(emoji: "🦅", petCategory: "Birds", isSelected: false, gridType: .circle, onTapAction: {})
        }
    }
}
