import SwiftUI

struct CustomTextField: View {
    let label: String
    let prompt: String
    let systemName: String
    let isFocused: Bool
    @Binding var input: String
    let validate: (String) -> LocalizedStringResource?
    
    @State private var errorText = false
    @State private var errorMsg = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            HStack {
                Image(systemName: systemName)
                    .opacity(0.7)
                TextField(prompt, text: $input)
                Spacer()
                clearTextButton
            }
            .buttonStyle(.plain)
            .foregroundStyle(errorText ? .red : .primary)
            .padding(.leading)
            .frame(height: 55)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.primary.opacity(0.03))
            }
            errorTextView
        }
        .onChange(of: input) {
            validateField(input)
        }
    }
    
    private var errorTextView: some View {
        Text(errorMsg)
            .font(.caption)
            .foregroundStyle(.red)
            .opacity(errorText ? 1.0 : 0.0)
            .frame(minHeight: 15)
    }
    
    @ViewBuilder var clearTextButton: some View {
        if !input.isEmpty, isFocused {
            Button {
                input = ""
                errorMsg = ""
                errorText = false
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .padding(.trailing)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    private func validateField(_ value: String) {
        if let message = validate(value) {
            errorMsg = "\(label) \(String(localized: message))"
            errorText = true
        } else {
            errorMsg = ""
            errorText = false
        }
    }
}

#Preview {
    @Previewable @State var campo = ""
    Form {
        CustomTextField(
            label: "Nombre",
            prompt: "Ingresa tu nombre",
            systemName: "person",
            isFocused: true,
            input: $campo
        ) { value in
            if value.isEmpty {
                return "cannot be empty."
            } else {
                return nil
            }
        }
        CustomTextField(
            label: "Email",
            prompt: "Ingresa tu email",
            systemName: "envelope",
            isFocused: true,
            input: $campo
        ) { value in
            if value.isEmpty {
                return "Lo de sexy... lo dejamos para luego"
            } else {
                return nil
            }
        }
    }
    .formStyle(.columns)
    .safeAreaPadding()
}
