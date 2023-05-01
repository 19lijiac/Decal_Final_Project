//
//  Coordinator.swift
//  Final Project
//
//  Created by Andy Li on 4/19/23.
//

import Foundation
import MapKit
import SwiftUI

final class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView
    private var initialRegionSet = false
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if overlay is MKPolyline {
                let renderer = MKPolylineRenderer(overlay: overlay)
                renderer.strokeColor = UIColor.blue // Set the stroke color
                renderer.lineWidth = 3 // Set the line width
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if !initialRegionSet {
            setInitialRegion(for: mapView)
            initialRegionSet = true
        } else if control.viewModel.centerOnUser {
            let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: false)
        }
    }
    @objc func didDragMap(_ gestureRecognizer: UIGestureRecognizer) {
                if gestureRecognizer.state == .began {
                    control.viewModel.centerOnUser = false
                }
            }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    func setInitialRegion(for mapView: MKMapView) {
            if let userLocation = mapView.userLocation.location {
                let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                mapView.setRegion(region, animated: false)
            }
        }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let customAnnotation = annotation as? CustomAnnotation else {
            return nil
        }

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: customAnnotation.identifier)
        if annotationView == nil {
                annotationView = MKAnnotationView(annotation: customAnnotation, reuseIdentifier: customAnnotation.identifier)
            } else {
                annotationView?.annotation = customAnnotation
            }
            
            let customAnnotationView = CustomAnnotationView(annotation: customAnnotation)
            annotationView?.addSubview(UIHostingController(rootView: customAnnotationView).view)
            
            return annotationView
    }
}
