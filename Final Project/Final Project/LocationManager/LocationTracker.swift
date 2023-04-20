//
//  LocationTracker.swift
//  Final Project
//
//  Created by Andy Li on 4/19/23.
//

import Foundation
import CoreLocation




final class LocationTracker: NSObject, ObservableObject {
    @Published var location: CLLocation?
    
    
    private let locationManager = CLLocationManager()
    
    override init() {
            super.init()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.delegate = self
        }
    
}

extension LocationTracker: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            DispatchQueue.main.async {
                self.location = location
            }
    }
}



