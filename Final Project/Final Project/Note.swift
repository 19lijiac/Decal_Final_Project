//
//  Note.swift
//  Final Project
//
//  Created by Michael Wu on 4/24/23.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct Note {
    var uid: String
    var text: String
    //var image: UIImage?
    
    
    init(text: String, uid: String) {
        self.uid = uid
        self.text = text
        //self.image = image
    }
    
    
    func toDictionary() -> [String: Any] {
            return [
                "uid": self.uid,
                "text": self.text
                //"image": self.image ?? UIImage(systemName: <#T##String#>)
            ]
        }
}
