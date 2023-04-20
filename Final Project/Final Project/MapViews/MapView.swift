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
    
    func makeUIView(context: Context) -> MKMapView {
        
        
        
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: UIViewType, context:
                      UIViewRepresentableContext<MapView>){
        let polyline = MKPolyline(coordinates: polylinePoints, count: polylinePoints.count)
               uiView.addOverlay(polyline)
    }
    
}

