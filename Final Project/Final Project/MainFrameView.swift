//
//  MainFrameView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI
import MapKit


struct MainFrameView: View {
    @ObservedObject var locationTracker = LocationTracker()
    
    @State private var polylinePoints: [CLLocationCoordinate2D] = []
    
        
        
    
    
    //default location set to Golden Gate Bridge
    
    
    
    
    
    var body: some View {
        
        ZStack {
            //comment out so Xcode doesn't crash
            /*
            if let region = region {
                Map(coordinateRegion: region, interactionModes: .all, showsUserLocation: true)
                    .ignoresSafeArea()
                
            }
             */
            
            
            MapView(polylinePoints: $locationTracker.routeCoordinates).ignoresSafeArea()
            
            
            /* testing
            if locationTracker.coordinatesCount > 1 {
                Text("\(locationTracker.routeCoordinates[locationTracker.coordinatesCount - 1])").foregroundColor(.black)
            }
            */
            
            
            
            
            
             
                
            Button(action: {print("find friend pressed")}) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width:30, height:30)
                    .frame(width: 187, height: 63)
                    .foregroundColor(.black).background(.white).clipShape(Rectangle()).cornerRadius(30)
            }.padding(.top, 600)
            
                
                
            VStack(alignment: .trailing){
                Button(action: {print("setting pressed")}) {
                    Image(systemName: "gearshape.fill").frame(width:30, height:30)
                        .foregroundColor(.black).background(.white).clipShape(Circle())
                }
                
                Button(action: {print("add friend pressed")}) {
                    Image(systemName: "person.fill.badge.plus").frame(width:30, height:30)
                        .foregroundColor(.black).background(.white).clipShape(Circle())
                }
                
                Spacer()
                
                Button(action: {print("save location pressed")}) {
                    Image(systemName: "heart.fill").frame(width:30, height:30)
                        .foregroundColor(.red)
                }
                
                Button(action: {print("add stories pressed")}) {
                    Image(systemName: "pencil").frame(width:30, height:30)
                        .foregroundColor(.yellow)
                }
                
                Button(action: {print("saved paths pressed")}) {
                    Image(systemName: "clock.arrow.circlepath").frame(width:30, height:30)
                        .foregroundColor(.blue)
                }
                
                
                
            }.padding(.leading, 275)
            
            
        }
    }
}

struct MainFrameView_Previews: PreviewProvider {
    static var previews: some View {
        MainFrameView()
    }
}


extension MKCoordinateRegion {
    
    static func goldenGateRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.819527098978355, longitude:  -122.47854602016669), latitudinalMeters: 5000, longitudinalMeters: 5000)
    }
    
    func getBinding() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
