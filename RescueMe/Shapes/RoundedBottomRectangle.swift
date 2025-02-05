import SwiftUI

struct RoundedBottomRectangle: Shape {
    var curveOffset: CGFloat = 80
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: 0),
                          control: CGPoint(x: rect.midX, y: 0 + curveOffset))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        return path
    }
}
