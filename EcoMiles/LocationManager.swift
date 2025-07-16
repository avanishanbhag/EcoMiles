//
//  LocationManager.swift
//  EcoMiles
//
//  Created by Scholar on 7/16/25.
//

import Foundation
import Combine

class TransportViewModel: ObservableObject {
    // Published values that update the UI
    @Published var distanceKm: Double = 0.0
    @Published var carbonScore: Double = 0.0
   
    private var cancellables = Set<AnyCancellable>()
    private var locationManager = LocationManager()
   
    // Emission factor for car (0.121 kg CO₂/km)
    private let emissionFactor = 0.121
   
    init() {
        // Listen for location updates
        locationManager.$distance
            .sink { [weak self] meters in
                guard let self = self else { return }
                let km = meters / 1000.0
                self.distanceKm = km
                self.carbonScore = km * self.emissionFactor
            }
            .store(in: &cancellables)
    }
   
    func startTracking() {
        locationManager.startTracking()
    }
   
    func stopTracking() {
        locationManager.stopTracking()
    }
}
