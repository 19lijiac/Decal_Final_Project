//
//  FireBaseManager.swift
//  Final Project
//
//  Created by Andy Li on 4/27/23.
//

import Foundation
import Firebase
import FirebaseDatabase

class FirebaseManager {
    static let shared = FirebaseManager()
    let databaseRef: DatabaseReference
    
    private init() {
        databaseRef = Database.database(url: "https://decal-final-project-default-rtdb.firebaseio.com/").reference()
    }
}
