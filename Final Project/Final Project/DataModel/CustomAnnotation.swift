//
//  FriendsModel.swift
//  Final Project
//
//  Created by Andy Li on 4/23/23.
//

import Foundation
import MapKit
import SwiftUI


//friends' annotation
class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    let identifier: String
    var title: String?
    var image: UIImage?
    
    init(coordinate: CLLocationCoordinate2D, identifier: String) {
        self.coordinate = coordinate
        self.identifier = identifier
        self.image = UIImage(systemName: "person.crop.circle")
        self.title = identifier
        super.init()
    }
    
    func setCoordinate(_ newCoordinate: CLLocationCoordinate2D) {
            self.coordinate = newCoordinate
        }
}


struct CustomAnnotationView: View {
    var annotation: CustomAnnotation
    
    var body: some View {
        VStack {
            Image(uiImage: annotation.image!)
                .resizable()
                .frame(width: 30, height: 30)
            //not sure why text is not displayed
            Text(annotation.identifier)
                .foregroundColor(.black)
            //test
            Text("Hi").foregroundColor(.black)
        }
    }
}
