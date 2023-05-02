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
    //@Binding var showingPolyline: Bool
    
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        
        /*
        map.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
         */
        
        map.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(CustomAnnotation.self))

        
                
        
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
        
        if viewModel.showingPolyline {
            if let polyline = viewModel.polyline {
                uiView.removeOverlays(uiView.overlays)
                uiView.addOverlay(polyline)
            }
        } else {
            uiView.removeOverlays(uiView.overlays)
        }
        
        
        for pin in FirebaseManager.shared.noteLocationDictionary {
            uiView.addAnnotation(pin)
        }
         
        
        //placeholder
        
        /*
        for friend in FirebaseManager.shared.friendList {
            //print("update")
            let annotCoordinate = CLLocationCoordinate2D(latitude: 999, longitude: 999)
            let identifier = "\(friend)"
            let friendAnnotation = FirebaseManager.shared.friendAnnotation[friend] ?? CustomAnnotation(coordinate: annotCoordinate, identifier: identifier)
            friendAnnotation.coordinate = CLLocationCoordinate2D(latitude: friendAnnotation.coordinate.latitude, longitude: friendAnnotation.coordinate.longitude)
            
            if !FirebaseManager.shared.checkFriendAnnot.contains(friend) {
                uiView.addAnnotation(friendAnnotation)
                FirebaseManager.shared.checkFriendAnnot.insert(friend)
            } else {
                if let oldAnnotation = uiView.annotations.first(where: { $0.title == friend }) {
                    //print("delete oldaNNOTATION")
                    uiView.removeAnnotation(oldAnnotation)
                }
                FirebaseManager.shared.friendAnnotation[friend] = friendAnnotation
                uiView.addAnnotation(friendAnnotation)
            }
        }
         */
        for friend in FirebaseManager.shared.friendList {
            let annotCoordinate = CLLocationCoordinate2D(latitude: 999, longitude: 999)
            let identifier = "\(friend)"
            let friendAnnotation = FirebaseManager.shared.friendAnnotation[friend] ?? CustomAnnotation(coordinate: annotCoordinate, identifier: identifier)
            //friendAnnotation.coordinate = CLLocationCoordinate2D(latitude: friendAnnotation.coordinate.latitude, longitude: friendAnnotation.coordinate.longitude)
            
            if !FirebaseManager.shared.checkFriendAnnot.contains(friend) {
                print("add annotation")
                print("this is :\(friendAnnotation.coordinate.latitude)")
                //let annotationView = uiView.view(for: friendAnnotation)
                uiView.addAnnotation(friendAnnotation)
                FirebaseManager.shared.checkFriendAnnot.insert(friend)
            }
            
            /*
            else {
                print("hit")
                print("latitude: \(friendAnnotation.coordinate.latitude)")
                //friendAnnotation.setCoordinate(friendAnnotation.coordinate)
                if let annotationView = uiView.view(for: friendAnnotation) as? CustomAnnotationView {
                    print("update")
                    annotationView.setNeedsDisplay()
                }
                //FirebaseManager.shared.friendAnnotation[friend] = friendAnnotation
            }
             */
        }
        
       
    }
        
    
}

