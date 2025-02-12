import SwiftUI

struct PetAttributeGrid: View {
    enum AttributeTitle: String {
        case gender = "Gender"
        case age = "Age"
        case size = "Size"
        
        var attributeColor: Color {
            switch self {
            case .gender:
                    .brown
            case .age:
                    .blue
            case .size:
                    .green
            }
        }
    }
    
    var title: AttributeTitle = AttributeTitle.size
    var value: String = "n/a"
    
    var body: some View {
        VStack(spacing: 14) {
            Text(title.rawValue)
                .font(.subheadline)
                .foregroundStyle(.gray)
            Text(value)
                .font(.title3)
                .bold()
        }
        .frame(height: 110)
        .frame(minWidth: 150, maxWidth: 200)
        .background {
            RoundedRectangle(cornerRadius: 4)
                .fill(title.attributeColor.opacity(0.15))
        }
    }
}

#Preview {
    VStack {
        PetAttributeGrid(title: .gender, value: "Male")
        Button("Cat", systemImage: "cat") { }
            .buttonSelectStyle(true)
        Button("Cat", systemImage: "cat") { }
            .buttonSelectStyle()
    }
    
}
