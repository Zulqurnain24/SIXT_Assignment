//
//  Car.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 19/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

/* Car
 This entity contains the car data
 */
struct Car: Codable, Equatable {

    let  id: String
    let  modelIdentifier: String
    let  make: String
    let  modelName: String
    let  name: String
    let  group: String
    let  color: String
    let  series: String
    let  fuelType: String
    let  transmission: String
    let  licensePlate: String
    let  carImageUrl: String
    let  latitude: Double
    let  longitude: Double
    let  innerCleanliness: String
    let  fuelLevel: Float
    
    private enum UserKeys: String, CodingKey {
        case id
        case  modelIdentifier
        case  make
        case  modelName
        case  name
        case  group
        case  color
        case  series
        case  fuelType
        case  transmission
        case  licensePlate
        case  carImageUrl
        case  latitude
        case  longitude
        case  innerCleanliness
        case  fuelLevel
    }
    
    init(id: String, modelIdentifier: String, make: String, modelName: String, name: String, group: String, color: String, series: String, fuelType: String, transmission: String, licensePlate: String, carImageUrl: String, latitude: Double, longitude: Double, innerCleanliness: String, fuelLevel: Float) {
          self.id = id
          self.modelIdentifier = modelIdentifier
          self.make = make
          self.modelName = modelName
          self.name = name
          self.group = group
          self.color = color
          self.series = series
          self.fuelType = fuelType
          self.transmission = transmission
          self.licensePlate = licensePlate
          self.carImageUrl = carImageUrl
          self.latitude = latitude
          self.longitude = longitude
          self.innerCleanliness = innerCleanliness
          self.fuelLevel = fuelLevel
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return  lhs.id == rhs.id &&
                lhs.modelIdentifier == rhs.modelIdentifier &&
                lhs.modelName == rhs.modelName &&
                lhs.name == rhs.name &&
                lhs.make == rhs.make &&
                lhs.group == rhs.group &&
                lhs.color == rhs.color &&
                lhs.series == rhs.series &&
                lhs.fuelType == rhs.fuelType &&
                lhs.transmission == rhs.transmission &&
                lhs.licensePlate == rhs.licensePlate &&
                lhs.carImageUrl == rhs.carImageUrl &&
                lhs.latitude == rhs.latitude &&
                lhs.longitude == rhs.longitude &&
                lhs.innerCleanliness == rhs.innerCleanliness &&
                lhs.fuelLevel == rhs.fuelLevel
    }
    
}

