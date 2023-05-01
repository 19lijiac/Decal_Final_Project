//
//  SettingView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var navigationManager: ViewNavigationManager
    @ObservedObject var locationTracker : LocationTracker
    @State private var userName: String = ""
    //TODO: instantiate data model
    
    

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack(spacing: 30) {
                        
                        Image(systemName: "person.crop.circle").resizable().frame(width: 50, height: 50)
                        
                        Text(userName.isEmpty ? "NAME" : userName)
                                                    .font(.system(size: 40))
                                                    .onAppear {
                                                        FirebaseManager.shared.fetchUserName { fetchedUserName in
                                                            if let fetchedUserName = fetchedUserName {
                                                                self.userName = fetchedUserName
                                                            }
                                                        }
                                                    }
                    }
                }.frame(height:80).buttonStyle(PlainButtonStyle())
                    .onTapGesture {
                        FirebaseManager.shared.readRecentNotes()
                        navigationManager.goToProfileView()
                    }
                
                Section("customization") {
                    Toggle(isOn: $locationTracker.isDarkMode, label: {
                        Text("Dark Mode")
                    })
                }
            }.navigationBarTitle("Settings")
             .navigationBarItems(leading: backButton)
        }
    }
    
    
    var backButton: some View {
        Button(action: navigationManager.goToMainFrameView) {
            HStack (spacing: 10) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .frame(width: 20, height: 20)
                
                Text("Back")
            }
        }
    }
}
