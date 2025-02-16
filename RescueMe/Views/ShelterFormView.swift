import SwiftUI
import MapKit

enum ShelterField {
    case name
    case address
    case description
    case adoptionPolicy
    case phone
    case email
    case web
    
    var hasPrevious: Bool {
        switch self {
        case .name: return false
        case .description, .address, .adoptionPolicy, .phone, .email, .web: return true
        }
    }
    
    var hasNext: Bool {
        switch self {
        case .web: return false
        case .address, .description, .adoptionPolicy, .phone, .email, .name: return true
        }
    }
    
    mutating func moveToNext() {
        switch self {
        case .name: self = .address
        case .address: self = .phone
        case .phone: self = .description
        case .description: self = .adoptionPolicy
        case .adoptionPolicy: self = .email
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
        case .adoptionPolicy: self = .description
        case .phone:self = .adoptionPolicy
        }
    }
}

struct ShelterFormView: View {
    @State private var vm = ShelterFormViewModel()
    @FocusState var focus: ShelterField?
    
    var body: some View {
        NavigationStack {
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
                        
                        Text("Fields marked with * are required.")
                            .font(.footnote)
                            .italic()
                            .foregroundStyle(.secondary)
                    }
                    
                    ImagePicker(selectedImageData: $vm.image, size: 180)
                        .padding()
                        .accessibilityLabel("Shelter image")
                        .accessibilityHint("Select an image to represent your shelter.")

                    shelterForm
                        .accessibilitySortPriority(1)
                    
                    Button {
                        vm.registerNewShelter()
                    } label: {
                        Text("Confirm")
                    }
                    .buttonPrimaryStyle()
                    .accessibilityLabel("Confirm button")
                    .accessibilityHint("Press to complete the shelter registration.")
                }
            }
            .onAppear {
                UIScrollView.appearance().delaysContentTouches = false
            }
            .onChange(of: focus, { oldValue, newValue in
                if newValue == .address {
                    focus = .phone
                }
                
                if oldValue == .address {
                    vm.showLocationSearchView = true
                }
            })
            .sheet(isPresented: $vm.showLocationSearchView) {
                focus = .phone
            } content: {
                LocationSearchView(selectedAddress: $vm.address, latitude: $vm.latitude, longitude: $vm.longitude)
                    .accessibilityLabel("Address search")
                    .accessibilityHint("Enter a shelter address.")
            }
            .formStyle(.columns)
            .padding()
        }
    }
    
    var shelterForm: some View {
        Form {
            CustomTextField(input: $vm.name, label: "Shelter Name *", prompt: "Name", systemName: "person", isFocused: focus == .name) { name in
                vm.validateName(vm.name)
            }
            .focused($focus, equals: .name)
            .onSubmit { focus?.moveToNext() }
            .accessibilityLabel("Name field")
            .accessibilityHint("Enter the name of the shelter.")

            CustomTextField(input: $vm.address, label: "Address *", prompt: "Address", systemName: "location", isFocused: focus == .address) { _ in
                vm.validateAddress(vm.address)
            }
            .focused($focus, equals: .address)
            .onSubmit { focus?.moveToNext() }
            .accessibilityLabel("Address field")
            .accessibilityHint("Enter the shelter's address.")
            
            
            CustomTextField(input: $vm.phone, label: "Phone *", prompt: "Phone", systemName: "iphone", isFocused: focus == .phone) { _ in
                vm.validatePhone(vm.phone)
            }
            .keyboardType(.phonePad)
            .textContentType(.telephoneNumber)
            .focused($focus, equals: .phone)
            .onSubmit { focus?.moveToNext() }
            .accessibilityLabel("Phone field")
            .accessibilityHint("Enter the shelter's phone.")
            
            CustomTextField(input: $vm.description, label: "Description", prompt: "Description", systemName: "person", isFocused: focus == .description) { name in
                vm.validateDescription(vm.description)
            }
            .focused($focus, equals: .description)
            .onSubmit { focus?.moveToNext() }
            .accessibilityLabel("Description field")
            .accessibilityHint("Describe the shelter and its mission.")
            
            Text("Adoption Policy")
                .font(.headline)
            TextEditor(text: $vm.adoptionPolicy)
                .frame(height: 100)
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 8).stroke())
                .focused($focus, equals: .adoptionPolicy)
                .onSubmit { focus?.moveToNext() }
                .accessibilityLabel("Adoption policies field")
                .accessibilityHint("Describe the shelter adoption policies.")
                .padding(.bottom)
            
            CustomTextField(input: $vm.email, label: "Email", prompt: "Email", systemName: "envelope", isFocused: true) { name in
                vm.validateEmail(vm.email)
            }
            .focused($focus, equals: .email)
            .keyboardType(.emailAddress)
            .onSubmit { focus?.moveToNext() }
            .accessibilityLabel("Email field")
            .accessibilityHint("Enter the shelter's contact email.")

            CustomTextField(input: $vm.website, label: "Website", prompt: "Website", systemName: "network", isFocused: true) { name in
                vm.validateWebsite(vm.website)
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
}

#Preview {
    NavigationStack {
        ShelterFormView()
    }
}
