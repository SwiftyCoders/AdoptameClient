import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @Environment(NavigationManager.self) var navManager
    @Environment(LoginViewModel.self) var loginVM
    @State private var offsetAnimation: Float = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        @Bindable var bNavMan = navManager
        @Bindable var bLoginVM = loginVM
        
        NavigationStack(path: $bNavMan.loginNavigationPath) {
            WelcomScreenView {
                backgroundView
            } foregroundContent: {
                foregroundView
            }
            .onChange(of: loginVM.loggedSuccessfull, { oldValue, newValue in
                if newValue == true || oldValue == true {
                    navManager.navigate(to: .roleSelection)
                }
            })
            .sheet(isPresented: $bLoginVM.showPrivacy) {
                Text("Privacy")
            }
            .sheet(isPresented: $bLoginVM.showTerms) {
                Text("Terms")
            }
            .accessibilityLabel(Text("Bienvenido a Adóptame"))
            .navigationDestination(for: NavigationManager.LoginDestinationViews.self) { destinations in
                switch destinations {
                case .register:
                    WelcomScreenView(heightRatio: 1.5) {
                        backgroundView
                    } foregroundContent: {
                        registerView
                    }
                case .login:
                    WelcomScreenView(heightRatio: 1.5) {
                        backgroundView
                    } foregroundContent: {
                        loginView
                    }
                case .roleSelection:
                    RoleSelectionView()
                case .shelterForm:
                    ShelterFormView()
                }
            }
        }
        .disabled(loginVM.isLoading)
        .blur(radius: loginVM.isLoading ? 2 : 0)
        .overlay {
            if loginVM.isLoading {
                LoadingView()
            }
        }
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
            
            Button(action: {
                navManager.navigate(to: .login)
            }) {
                Text("Continue with Email")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 15)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.primary,
                                    lineWidth: 1)
                            .foregroundStyle(.primaryOrange)
                    )
            }
            .foregroundStyle(.primary)
            .padding()
            .accessibilityLabel(Text("Botón para continuar con Apple"))
            .accessibilityHint(Text("Entra a la home de la app"))
            
            Button {
                navManager.navigate(to: .register)
            } label: {
                Text("Doesn't have an accont? Register now")
                    .font(.footnote)
            }
            .accessibilityLabel(Text("Botón para continuar con Apple"))
            .accessibilityHint(Text("Entra a la home de la app"))

            Spacer()
            HStack {
                Button {
                    loginVM.showPrivacy.toggle()
                } label: {
                    Text("Política de privacidad")
                }
                .accessibilityLabel(Text("Botón para desplegar política de privacidad"))
                Text("-")
                Button {
                    loginVM.showTerms.toggle()
                } label: {
                    Text("Términos de servicio")
                }
                .accessibilityLabel(Text("Botón para desplegar términos de servicios"))
            }
            .foregroundStyle(.secondary)
            .safeAreaPadding(.bottom, 32)
        }
    }
    
    @ViewBuilder
    var registerView: some View {
        @Bindable var bLoginVM = loginVM

        ScrollView {
            VStack {
                CustomTextField(input: $bLoginVM.userEmail, label: "Email", prompt: "Email", systemName: "envelope", isFocused: false) { str in
                    nil
                }
                
                CustomTextField(input: $bLoginVM.userPassword, label: "Password", prompt: "Password", systemName: "envelope", isFocused: false) { str in
                    nil
                }
                
                CustomTextField(input: $bLoginVM.userPassword, label: "Repeat Password", prompt: "Repeat Password", systemName: "envelope", isFocused: false) { str in
                    nil
                }
                
                Button("Continue") {
                    Task {
                        await loginVM.registerNewUser()
                        dismiss()
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .padding(.top, 16)
    }
    @ViewBuilder
    var loginView: some View {
        @Bindable var bLoginVM = loginVM

        ScrollView {
            VStack {
                CustomTextField(input: $bLoginVM.userEmail, label: "Email", prompt: "Email", systemName: "envelope", isFocused: false) { str in
                    nil
                }
                
                CustomTextField(input: $bLoginVM.userPassword, label: "Password", prompt: "Password", systemName: "envelope", isFocused: false) { str in
                    nil
                }
                
                Button("Log in") {
                    Task {
                        await loginVM.loginUser()
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .padding(.top, 16)
    }
}

#Preview {
    LoginView()
        .environment(NavigationManager())
        .environment(LoginViewModel())
}
