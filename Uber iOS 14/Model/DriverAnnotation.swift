//
//  DriverAnnotation.swift
//  Uber iOS 14
//
//  Created by Stanley Traub on 1/1/21.
//

import MapKit 

class DriverAnnotation: NSObject, MKAnnotation {
    
    // MARK: - Properties
    
    static let identifier = "DriverAnnotation"
    
    dynamic var coordinate: CLLocationCoordinate2D
    var uid: String
    
    // MARK: - Lifecycle
    
    init(uid: String, coordinate: CLLocationCoordinate2D) {
        self.uid = uid
        self.coordinate = coordinate
    }
    
    func updateAnnotationPosition(withCoordinate coordinate: CLLocationCoordinate2D) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.coordinate = coordinate
        }
    }
}
