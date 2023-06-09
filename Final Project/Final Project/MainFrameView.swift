//
//  MainFrameView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI
import MapKit
import Firebase


struct MainFrameView: View {
    @ObservedObject var locationTracker : LocationTracker
    @ObservedObject var navigationManager: ViewNavigationManager
    @StateObject private var noteStore = NoteStore()
    @State private var showingBottomSheet = false
    //@State private var showingPolyline = false
    
    

    
    //testing
    //@State var isLinkActive = false
    
    
    var body: some View {
        
        ZStack {
            /*
            MapView(polylinePoints: $locationTracker.routeCoordinates, centerOnUser: $locationTracker.centerOnUser).ignoresSafeArea()
             */
            MapView(viewModel: locationTracker).ignoresSafeArea()
            
            
            
            
            /* test if coordinates are stored in the array
            if locationTracker.coordinatesCount > 1 {
                Text("\(locationTracker.routeCoordinates[locationTracker.coordinatesCount - 1])").foregroundColor(.black)
            }
            */
            
                
            Button(action: {showingBottomSheet.toggle()}) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width:30, height:30)
                    .frame(width: 187, height: 63)
                    .foregroundColor(.black).background(.white).clipShape(Rectangle()).cornerRadius(30)
            }.padding(.top, 600)
            
            
            
            VStack(alignment: .trailing){
                Button(action: navigationManager.goToSettingView) {
                    Image(systemName: "gearshape.fill").frame(width:30, height:30)
                        .foregroundColor(.black).background(.white).clipShape(Circle())
                }
                
                Button(action: navigationManager.goToAddFriendView) {
                    Image(systemName: "person.fill.badge.plus").frame(width:30, height:30)
                        .foregroundColor(.black).background(.white).clipShape(Circle())
                }
                
                Spacer()
                
                Button(action: {print("save location pressed")}) {
                    Image(systemName: "heart.fill").frame(width:30, height:30)
                        .foregroundColor(.red)
                }
                
                Button(action:navigationManager.goToAddStoryView) {
                    Image(systemName: "pencil").frame(width:30, height:30)
                        .foregroundColor(.yellow)
                }
                
                Button(action: {locationTracker.showingPolyline.toggle()}) {
                    Image(systemName: "clock.arrow.circlepath").frame(width:30, height:30)
                        .foregroundColor(.blue)
                }
                
                Button(action: {locationTracker.centerOnUser = true}) {
                    Image(systemName: "location.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
            }.padding(.leading, 275)
             
        }.sheet(isPresented: $showingBottomSheet) {
                BottomSheetView().presentationDetents([.height(600)])
        }
    }
}

//TODO: Fetch Friend List from Firebase and display in sheet view
struct BottomSheetView: View {
    @State private var searchText = ""
    private let friends = FirebaseManager.shared.friendList
    
    var filteredFriends: [String] {
        if searchText.isEmpty {
            return friends
        } else {
            return friends.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Showing results for \"\(searchText)\"")
                    .searchable(text: $searchText)
                    .navigationTitle("Friends List")
                    .navigationBarTitleDisplayMode(.inline)
                
                ScrollView{
                    LazyVStack{
                        ForEach(filteredFriends, id: \.self) { friend in
                            NavigationLink(destination: FriendProfileView(friend: friend)) {
                                ZStack{
                                    HStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color(.systemBackground))
                                            .overlay(
                                                Image(systemName: "person.crop.circle")
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                            )
                                            .frame(width: 58, height: 52)
                                        Text(friend)
                                            .font(.system(size: 20))
                                            .foregroundColor(Color(.label))
                                        Spacer()
                                    }
                                    .padding(.vertical, 8)
                                    .allowsHitTesting(false)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}




/*
 
 extension MKCoordinateRegion {
 
 static func goldenGateRegion() -> MKCoordinateRegion {
 MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.819527098978355, longitude:  -122.47854602016669), latitudinalMeters: 5000, longitudinalMeters: 5000)
 }
 
 func getBinding() -> Binding<MKCoordinateRegion>? {
 return Binding<MKCoordinateRegion>(.constant(self))
 }
 }
 */
