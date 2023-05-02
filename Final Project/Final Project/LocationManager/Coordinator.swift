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
            let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
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
                let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
                mapView.setRegion(region, animated: false)
            }
        }
    
    
    /*
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
     */
    
    /*
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        guard let customAnnotation = annotation as? CustomAnnotation else {
            print("error: no customannotation")
                    return nil
                }
                
        let identifier = customAnnotation.identifier
         
        var annotationView: CustomAnnotationView?
        print("run coordinator")
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? CustomAnnotationView {
            print("use previous queued view")
            annotationView = dequeuedView
        } else {
            print("create new customannotationview")
            annotationView = CustomAnnotationView(annotation: customAnnotation, reuseIdentifier: identifier)
        }
        
        return annotationView
    }
     */
    /*
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            // Make a fast exit if the annotation is the `MKUserLocation`, as it's not an annotation view we wish to customize.
            return nil
        }
        
        var annotationView: MKAnnotationView?
        
        if let annotation = annotation as? CustomAnnotation {
            annotationView = setupCustomAnnotationView(for: annotation, on: mapView)
        }
        
        return annotationView
    }
     */
    
    
    /*
    private func setupCustomAnnotationView(for annotation: CustomAnnotation, on mapView: MKMapView) -> MKAnnotationView {
        let reuseIdentifier = NSStringFromClass(CustomAnnotation.self)
        let customAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier, for: annotation)
        
        customAnnotationView.canShowCallout = true
        
        // Provide the annotation view's image.
        let image = annotation.image
        customAnnotationView.image = image
        
        return customAnnotationView
    }
     */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            // Make a fast exit if the annotation is the `MKUserLocation`, as it's not an annotation view we wish to customize.
            return nil
        }
        
        var annotationView: MKAnnotationView?
        
        if let annotation = annotation as? CustomAnnotation {
            annotationView = setupCustomAnnotationView(in: mapView, for: annotation)
        }
        
        return annotationView
    }
    
    
    
    private func setupCustomAnnotationView(in mapView: MKMapView, for annotation: MKAnnotation) -> CustomAnnotationView {
        let identifier = NSStringFromClass(CustomAnnotation.self)

        if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? CustomAnnotationView {
            annotationView.annotation = annotation
            return annotationView
        } else {
            let customAnnotationView = CustomAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            customAnnotationView.canShowCallout = false
            return customAnnotationView
        }
    }
}
