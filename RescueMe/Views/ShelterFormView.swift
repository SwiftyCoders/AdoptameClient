import SwiftUI
import MapKit

enum ShelterField {
    case name
    case address
    case description
    case email
    case web
    
    var hasPrevious: Bool {
        switch self {
        case .name: return false
        case .description, .address, .email, .web: return true
        }
    }
    
    var hasNext: Bool {
        switch self {
        case .web: return false
        case .address, .description, .email, .name: return true
        }
    }
    
    mutating func moveToNext() {
        switch self {
        case .name: self = .address
        case .address: self = .description
        case .description: self = .email
        case .email: self = .web
        case .web: break
        }
    }
    
    mutating func moveToPrevious() {
        switch self {
        case .name: break
        case .web: self = .email
        case .email: self = .description
        case .description: self = .address
        case .address: self = .name
        }
    }
}

struct ShelterFormView: View {
    @State var name: String = ""
    @State var address: String = ""
    @State var description: String = ""
    @State var email: String = ""
    @State var website: String = ""
    @State var showLocationSearchView = false
    @FocusState var focus: ShelterField?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack(spacing: 24) {
                    Text("Shelter Registration")
                        .font(.largeTitle)
                        .bold()
                        .accessibilityAddTraits(.isHeader)
                        .accessibilityLabel("Shelter Registration")
                    
                    Text("Register your shelter to join our network and give visibility to animals in need of a home 🐶")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .accessibilityHint("This form allows you to register a shelter.")
                }
                
                ImagePicker(size: 180)
                    .padding()
                    .accessibilityLabel("Shelter image")
                    .accessibilityHint("Select an image to represent your shelter.")
                
                shelterForm
                    .accessibilitySortPriority(1)
                
                Button {
                    
                } label: {
                    Text("Confirm")
                }
                .buttonPrimaryStyle()
                .accessibilityLabel("Confirm button")
                .accessibilityHint("Press to complete the shelter registration.")
            }
        }
        .onChange(of: focus, { oldValue, newValue in
            if newValue == .address {
                focus = .description
            }
            
            if oldValue == .address {
                showLocationSearchView = true
            }
        })
        .sheet(isPresented: $showLocationSearchView) {
            focus = .description
        } content: {
            LocationSearchView(selectedAddress: $address)
                .accessibilityLabel("Address search")
                .accessibilityHint("Enter a shelter address.")
        }
        .formStyle(.columns)
        .padding()
    }
    
    var shelterForm: some View {
        Form {
            CustomTextField(input: $name, label: "Name", prompt: "Name", systemName: "person", isFocused: focus == .name) { name in
                validateName(name: name)
            }
            .focused($focus, equals: .name)
            .onSubmit { focus?.moveToNext() }
            .accessibilityLabel("Name field")
            .accessibilityHint("Enter the name of the shelter.")
            
            CustomTextField(input: $address, label: "Address", prompt: "Address", systemName: "location", isFocused: focus == .address) { _ in
                nil
            }
            .focused($focus, equals: .address)
            .onSubmit { focus?.moveToNext() }
            .accessibilityLabel("Address field")
            .accessibilityHint("Enter the shelter's address.")
            
            CustomTextField(input: $description, label: "Description", prompt: "Description", systemName: "person", isFocused: focus == .description) { name in
                nil
            }
            .focused($focus, equals: .description)
            .onSubmit { focus?.moveToNext() }
            .accessibilityLabel("Description field")
            .accessibilityHint("Describe the shelter and its mission.")
            
            CustomTextField(input: $email, label: "Email", prompt: "Email", systemName: "envelope", isFocused: true) { name in
                nil
            }
            .focused($focus, equals: .email)
            .keyboardType(.emailAddress)
            .onSubmit { focus?.moveToNext() }
            .accessibilityLabel("Email field")
            .accessibilityHint("Enter the shelter's contact email.")

            CustomTextField(input: $website, label: "Website", prompt: "Website", systemName: "network", isFocused: true) { name in
                nil
            }
            .focused($focus, equals: .web)
            .keyboardType(.webSearch)
            .submitLabel(.done)
            .onSubmit {
                dismissKeyboard()
            }
            .accessibilityLabel("Website field")
            .accessibilityHint("Enter the shelter's website.")
        }
    }
    
    func validateName(name: String) -> LocalizedStringResource? {
        if name.isEmpty {
            return "The name cannot be empty"
        }
        return nil
    }
}

#Preview {
    NavigationStack {
        ShelterFormView()
    }
}
