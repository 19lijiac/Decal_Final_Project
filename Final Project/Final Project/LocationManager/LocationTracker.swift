//
//  LocationTracker.swift
//  Final Project
//
//  Created by Andy Li on 4/19/23.
//

import Foundation
import CoreLocation
import MapKit


//viewModel

final class LocationTracker: NSObject, ObservableObject {
    @Published var location: CLLocation?
    @Published var polyline: MKPolyline?
    @Published var isDarkMode: Bool = false
    @Published var centerOnUser: Bool = true
    @Published var showingPolyline: Bool = true
    @Published var cityName: String = ""
    @Published var stateName: String = ""
    @Published var countryName: String = ""
    public var routeCoordinates : [CLLocationCoordinate2D] = []
    public var coordinatesCount : Int = 0
    
    //handles REVERSE_GEOCODING request frequency
    let delayTime = 5.0
    var lastRequestTime: Date?
    
    
     
    
    private let locationManager = CLLocationManager()
    
    override init() {
            super.init()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.delegate = self
        }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
        
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationTracker: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            DispatchQueue.main.async {
                
                if let lastLocation = self.routeCoordinates.last, lastLocation.latitude != location.coordinate.latitude && lastLocation.longitude != location.coordinate.longitude   {
                    let geoCoder = CLGeocoder()
                    
                    geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
                        if let lastRequestTime = self.lastRequestTime,
                           Date().timeIntervalSince(lastRequestTime) < self.delayTime {
                               return
                        }
                        
                        
                        
                        
                        if let placemark = placemarks?.first {
                            self.cityName = placemark.locality ?? "N/A"
                            self.stateName = placemark.administrativeArea ?? "N/A"
                            self.countryName = placemark.country ?? "N/A"
                        } else {
                            self.cityName = "N/A"
                            self.stateName = "N/A"
                            self.countryName = "N/A"
                        }
                        
                        self.lastRequestTime = Date()
                    }
                    
                    
                            // Append `location` to `routeCoordinates` only when it is not equal to the last element
                    self.routeCoordinates.append(location.coordinate)
                } else if self.routeCoordinates.isEmpty {
                    // If `routeCoordinates` is empty, append `location` as the first element
                    self.routeCoordinates.append(location.coordinate)
                }
                //self.routeCoordinates.append(location)
                self.location = location
                self.coordinatesCount = self.routeCoordinates.count
                self.polyline = MKPolyline(coordinates: self.routeCoordinates, count: self.coordinatesCount)
                
                if FirebaseManager.shared.currentUser != nil {
                    FirebaseManager.shared.updateUserStatus(locationTracker: self)
                }
            }
        /*
        if centerOnUser {
            centerOnUser = false
        }
         */
    }
}



