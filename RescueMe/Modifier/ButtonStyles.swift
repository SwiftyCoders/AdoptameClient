import SwiftUI

//MARK: - CapsuleWide
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
}

//MARK: - NextStyle
