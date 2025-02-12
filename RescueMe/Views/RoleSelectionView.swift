import SwiftUI

struct RoleSelectionView: View {
    @State private var selectedRole: UserRole = .adopter
    
    enum UserRole {
        case owner
        case adopter
    }
    
    var body: some View {
        VStack(spacing: 24) {
            IntroDescriptionView(
                title: "Tell us about yourself",
                description: "Are you a Pet Owner or Organization ready to find loving homes? Or a Pet Adopter looking for your new best friend?"
            )
            roleButton(title: "Pet Owner or Organization", isSelected: selectedRole == .owner) {
                selectedRole = .owner
            }
            
            roleButton(title: "Pet Adopter", isSelected: selectedRole == .adopter) {
                selectedRole = .adopter
            }
            
            Button {  } label: {
                Text("Continue")
            }
            .buttonPrimaryStyle()
        }
        .padding()
    }
    
    private func roleButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
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
