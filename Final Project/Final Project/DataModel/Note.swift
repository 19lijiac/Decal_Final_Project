//
//  Note.swift
//  Final Project
//
//  Created by Michael Wu on 4/24/23.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import CoreLocation
import MapKit

struct Note {
    var uid: String
    var text: String
    var time: String
    var coordinate: [Double]
    //var image: UIImage?
    
    
    init(text: String, uid: String, time: String, coordinate: [Double]) {
        self.uid = uid
        self.text = text
        self.time = time
        self.coordinate = coordinate
        //self.image = image
        
    }

    func toDictionary() -> [String: Any] {
            return [
                "uid": self.uid,
                "text": self.text,
                "time": self.time,
                "coordinate": self.coordinate,
                //"image": self.image ?? UIImage(systemName: <#T##String#>)
            ]
        }
}
