import SwiftUI

struct LocationSearchView: View {
    @State var locationVM = LocaltionSearchManager()
    @Binding var selectedAddress: String
    @Environment(\.dismiss) var dismiss
    @FocusState var focus: ShelterField?
    
    var body: some View {
        NavigationStack {
            List(locationVM.results) { result in
                VStack(alignment: .leading) {
                    Text(result.title)
                    Text(result.subtitle)
                }
                .onTapGesture {
                    selectedAddress = result.title
                    dismiss()
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
    LocationSearchView(selectedAddress: .constant("Barcelona"))
}
