//
//  Coordinator.swift
//  Final Project
//
//  Created by Andy Li on 4/19/23.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView
    
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
    
}
