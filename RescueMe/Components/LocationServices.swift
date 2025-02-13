import SwiftUI

struct LocationServices: View {
    var body: some View {
        
        ContentUnavailableView(label: {
            Image(.logoAdoptifurro)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 200)
                .padding(.bottom, 30)
            Text("Location Services")
                .font(.largeTitle)
                .bold()
                .padding(.bottom)
        }, description: {
            Text("""
1. Tab the button below and go to "Privacy and Security.
2. Tab on "Location Services".
3. Locate the "RescueMe" app and tab on it.
4. Change the setting to "While Using the App".
""")
            .multilineTextAlignment(.leading)
        }, actions: {
            openSettingButton
        })
    }
    
    @ViewBuilder private var openSettingButton: some View {
        if let link = URL(string: UIApplication.openSettingsURLString) {
            Button("Open Setting") {
//                UIApplication.shared.open(link)
                UIApplication.shared.open(link, options: [:], completionHandler: nil)
            }
            .buttonPrimaryStyle()
        }
    }
}

#Preview {
    LocationServices()
}
