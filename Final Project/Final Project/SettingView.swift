//
//  SettingView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var navigationManager: ViewNavigationManager
    @State var darkMode = false
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
                    Toggle(isOn: $darkMode, label: {
                        Text("Dark Mode")
                    })
                }
            }.navigationBarTitle("Settings")
        }
    }
}
