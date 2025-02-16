import SwiftUI

@Observable
final class ShelterFormViewModel {
    private let addNewShelter = AddNewShelterUseCase()
    var name: String = ""
    var address: String = ""
    var description: String = ""
    var email: String = ""
    var website: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var adoptionPolicy = ""
    var phone = ""
    var image: Data?
    var showLocationSearchView = false
    
    
    func registerNewShelter() {
        //guard validateForm() else { return }
        
        let newShelter = PostShelterDTO(name: name, description: description, adoptionPolicy: adoptionPolicy, phone: phone, contactEmail: email, website: website, address: address, latitude: latitude, longitude: longitude, image: image)
        
        Task {
            do {
                try await addNewShelter.exectue(shelter: newShelter)
            } catch {
                print(error)
            }
        }
    }
    
    func validateName(_ name: String) -> LocalizedStringResource? {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return "Name is required."
        }
        if name.count < 3 {
            return "Name must be at least 3 characters long."
        }
        return nil
    }
    
    func validateAddress(_ address: String) -> LocalizedStringResource? {
        if address.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return "Address is required."
        }
        return nil
    }
    
    func validatePhone(_ phone: String) -> LocalizedStringResource? {
        let phoneRegex = "^[0-9+\\s-]{7,15}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if phone.isEmpty {
            return "Phone number is required."
        }
        if !predicate.evaluate(with: phone) {
            return "Invalid phone number format."
        }
        return nil
    }
    
    func validateDescription(_ description: String) -> LocalizedStringResource? {
        if description.count > 500 {
            return "Description should not exceed 500 characters."
        }
        return nil
    }
    
    func validateAdoptionPolicy(_ policy: String) -> LocalizedStringResource? {
        if policy.count > 1000 {
            return "Adoption policy should not exceed 1000 characters."
        }
        return nil
    }
    
    func validateEmail(_ email: String) -> LocalizedStringResource? {
        let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        if email.isEmpty {
            return "Email is required."
        }
        if !predicate.evaluate(with: email) {
            return "Invalid email format."
        }
        return nil
    }
    
    func validateWebsite(_ website: String) -> LocalizedStringResource? {
        if website.isEmpty {
            return nil
        }
        let websiteRegex = #"^(https?:\/\/)?([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,}(/.*)?$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", websiteRegex)
        if !predicate.evaluate(with: website) {
            return "Invalid website URL."
        }
        return nil
    }
    
    func validateForm() -> Bool {
        if validateName(name) != nil, validateAddress(address) != nil, validatePhone(phone) != nil {
            return true
        }
        return false
    }
}
