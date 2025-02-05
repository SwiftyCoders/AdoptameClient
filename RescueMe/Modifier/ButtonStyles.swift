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

extension ButtonStyle where Self == CapsuleWide {
    static func capsuleWide(_ bg: Color = .orange, fg: Color = .white) -> CapsuleWide {
        CapsuleWide(color: bg, fontColor: fg)
    }
}

//MARK: - NextStyle
