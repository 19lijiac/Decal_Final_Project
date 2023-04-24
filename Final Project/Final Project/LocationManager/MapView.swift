//
//  MapView.swift
//  Final Project
//
//  Created by Andy Li on 4/19/23.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var polylinePoints: [CLLocationCoordinate2D]
    @Binding var centerOnUser: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        let gestureRecognizer = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.didDragMap(_:)))
                gestureRecognizer.delegate = context.coordinator as? UIGestureRecognizerDelegate
                map.addGestureRecognizer(gestureRecognizer)
                
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: UIViewType, context:
                      UIViewRepresentableContext<MapView>){
        if centerOnUser, let userLocation = uiView.userLocation.location {
                    let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                    uiView.setRegion(region, animated: true)
            DispatchQueue.main.async {
                        centerOnUser = false
                    }
                }
        let polyline = MKPolyline(coordinates: polylinePoints, count: polylinePoints.count)
               uiView.addOverlay(polyline)
    }
    
}
