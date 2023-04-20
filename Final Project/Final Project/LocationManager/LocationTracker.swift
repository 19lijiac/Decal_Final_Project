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
    public var routeCoordinates : [CLLocationCoordinate2D] = []
    public var coordinatesCount : Int = 0
    
     
    
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
                
                if let lastLocation = self.routeCoordinates.last, lastLocation.latitude != location.coordinate.latitude && lastLocation.longitude != location.coordinate.longitude   {
                            // Append `location` to `routeCoordinates` only when it is not equal to the last element
                    self.routeCoordinates.append(location.coordinate)
                        } else if self.routeCoordinates.isEmpty {
                            // If `routeCoordinates` is empty, append `location` as the first element
                            self.routeCoordinates.append(location.coordinate)
                        }
                //self.routeCoordinates.append(location)
                self.location = location
                self.coordinatesCount = self.routeCoordinates.count
            }
    }
}



