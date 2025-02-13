import SwiftUI

struct RoleSelectionView: View {
    
    @State var selectedRole: UserRole = .adopter
    var lineSpacing: CGFloat = 10
    
    var body: some View {
        VStack(spacing: 24) {
            introDescription(title: "Tell us about yourself", description: "Are you a Pet Shelter or Organization looking to find loving homes for animals? Or a Pet Adopter searching for your new best friend?", lineSpacing: lineSpacing)
                .accessibilityElement(children: .combine)
            
            roleButton(title: "Pet Owner or Shelter", isSelected: selectedRole == .shelter) {
                selectedRole = .shelter
            }
            .accessibilityLabel("Select Pet Owner or Shelter role")
            .accessibilityHint("Double tap to select the role of pet owner or shelter")
            .accessibilityValue(selectedRole == .shelter ? "Selected" : "Not selected")
            
            roleButton(title: "Pet Adopter", isSelected: selectedRole == .adopter) {
                selectedRole = .adopter
            }
            .accessibilityLabel("Select Pet Adopter role")
            .accessibilityHint("Double tap to select the role of pet adopter")
            .accessibilityValue(selectedRole == .adopter ? "Selected" : "Not selected")
            
            Spacer()
            
            Divider()
            Button {  } label: {
                Text("Continue")
            }
            .buttonPrimaryStyle()
            .accessibilityLabel("Continue with selected role")
            .accessibilityHint("Double tap to proceed with your role selection")
        }
        .safeAreaPadding(.horizontal)
        .safeAreaPadding(.vertical, 30)
    }
    
    private func introDescription(title: String, description: String, lineSpacing: CGFloat) -> some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(description)
                .font(.callout)
                .foregroundStyle(.gray)
        }
        .lineLimit(4)
        .lineSpacing(lineSpacing)
    }
    
    private func roleButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 30)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(isSelected ? Color.primaryOrange : Color.gray.opacity(0.4),
                                lineWidth: isSelected ? 2 : 1)
                        .foregroundStyle(isSelected ? .primaryOrange : .gray)
                )
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    RoleSelectionView()
}
