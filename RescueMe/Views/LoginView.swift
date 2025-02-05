import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var showPrivacy = false
    @State private var showTerms = false
    @State private var offsetAnimation: Float = 0
    
    var body: some View {
        WelcomScreenView {
            backgroundView
        } foregroundContent: {
            foregroundView
        }
        .sheet(isPresented: $showPrivacy) {
            Text("Privacy")
        }
        .sheet(isPresented: $showTerms) {
            Text("Terms")
        }
        .accessibilityLabel(Text("Bienvenido a Adóptame"))
    }
    
    private var backgroundView: some View {
        GeometryReader { proxy in
            VStack {
                Text("¡Bienvenido a Adóptame!")
                    .font(.title)
                    .foregroundStyle(.white)
                Image(.logoAdoptifurro)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.top, 32)
                    .offset(y: CGFloat(offsetAnimation))
                    .onAppear {
                        withAnimation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true)
                        ) {
                            offsetAnimation = 10
                        }
                    }
            }
            .padding()
            .position(x: proxy.size.width / 2, y: proxy.size.height * 0.22)
        }
    }
    
    private var foregroundView: some View {
        VStack {
            Spacer()
            SignInWithAppleButton(.continue, onRequest: {_ in}, onCompletion:  {_ in})
                .signInWithAppleButtonStyle(.whiteOutline)
                .frame(height: 50)
                .padding()
                .shadow(radius: 2, x: 2, y: 2)
                .accessibilityLabel(Text("Botón para continuar con Apple"))
                .accessibilityHint(Text("Entra a la home de la app"))
            Spacer()
            HStack {
                Button {
                    showPrivacy.toggle()
                } label: {
                    Text("Política de privacidad")
                }
                .accessibilityLabel(Text("Botón para desplegar política de privacidad"))
                Text("-")
                Button {
                    showTerms.toggle()
                } label: {
                    Text("Términos de servicio")
                }
                .accessibilityLabel(Text("Botón para desplegar términos de servicios"))
            }
            .foregroundStyle(.secondary)
            .safeAreaPadding(.bottom, 32)
        }
    }
}

#Preview {
    LoginView()
}
