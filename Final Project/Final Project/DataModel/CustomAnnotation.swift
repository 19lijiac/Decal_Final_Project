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
    @objc dynamic var coordinate: CLLocationCoordinate2D
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

/*
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
 */

/*
 class CustomAnnotationView: MKAnnotationView {
 //static let reuseIdentifier = "CustomAnnotationView"
 
 override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
 super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
 
 if let customAnnotation = annotation as? CustomAnnotation {
 self.image = customAnnotation.image // Use the image from the custom annotation
 centerOffset = CGPoint(x: 0, y: -image!.size.height / 2)
 self.canShowCallout = true // Enable callout
 }
 }
 
 required init?(coder aDecoder: NSCoder) {
 fatalError("init(coder:) has not been implemented")
 }
 
 
 
 }
 */
class CustomAnnotationView: MKAnnotationView {
    private var annotationName: String = ""

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        //self.backgroundColor = UIColor.white
        //self.layer.borderColor = UIColor.black.cgColor
        //self.layer.borderWidth = 1.0
        //self.image = UIImage(systemName: "person.crop.circle")
        if let title = annotation?.title {
            // Use the unwrapped title value here
            self.annotationName = title ?? ""
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented!")
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(2.0)

        // Set the fill color
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let fillColor = UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
        context.setFillColor(fillColor)

        // Create a rectangle to draw the square in
        let squareRect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)

        // Draw the square
        context.addRect(squareRect)
        context.drawPath(using: .fillStroke)
        
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.white,
            .strokeColor: UIColor.black,
            .strokeWidth: -1.0
        ]

        // Set the text to draw
        let text = self.annotationName

        // Get the size of the text
        let textSize = text.size(withAttributes: attributes)

        // Calculate the center point for the text
        let centerPoint = CGPoint(x: squareRect.midX - textSize.width/2, y: squareRect.midY - textSize.height/2)

        // Draw the text
        text.draw(at: centerPoint, withAttributes: attributes)
    }

}
