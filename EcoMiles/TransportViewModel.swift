import Foundation
import Combine
import CoreLocation

class TransportViewModel: ObservableObject {
    
    @Published var selectedMode: String = "Car"
    @Published var distanceKm: Double = 0.0
    @Published var carbonScore: Double = 0.0

    private var locationManager = LocationManager()
    private var cancellables = Set<AnyCancellable>()

    init() {
        locationManager.$distance
            .sink { [weak self] meters in
                self?.distanceKm = meters / 1000.0
            }
            .store(in: &cancellables)
    }

    func startTracking() {
        locationManager.startTracking()
    }

    func stopTracking() {
        locationManager.stopTracking()
    }

    func emissionFactor(for mode: String) -> Double {
        switch mode {
        case "Car": return 0.121     // kg CO2 per km
        case "Bus": return 0.089
        case "Train": return 0.041
        case "Plane": return 0.255
        case "Walking", "Bicycle": return 0.0
        default: return 0.121
        }
    }
}
