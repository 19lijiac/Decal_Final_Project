//
//  SettingView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var navigationManager: ViewNavigationManager
    @Binding var isDarkMode: Bool
    
    //TODO: instantiate data model
    
    

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack(spacing: 30) {
                        
                        Image(systemName: "person.crop.circle").resizable().frame(width: 50, height: 50)
                        
                        Text("NAME").font(.system(size: 40))
                    }
                }.frame(height:80)
                
                Section("customization") {
                    Toggle(isOn: $isDarkMode, label: {
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
