import SwiftUI

struct ShelterDetailView: View {
    let shelter: Shelter
    @Namespace private var detailTransition
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    headerView
                    VStack {
                        ShelterInformationView(shelter: .previewShelter)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: 1)
                            .padding(.horizontal)
                            .foregroundStyle(.primary)
                            .bold()
                        ShelterContactView(shelter: .previewShelter)
                        ShelterSegmentedView()
                    }
                    .offset(y: -30)
                }
            }
            .coordinateSpace(name: "scroll")
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(Angle(degrees: 90))
                    }
                    .foregroundStyle(.primary)
                }
            }
            .navigationDestination(for: String.self) { string in
                Text(string)
            }
        }
    }
    
    var headerView: some View {
        GeometryReader { geometry in
            let minY = geometry.frame(in: .named("scroll")).minY
            let height = max(250, 250 + minY)
            
            Image(.shelterDemo)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: height)
                .clipped()
                .offset(y: minY > 0 ? -minY : 0)
        }
        .frame(height: 250)
    }
}

#Preview {
    NavigationStack {
        ShelterDetailView(shelter: .previewShelter)
    }
}
