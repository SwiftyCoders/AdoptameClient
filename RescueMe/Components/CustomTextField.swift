import SwiftUI

struct CustomTextField: View {
    @Binding var input: String
    @State private var errorText = false
    @State private var errorMsg = ""
    
    let label: String
    let prompt: String
    let systemName: String
    let isFocused: Bool
    let validate: (String) -> LocalizedStringResource?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            HStack {
                Image(systemName: systemName)
                    .opacity(0.7)
                TextField(prompt, text: $input)
                    .autocorrectionDisabled()
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
            input: $campo,
            label: "Nombre",
            prompt: "Ingresa tu nombre",
            systemName: "person",
            isFocused: true
        ) { value in
            if value.isEmpty {
                return "cannot be empty."
            } else {
                return nil
            }
        }
        CustomTextField(
            input: $campo,
            label: "Email",
            prompt: "Ingresa tu email",
            systemName: "envelope",
            isFocused: true
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
