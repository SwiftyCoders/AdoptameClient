import SwiftUI
import MapKit

struct MapView: View {
    @State var manager = LocationManager()
    @State var shelters: [Shelter]
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var selectedPlaceMark: Shelter?
    @State private var slicerDistance: Double = 0.00
    @State private var sheltersInCircle: [Shelter] = []
    
    var body: some View {
        Map(position: $cameraPosition, selection: $selectedPlaceMark) {
            UserAnnotation()
            if let user = manager.userLocation?.coordinate {
                MapCircle(center: user, radius: radio())
                    .stroke(Color.primaryOrange, lineWidth: 3)
                    .foregroundStyle(Color.primaryOrange.opacity(0.2))
            }
            
            ForEach(sheltersInCircle) { shelter in
                Marker(shelter.name, coordinate: shelter.coordinate)
                    .tag(shelter)
            }
        }
        .mapControls {
            MapUserLocationButton()
            MapScaleView()
        }
        .safeAreaInset(edge: .bottom) {
            VStack {
                Group {
                    if slicerDistance > 0.4 {
                        Text("\(slicerDistance.description) km")
                    } else {
                        Text("No distance Filter")
                    }
                }
                .foregroundStyle(.gray)
                Slider(value: $slicerDistance, in: 0...15, step: 0.5)
                    .padding(10)
                    .background(Capsule().fill(Color.white))
                    .tint(.primaryOrange)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
            }
        }
        .onAppear {
            manager.startLocationServices()
            if let user = manager.userLocation?.coordinate {
                cameraPosition = .region(MKCoordinateRegion(center: user, span: MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)))
            }
        }
        .onChange(of: slicerDistance, { _, _ in
            sheltersInCircle = getSheltersInCircle()
        })
        .onChange(of: manager.userLocation) { _, _ in
            sheltersInCircle = getSheltersInCircle()
        }
        .sheet(item: $selectedPlaceMark) { shelter in
            Text(shelter.name)
        }
    }
    
    private func radio() -> CLLocationDistance {
        slicerDistance * 1000
    }
    private func getSheltersInCircle() -> [Shelter] {
        guard let userLocation = manager.userLocation?.coordinate else {
            return []
        }
        if slicerDistance <= 0.0 {
            return shelters
        }
        return shelters.filter { shelter in
            let shelterLocation = CLLocation(
                latitude: shelter.coordinate.latitude,
                longitude: shelter.coordinate.longitude
            )
            let userCLLocation = CLLocation(
                latitude: userLocation.latitude,
                longitude: userLocation.longitude
            )
            let distance = shelterLocation.distance(from: userCLLocation)
            return distance <= radio()
        }
    }
}

#Preview {
    MapView(shelters: Shelter.previewShelters)
}
