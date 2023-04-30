//
//  MapView.swift
//  Final Project
//
//  Created by Andy Li on 4/19/23.
//

import Foundation
import SwiftUI
import MapKit
import Firebase
import FirebaseDatabase

struct MapView: UIViewRepresentable {
    //@Binding var polylinePoints: [CLLocationCoordinate2D]
    //@Binding var centerOnUser: Bool
    //@Binding var isDarkMode: Bool
    @ObservedObject var viewModel: LocationTracker
    
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        
        //test
        //map.mapType = .standard // Set map type to standard
        
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
        uiView.overrideUserInterfaceStyle = viewModel.isDarkMode ? .dark : .light
        
        
        if viewModel.centerOnUser, let userLocation = viewModel.location {
                    let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                    uiView.setRegion(region, animated: false)
            DispatchQueue.main.async {
                viewModel.centerOnUser = false
                    }
        }
        
        if let polyline = viewModel.polyline {
            uiView.removeOverlays(uiView.overlays)
            uiView.addOverlay(polyline)
        }
        
        for pin in FirebaseManager.shared.noteLocationDictionary {
            uiView.addAnnotation(pin)
        }
        
        //placeholder
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 999, longitude: 999)
        
        for friend in FirebaseManager.shared.friendList {
            let friendAnnotation = FirebaseManager.shared.friendAnnotation[friend] ?? annotation
            
            if !FirebaseManager.shared.checkFriendAnnot.contains(friend) {
                uiView.addAnnotation(friendAnnotation)
                FirebaseManager.shared.checkFriendAnnot.insert(friend)
            } else {
                if let oldAnnotation = uiView.annotations.first(where: { $0.title == friend }) {
                    uiView.removeAnnotation(oldAnnotation)
                }

                let newAnnotation = MKPointAnnotation()
                newAnnotation.coordinate = CLLocationCoordinate2D(latitude: friendAnnotation.coordinate.latitude, longitude: friendAnnotation.coordinate.longitude)
                newAnnotation.title = friend
                FirebaseManager.shared.friendAnnotation[friend] = newAnnotation
                uiView.addAnnotation(newAnnotation)
            }
        }
    }
}

