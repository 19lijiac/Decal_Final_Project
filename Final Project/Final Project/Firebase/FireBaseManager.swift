//
//  FireBaseManager.swift
//  Final Project
//
//  Created by Andy Li on 4/27/23.
//

import Foundation
import Firebase
import FirebaseDatabase
import CoreLocation
import MapKit

class FirebaseManager {
    static let shared = FirebaseManager()
    let databaseRef: DatabaseReference
    var currentUser: FirebaseAuth.User?
    var noteDictionary: [[String: String]] = []
    var noteLocationDictionary: [MKPointAnnotation] = []
    var allUserList: [String] = []
    var friendList: [String] = []
    var friendAnnotation: [String: CustomAnnotation] = [:]
    var checkFriendAnnot: Set<String> = Set<String>()
    
    
    private init() {
        databaseRef = Database.database(url: "https://decal-final-project-default-rtdb.firebaseio.com/").reference()
    }
    
    
    //click submit button to create a note (Data Structure: users -> notes)
    func addNoteToDatabase(noteText: String, locationTracker: LocationTracker) {
        let userRef = FirebaseManager.shared.databaseRef.child("users").child(currentUser!.uid)
        let currentUserNotesRef = userRef.child("notes").childByAutoId()
        
        //retrieve current location and time data
        let addNotesCoordinate = locationTracker.location?.coordinate ?? CLLocationCoordinate2D(latitude: 999, longitude: 999)
        let addNotesLongitude = Double(addNotesCoordinate.longitude)
        let addNotesLatitude = Double(addNotesCoordinate.latitude)
        let addNotesLocation = [addNotesLatitude, addNotesLongitude]
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let formattedTime = formatter.string(from: date)
        
        //create Note object
        let note = Note(text: noteText, uid: currentUser!.uid, time: formattedTime, coordinate: addNotesLocation)
        let noteDictionary = note.toDictionary()
        
        //store Note in the database
        currentUserNotesRef.setValue(noteDictionary) { (error, ref) in
            if let error = error {
                print("Error saving user data: \(error.localizedDescription)")
                return
            } else {
                print("User data saved successfully")
            }
        }
    }
    
    
    
    //display 3 recent Notes in the ProfileView
    func readRecentNotes() {
        FirebaseManager.shared.databaseRef.child("users").child(currentUser!.uid).child("notes").observe(.value, with: { snapshot in
            // check if there are any children under the node
            guard snapshot.hasChildren() else {
                print("No children under node")
                return
            }

            // loop through all children under the node
            for child in snapshot.children {
                guard let childSnapshot = child as? DataSnapshot else {
                    continue
                }
                
                
                // Check if the child node has an attribute called "text"
                guard let textValue = childSnapshot.childSnapshot(forPath: "text").value as? String else {
                    continue
                }
                
                guard let timeValue = childSnapshot.childSnapshot(forPath: "time").value as? String else {
                    continue
                }
                
                let noteDict = ["text":textValue, "time": timeValue]
                self.noteDictionary.append(noteDict)
            }
        }) { error in
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
    
    func readPins() {
        FirebaseManager.shared.databaseRef.child("users").child(currentUser!.uid).child("notes").observe(.value, with: { snapshot in
            // check if there are any children under the node
            guard snapshot.hasChildren() else {
                print("No children under node")
                return
            }

            // loop through all children under the node
            for child in snapshot.children {
                guard let childSnapshot = child as? DataSnapshot else {
                    continue
                }
                
                guard let coordinateValue = childSnapshot.childSnapshot(forPath: "coordinate").value as? [Double] else {
                    continue
                }
                let latitude = coordinateValue[0]
                let longitude = coordinateValue[1]
                
                let noteLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                let annotation = MKPointAnnotation()
                annotation.coordinate = noteLocation
                self.noteLocationDictionary.append(annotation)
            }
        }) { error in
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
    
    func readUserList() {
        FirebaseManager.shared.databaseRef.child("users").observe(.value, with: { snapshot in
            // check if there are any children under the node
            guard snapshot.hasChildren() else {
                print("No children under node")
                return
            }
            
            // loop through all children under the node
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot {
                    let userId = childSnapshot.key
                    if !self.allUserList.contains(userId) && !self.friendList.contains(userId) && userId != FirebaseManager.shared.currentUser!.uid  {
                        self.allUserList.append(userId)
                    }
                }
            }
        }) { error in
            print("Error: \(error.localizedDescription)")
        }
    }
    
    //status currently only contains location information
    func updateUserStatus(locationTracker: LocationTracker) {
        let userRef = FirebaseManager.shared.databaseRef.child("users").child(currentUser!.uid)
        let currentUserStatusRef = userRef.child("status")
        
        let currentCoordinate = locationTracker.location?.coordinate ?? CLLocationCoordinate2D(latitude: 999, longitude: 999)
        let latitude = currentCoordinate.latitude
        let longitude = currentCoordinate.longitude
        
        let statusDictionary = ["latitude": latitude, "longitude": longitude]
           
            
        currentUserStatusRef.setValue(statusDictionary) { (error, ref) in
            if let error = error {
                print("Error saving user data: \(error.localizedDescription)")
                return
            } else {
                print("User data saved successfully")
            }
        }
    }
    
    func addUser(addUserId: String) {
        let userRef = FirebaseManager.shared.databaseRef.child("users").child(currentUser!.uid)
        let currentUserFriendsRef = userRef.child("friends")
        
        currentUserFriendsRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                // The "friends" node exists, so append the new friend to the list
                if var friendsValue = snapshot.value as? [String] {
                    friendsValue.append(addUserId)
                    currentUserFriendsRef.setValue(friendsValue) { (error, ref) in
                        if let error = error {
                            print("Error adding friend to list: \(error.localizedDescription)")
                            return
                        }
                        
                        print("Friend added to list")
                    }
                } else {
                    print("Invalid friends data")
                }
            } else {
                // The "friends" node does not exist, so create it with the new friend
                let friendsValue = [addUserId]
                currentUserFriendsRef.setValue(friendsValue) { (error, ref) in
                    if let error = error {
                        print("Error creating friends list: \(error.localizedDescription)")
                        return
                    }
                    
                    print("Friends list created")
                }
            }
        }) { (error) in
            print("Error checking for friends list: \(error.localizedDescription)")
        }
    }
    
