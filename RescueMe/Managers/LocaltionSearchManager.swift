import SwiftUI
import MapKit

@Observable
final class LocaltionSearchManager: NSObject {
    var query: String = "" {
        didSet {
            handleSearchFragment(query)
        }
    }
    
    var results: [LocationResult] = []
    var status: SearchStatus = .idle
    
    var completer: MKLocalSearchCompleter
    
    init(filter: MKPointOfInterestFilter = .excludingAll,
         region: MKCoordinateRegion = MKCoordinateRegion(.world),
         types: MKLocalSearchCompleter.ResultType = [.pointOfInterest, .query, .address]) {
        
        completer = MKLocalSearchCompleter()
        
        super.init()
        
        completer.delegate = self
        completer.pointOfInterestFilter = filter
        completer.region = region
        completer.resultTypes = types
    }
    
    private func handleSearchFragment(_ fragment: String) {
        self.status = .searching
        
        if !fragment.isEmpty {
            self.completer.queryFragment = fragment
        } else {
            self.status = .idle
            self.results = []
        }
    }
}

extension LocaltionSearchManager: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results.map { LocationResult(title: $0.title, subtitle: $0.subtitle)}
                
        self.status = .result
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: any Error) {
        self.status = .error(error.localizedDescription)
    }
}

struct LocationResult: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var subtitle: String
}

enum SearchStatus: Equatable {
    case idle
    case searching
    case error(String)
    case result
}
