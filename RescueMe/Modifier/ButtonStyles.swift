import SwiftUI

struct CapsuleWide: ButtonStyle {
    var color: Color = .orange
    var fontColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(fontColor)
            .background(color)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.80 : 1)
    }
}

extension View {
    func buttonPrimaryStyle(bg: Color = .primaryOrange, fg: Color = .white) -> some View {
        self.buttonStyle(CapsuleWide(color: bg, fontColor: fg))
    }
    
    func buttonSecundaryStyle(bg: Color = .secondaryOrange, fg: Color = .primaryOrange) -> some View {
        self.buttonStyle(CapsuleWide(color: bg, fontColor: fg))
    }
    
    func buttonSelectStyle(_ isSelected: Bool = false, accentColor: Color = .primaryOrange) -> some View {
        self.buttonStyle(SelectionButton(isSelected: isSelected, color: accentColor))
    }
}

struct SelectionButton: ButtonStyle {
    var isSelected: Bool = false
    var color: Color = .orange
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .foregroundStyle(isSelected ? .white : .black)
            .background(isSelected ? color : .white)
            .clipShape(Capsule())
            .overlay {
                Capsule()
                    .stroke(isSelected ? Color.gray.opacity(0.0) : Color.gray.opacity(0.5), lineWidth:  1)
            }
    }
}


