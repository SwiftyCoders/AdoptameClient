import SwiftUI

struct AllSetView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(.logoAdoptifurro)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding()
                
            Text("You're All Set!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 16)
            
            Text("You account was succesfully created")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.top, 8)
            
            Spacer()
            Divider()
                .padding(.bottom)
            Button {
            } label: {
                Text("Go to Homepage")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.primaryOrange)
                    .cornerRadius(30)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    AllSetView()
}
