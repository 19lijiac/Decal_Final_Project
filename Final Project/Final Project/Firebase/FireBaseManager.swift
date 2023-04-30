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
    
    
    private init() {
        databaseRef = Database.database(url: "https://decal-final-project-default-rtdb.firebaseio.com/").reference()
    }
    
    
    //click submit button to create a note (Data Structure: users -> notes)
    func addNoteToDatabase (noteText: String, locationTracker: LocationTracker) {
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
    
    
    
    func readPins () {
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
}
