import SwiftUI

struct ShelterContactView: View {
    var size: Double = 30
    var shelter: Shelter
    
    var body: some View {
        HStack(spacing: 36) {
            contactButton( systemImageName: "phone.circle.fill", buttonLabel: "Phone", backgroundColor: .primaryOrange, isDisabled: disabledPhoneButton) {
                makeCall(phoneNumber: shelter.phone)
            }
            .accessibilityLabel("Call shelter")
            .accessibilityHint(disabledPhoneButton ? "Phone number not available" : "Double tap to call \(shelter.phone)")
            
            contactButton(systemImageName: "envelope.fill", buttonLabel: "Email", backgroundColor: .primaryOrange, isDisabled: disabledEmailButton) {
                sendEmail(email: shelter.email)
            }
            .accessibilityLabel("Email shelter")
            .accessibilityHint(disabledEmailButton ? "Email not available" : "Double tap to send email to \(shelter.email ?? "")")
            
            contactButton(systemImageName: "globe", buttonLabel: "Website", backgroundColor: .primaryOrange, isDisabled: disabledWebSiteButton) {
                openWebSite(webSite: shelter.email)
            }
            .accessibilityLabel("Website shelter")
            .accessibilityHint(disabledWebSiteButton ? "Website not available" : "Double tap to open website")
            
            contactButton(systemImageName: "map.fill", buttonLabel: "Navigate", backgroundColor: .primaryOrange, isDisabled: disabledNavigateButton) {
                openMaps(latitude: shelter.latitude, longitude: shelter.longitude)
            }
            .accessibilityLabel("Navigate to shelter")
            .accessibilityHint(disabledNavigateButton ? "Location not available" : "Double tap to open maps and navigate to shelter")
            
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Shelter contact options")
    }
    
    func contactButton(systemImageName: String, buttonLabel: String, backgroundColor: Color, isDisabled: Bool, onTapAction: @escaping () -> Void) -> some View {
        Button(action: onTapAction) {
            VStack {
                Image(systemName: systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .padding(12)
                    .background(isDisabled ? Color.gray : backgroundColor)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    .accessibilityHidden(true)
                Text(buttonLabel)
                    .font(.footnote)
                    .foregroundColor(.primary)
                    .font(.caption)
                    .accessibilityHidden(true)
            }
        }
        .disabled(isDisabled)
    }

    var disabledPhoneButton: Bool {
        if shelter.phone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return true }
        return false
    }
    
    var disabledEmailButton: Bool {
        guard let email = shelter.email else { return true }
        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return true }
        return false
    }
    
    var disabledWebSiteButton: Bool {
        guard let website = shelter.email else { return true }
        if website.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return true }
        return false
    }
    
    var disabledNavigateButton: Bool {
        return shelter.latitude == 0 || shelter.longitude == 0
    }
    
    func makeCall(phoneNumber: String?) {
        guard let availablePhoneNumber = phoneNumber else { return }
        guard let url = URL(string: "tel://\(availablePhoneNumber.replacingOccurrences(of: " ", with: ""))") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func sendEmail(email: String?) {
        guard let email = email?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: "mailto:\(email)") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func openWebSite(webSite: String?) {
        guard let availableWebSite = webSite else { return }
        guard let url = URL(string: "http://\(availableWebSite)") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func openMaps(latitude: Double, longitude: Double) {
        guard let url = URL(string: "maps://\(latitude),\(longitude)") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}

#Preview {
    VStack {
        ShelterContactView(shelter: .previewShelter)
    }
}
