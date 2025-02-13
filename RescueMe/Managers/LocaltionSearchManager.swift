import SwiftUI
import MapKit

@Observable
final class LocationSearchManager: NSObject {
    var query: String = "" {
        didSet {
            Task {
                await debounceSearch(query)
            }
        }
    }
    
    var results: [LocationResult] = []
    var status: SearchStatus = .idle
    var coordinates: (lat: Double, lon: Double)?
    
    private var completer = MKLocalSearchCompleter()
    private var task: Task<Void, Never>?
    
    init(
        filter: MKPointOfInterestFilter = .includingAll,
        region: MKCoordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.4168, longitude: -3.7038),
            span: MKCoordinateSpan(latitudeDelta: 6.0, longitudeDelta: 6.0)
        ),
        types: MKLocalSearchCompleter.ResultType = [.pointOfInterest, .query, .address]
    ) {
        super.init()
        
        completer.delegate = self
        completer.pointOfInterestFilter = filter
        completer.region = region
        completer.resultTypes = types
    }
    
    private func debounceSearch(_ fragment: String) async {
        status = .searching
        
        task?.cancel()
        guard !fragment.isEmpty else {
            status = .idle
            results = []
            return
        }

        task = Task {
            try? await Task.sleep(nanoseconds: 500_000_000)
            if Task.isCancelled {
                return
            }
            
            await searchLocations(fragment)
        }
    }
    
    private func searchLocations(_ fragment: String) async {
        await MainActor.run { completer.queryFragment = fragment }
    }
    
    private func fetchCoordinates(for result: MKLocalSearchCompletion) async -> LocationResult? {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = result.title
        
        let search = MKLocalSearch(request: request)
        
        do {
            let response = try await search.start()
            if let coordinate = response.mapItems.first?.placemark.coordinate {
                return LocationResult(
                    title: result.title,
                    subtitle: result.subtitle,
                    latitude: coordinate.latitude,
                    longitude: coordinate.longitude
                )
            }
        } catch {
            print("Error en la búsqueda: \(error.localizedDescription)")
        }
        return nil
    }
}

extension LocationSearchManager: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        Task {
            results = await withTaskGroup(of: LocationResult?.self) { group in
                for result in completer.results {
                    group.addTask {
                        return await self.fetchCoordinates(for: result)
                    }
                }
                
                var newResults: [LocationResult] = []
                for await locationResult in group {
                    if let result = locationResult {
                        newResults.append(result)
                    }
                }
                return newResults
            }
            
            await MainActor.run {
                self.status = .result
            }
        }
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        Task { @MainActor in
            self.status = .error(error.localizedDescription)
        }
    }
}

struct LocationResult: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var subtitle: String
    var latitude: Double
    var longitude: Double
}

enum SearchStatus: Equatable {
    case idle
    case searching
    case error(String)
    case result
}
