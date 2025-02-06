import SwiftUI

struct PetCardView: View {
    
    var petModel: Pet 
    
    var body: some View {
        
        VStack (alignment: .leading){
            ZStack {
                Color.gray.opacity(0.2)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .frame(width: 300, height: 300)
                
                
                ZStack(alignment: .topTrailing) {
                    Image(.dogImageMock)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
                    HeartButton {}
                        .padding()
                }
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Pet name")
                    .font(.title)
                    .bold()
                
                HStack(spacing: 8) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.orange)
                    Text("1.8 km ")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 2, height: 2)
                    Text("Shelter")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    PetCardView(petModel: <#Pet#>)
}
