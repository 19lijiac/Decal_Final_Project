//
//  FriendsModel.swift
//  Final Project
//
//  Created by Andy Li on 4/23/23.
//

import Foundation
import MapKit
import SwiftUI



class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var image: UIImage?
    
    init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
        self.image = UIImage(systemName: "person.crop.circle")
        super.init()
    }
}
