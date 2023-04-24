//
//  ProfileView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var locationTracker = LocationTracker()
    @ObservedObject var navigationManager: ViewNavigationManager
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .center) {
                   
                    Image(systemName: "person.crop.circle").resizable().frame(width: 70, height: 70)
                    

                    Text("NAME")
                    .font(.largeTitle)
                    .tracking(1.20)

                    VStack() {
                        Text("CURRENT LOCATION/CITY:")
                        .font(.system(size: 15))
                        .tracking(0.80)
                        .padding(.bottom, 30)
                        
                    

                        Text("\(locationTracker.cityName), \(locationTracker.stateName), \(locationTracker.countryName)")
                            .font(.system(size: 30))
                            .tracking(0.80)
                    }
                    .frame(width: 260, height: 200)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(10)
                    .padding(.top, 5)
                    .padding(.bottom, 50)
                    //not sure why location doesn't show up in the simulator
                    .onAppear {
                        locationTracker.startUpdatingLocation()
                    }.multilineTextAlignment(.center)

                    Text("RECENT STORIES")
                    .font(.title3)
                    .tracking(0.80)

                    Rectangle()
                    .frame(width: 180, height: 1)
                }
                .padding(.top, 40)
                
            }
            .navigationBarItems(leading: backButton)
        }.background(Color.white)
    }
    
    
    var backButton: some View {
        Button(action: navigationManager.goToSettingView) {
            HStack (spacing: 10) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .frame(width: 20, height: 20)
                
                Text("Back")
            }
        }
    }
     
}


/*
 struct ProfileView_Previews: PreviewProvider {
 static var previews: some View {
 ProfileView()
 }
 }
 */
