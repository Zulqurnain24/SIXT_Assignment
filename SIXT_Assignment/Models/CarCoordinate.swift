//
//  CarCoordinate.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 19/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import MapKit

/* CarCoordinate
 This is the class responsible for car coordinates
 */
final class CarCoordinate: NSObject, MKAnnotation{
    private var identifier = StringConstants.carCoordinateIdentifier.rawValue
    internal var title: String?
    internal var coordinate: CLLocationCoordinate2D
    init(name:String, lat:CLLocationDegrees, long:CLLocationDegrees){
        title = name
        coordinate = CLLocationCoordinate2DMake(lat, long)
    }
}

