import SwiftUI

struct PetButtonCell: View {
    
    enum PetsGridType {
        case rectangle
        case circle
    }
    
    let emoji: String
    let petCategory: String
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
                            .stroke( Color.gray.opacity(0.5),
                                     lineWidth: 1
                                   )
                    )
                }
                .accessibilityLabel("\(petCategory) emoji")
                .accessibilityHint("Tap to select \(petCategory)")
                
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
                                        Color.gray.opacity(0.5), lineWidth : 1)
                            )
                    }
                    .accessibilityLabel("\(petCategory) emoji")
                    .accessibilityHint("Tap to select \(petCategory)")
                    
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
            PetButtonCell(emoji: "🐈", petCategory: "Cats", gridType: .rectangle, onTapAction: {})
            PetButtonCell(emoji: "🐕", petCategory: "Dogs", gridType: .rectangle, onTapAction: {})
            PetButtonCell(emoji: "🦅", petCategory: "Birds", gridType: .rectangle, onTapAction: {})
        }
        
        HStack(spacing: 16) {
            PetButtonCell(emoji: "🐈", petCategory: "Cats", gridType: .circle, onTapAction: {})
            PetButtonCell(emoji: "🐕", petCategory: "Dogs", gridType: .circle, onTapAction: {})
            PetButtonCell(emoji: "🦅", petCategory: "Birds", gridType: .circle, onTapAction: {})
        }
    }
}
