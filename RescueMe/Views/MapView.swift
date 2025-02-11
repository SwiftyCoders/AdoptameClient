import SwiftUI
import MapKit

struct MapView: View {
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var selectedItem: IdentifiableMapItem?
    @State var shelters: [Shelter]
    
    @State private var selectedPlaceMark: Shelter?
    
    let manager = CLLocationManager()
    
    var body: some View {
        Map(position: $cameraPosition, selection: $selectedPlaceMark) {
            UserAnnotation()
//            ForEach(shelters) { shelter in
////                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: shelter.coordinate))
//                //                mapItem.name = shelter.name
//                let placemark = MKPlacemark(coordinate: shelter.coordinate)
//                Marker(shelter.name, coordinate: shelter.coordinate)
//                    .tag(shelter)
//                
//            }
        }
        .mapControls { MapUserLocationButton()}
        .onMapCameraChange(frequency: .onEnd) { context in
            visibleRegion = context.region
        }
        .onAppear {
            manager.requestWhenInUseAuthorization()
            //si usuario no pasa ubicación:
            //            19.300238, -69.173339
        }
        .sheet(item: $selectedPlaceMark) { shelter in
            Text(shelter.name)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    MapView(shelters: Shelter.previewShelters)
}

struct IdentifiableMapItem: Identifiable, Hashable {
    let id = UUID()
    let mapItem: MKMapItem
}
