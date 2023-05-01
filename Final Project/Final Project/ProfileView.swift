//
//  ProfileView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore



struct ProfileView: View {
    //@ObservedObject var locationTracker = LocationTracker()
    @ObservedObject var locationTracker : LocationTracker
    @ObservedObject var navigationManager: ViewNavigationManager
    @State private var userName: String = ""
    @State private var newUserName: String = ""
    
    func updateUserName() {
            print("Profileview update user name")
            if !newUserName.isEmpty {
                FirebaseManager.shared.updateUserName(newUserName: newUserName) {
                    // Fetch the updated username from the database
                    FirebaseManager.shared.fetchUserName { (fetchedUserName) in
                        if let fetchedUserName = fetchedUserName {
                            self.userName = fetchedUserName
                        }
                    }
                }
            }
        }
    
    func showChangeUsernameAlert() {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let viewController = windowScene.windows.first?.rootViewController else {
                return
            }

            let alertController = UIAlertController(title: "Change Username", message: "Enter your new username.", preferredStyle: .alert)
            
            alertController.addTextField { (textField) in
                textField.placeholder = "New username"
            }
            
            let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
                if let textField = alertController.textFields?.first, let newUserName = textField.text {
                    FirebaseManager.shared.updateUserName(newUserName: newUserName) {
                        print("Username updated.")
                        FirebaseManager.shared.fetchUserName { (fetchedUserName) in
                            if let fetchedUserName = fetchedUserName {
                                DispatchQueue.main.async {
                                    self.userName = fetchedUserName
                                }
                            }
                        }
                    }
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(submitAction)
            alertController.addAction(cancelAction)
            
            viewController.present(alertController, animated: true, completion: nil)
        }

        var body: some View {
            NavigationView{
                ScrollView {
                    VStack(alignment: .center) {
                       
                        Image(systemName: "person.crop.circle").resizable().frame(width: 70, height: 70)
                        

                        Text(userName.isEmpty ? "NAME" : userName)
                            .font(.largeTitle)
                            .tracking(1.20)
                        
                        Button(action: {
                            showChangeUsernameAlert()
                        }) {
                            Text("Change Username")
                                .font(.system(size: 15))
                        }
                        .padding(.bottom, 10)
                        
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
                        

                        Text("RECENT STORIES")
                        .font(.title3)
                        .tracking(0.80)

                        Rectangle()
                        .frame(width: 180, height: 1)
                        
                        
                        //TODO: show recent stories
                        LazyVStack() {
                            ForEach(FirebaseManager.shared.noteDictionary, id: \.self) {dictionary in
                                let text = dictionary["text"] ?? "error!"
                                let time = dictionary["time"] ?? "error!"
                                HStack {
                                    Text("\(time)")
                                    Text("\(text)")
                                }
                            }
                        }
                        
                    }
                    .padding(.top, 40)
                    
                }
                .navigationBarItems(leading: backButton)
            }.background(Color.white)
            .onAppear {
                FirebaseManager.shared.fetchUserName { (fetchedUserName) in
                    if let fetchedUserName = fetchedUserName {
                        self.userName = fetchedUserName
                    }
                }
                locationTracker.startUpdatingLocation()
            }.multilineTextAlignment(.center)
            .onChange(of: userName) { _ in
            }
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
