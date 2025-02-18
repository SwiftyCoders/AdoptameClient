import SwiftUI

struct LocationSearchView: View {
    @State var locationVM = LocationSearchManager()
    @Binding var selectedAddress: String
    @Binding var latitude: Double
    @Binding var longitude: Double
    @Environment(\.dismiss) var dismiss
    @FocusState var focus: ShelterField?
    
    var body: some View {
        NavigationStack {
            VStack {
                if !locationVM.results.isEmpty {
                    List(locationVM.results) { result in
                        VStack(alignment: .leading) {
                            Text(result.title)
                            Text(result.subtitle)
                        }
                        .onTapGesture {
                            selectedAddress = "\(result.title) \(result.subtitle)"
                            latitude = result.latitude
                            longitude = result.longitude
                            locationVM.coordinates = (lat: result.latitude, lon: result.longitude)
                            dismiss()
                        }
                    }
                } else {
                    ContentUnavailableView(
                        "Sin resultados",
                        systemImage: "magnifyingglass",
                        description: Text("Intenta buscar otra dirección o verifica la conexión.")
                    )
                    .padding()
                }
            }
            .onAppear {
                focus = .address
            }
            .searchable(text: $locationVM.query)
            .focused($focus, equals: .address)
        }
    }
}

#Preview {
    LocationSearchView(selectedAddress: .constant("Barcelona"), latitude: .constant(2.2), longitude: .constant(2.2))
}