    func readFriends() {
        let userRef = FirebaseManager.shared.databaseRef.child("users").child(currentUser!.uid)
        let currentUserFriendsRef = userRef.child("friends")
        
    
        currentUserFriendsRef.observe(.value, with: { snapshot in
            // check if there are any children under the node
            guard snapshot.hasChildren() else {
                print("No children under node friends!!!")
                return
            }
            
            
            //test
            //var count = 0
            // loop through all children under the node
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot {
                    let userId = childSnapshot.value
                    if !self.friendList.contains(userId as! String){
                        self.friendList.append(userId as! String)
                        //print("hit work")
                        //count += 1
                        //print("hit \(count)")
                        //print("hit \(userId as! String)")
                        //print("hit \(self.friendList[0])")
                    }
                }
            }
            
            for friend in self.friendList {
                //print("hit")
                let friendStatusRef = FirebaseManager.shared.databaseRef.child("users").child(friend).child("status")
                
                friendStatusRef.observeSingleEvent(of: .value, with: { snapshot in
                    let latitude = snapshot.childSnapshot(forPath: "latitude").value as? Double ?? 999
                    let longitude = snapshot.childSnapshot(forPath: "longitude").value as? Double ?? 999
                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    let annotation = CustomAnnotation(coordinate: coordinate, identifier: "\(friend)")
                    self.friendAnnotation[friend] = annotation
                }) { error in
                    print("Error: \(error.localizedDescription)")
                }
            }
        }) { error in
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func storeUserName(username: String, completion: @escaping () -> Void) {
        let userRef = databaseRef.child("users").child(currentUser!.uid)
        userRef.updateChildValues(["username": username]) { (error, ref) in
            if let error = error {
                print("Error saving user name: \(error.localizedDescription)")
            } else {
                print("User name saved successfully")
                completion()
            }
        }
    }


    func fetchUserName(completion: @escaping (String?) -> Void) {
        guard let userId = currentUser?.uid else { return }
        let userRef = databaseRef.child("users").child(userId)

        userRef.observeSingleEvent(of: .value, with: { snapshot in
            if let userName = snapshot.childSnapshot(forPath: "username").value as? String { // Change "name" to "username"
                completion(userName)
            } else {
                print("User not found.")
                completion(nil)
            }
        }) { error in
            print("Error fetching user name: \(error.localizedDescription)")
            completion(nil)
        }
    }


    func updateUserName(newUserName: String, completion: @escaping () -> Void) {
        print("update user name")
        if !newUserName.isEmpty {
            storeUserName(username: newUserName) {
                completion()
            }
        }
    }

     
}
