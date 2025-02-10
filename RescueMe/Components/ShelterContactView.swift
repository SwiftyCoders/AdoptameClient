import SwiftUI

struct ShelterContactView: View {
    
    var size: Double = 50
    
    var body: some View {
        HStack(spacing: 24){
            contactButton( iconName: "phone.circle.fill", text: "Phone") {
                makeCall("123-456-7890")
            }
//            .disabled(shelter.phone == nil)
//            .foregroundStyle(shelter.phone == nil ? .gray : .green)
            
        }
        .padding()
        
        
    }
    
    func contactButton(iconName: String, text: String, action: @escaping () -> Void) -> some View {
        return Button {
            action()
        } label: {
            VStack{
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size)
               
                
                Text(text)
                    .foregroundStyle(.primary)
            }
        }
        .foregroundStyle(.primary)
    }
    func makeCall(_ phoneNumber: String?) {
        guard let number = phoneNumber else { return }
        guard let url = URL(string: "tel://\(number.replacingOccurrences(of: " ", with: ""))") else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    ShelterContactView()
}
