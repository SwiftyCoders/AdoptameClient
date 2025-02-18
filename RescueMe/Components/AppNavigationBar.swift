import SwiftUI

struct AppNavigationBar: View {
    let logoApp: ImageResource
    let imageUser: Image
    let tapToNavigation: () -> Void
    
    var body: some View {
        HStack {
            Image(.logoAdoptifurro)
                .resizable()
                .scaledToFit()
                .frame(width: 32)
            
            Text("Rescatame App")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity)
        
            
            Button(action: tapToNavigation) {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32)
            }
            .foregroundStyle(.primary)
        }
    }
}

#Preview {
    AppNavigationBar(logoApp: .logoAdoptifurro, imageUser: Image(systemName: "person.circle"), tapToNavigation: {})
}
