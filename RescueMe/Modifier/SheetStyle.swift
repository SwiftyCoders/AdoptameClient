import SwiftUI

struct FloatSheet: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .padding(.bottom, -24)
            .presentationDetents([.height(410)])
            .presentationBackground(.clear)
    }
}

extension View {
    func floatSheetStyle() -> some View {
        modifier(FloatSheet())
    }
}
