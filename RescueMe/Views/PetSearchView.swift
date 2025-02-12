import SwiftUI

struct PetSearchView: View {
    let petTypes = ["Dogs", "Cats", "Other"]
    let petGenders = ["Any", "Male", "Female"]
    let petSizes = ["Small", "Medium", "Large"]
    let petAge = ["Baby", "Young", "Adult", "Senior"]
    let columns = Array(repeating: GridItem(), count: 3)
    
    @State private var selectedPetTypes: Set<String> = []
    @State private var selectedGenders: Set<String> = []
    @State private var selectedSizes: Set<String> = []
    @State private var selectedAges: Set<String> = []
    
    @State private var selectedAddress = ""
    @State var coordinates: (lat: Double, lon: Double) = (0, 0)
    @State private var showLocationSearchView = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                locationSection
                filterSection(title: "Pet Types", options: petTypes, selectedOptions: $selectedPetTypes)
                filterSection(title: "Gender", options: petGenders, selectedOptions: $selectedGenders)
                filterSection(title: "Size", options: petSizes, selectedOptions: $selectedSizes)
                filterSection(title: "Age", options: petAge, selectedOptions: $selectedAges)
                
                Button {
                    
                } label: {
                    Text("Search")
                        .bold()
                }
                .buttonPrimaryStyle()
            }
            .padding()
        }
        .navigationTitle("Pet Search")
        .sheet(isPresented: $showLocationSearchView) {
            LocationSearchView(selectedAddress: $selectedAddress)
        }
    }
    
    @ViewBuilder
    var locationSection: some View {
        Text("Location")
            .font(.headline)
            .bold()
        Button {
            showLocationSearchView.toggle()
        } label: {
            HStack {
                Image(systemName: "mappin.and.ellipse")
                Text(selectedAddress.isEmpty ? "Choose your location" : selectedAddress)
                    .foregroundColor(selectedAddress.isEmpty ? .gray : .primary)
                Spacer()
            }
            .padding()
            .frame(height: 50)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
        }
    }
    
    private func filterSection(title: String,
                               options: [String],
                               selectedOptions: Binding<Set<String>>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .bold()
                .padding(.bottom)
            
            LazyVGrid(columns: columns) {
                ForEach(options, id: \.self) { option in
                    Button {
                        if selectedOptions.wrappedValue.contains(option) {
                            selectedOptions.wrappedValue.remove(option)
                        } else {
                            selectedOptions.wrappedValue.insert(option)
                        }
                    } label: {
                        Text(option)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonSelectStyle(selectedOptions.wrappedValue.contains(option))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        PetSearchView()
    }
}
