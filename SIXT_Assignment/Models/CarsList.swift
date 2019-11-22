//
//  CarsList.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 19/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

/* DeliveriesList
 This class is used to house Delivery objects in order to display them in the tableview
 */
struct CarsList: Codable {
    private var cars: [Car]!
    
    init(_ cars: [Car]) {
        self.cars = cars
    }
    
    func getCars() -> [Car] {
        return cars
    }
    
    mutating func removeAll() {
        cars.removeAll()
    }
}
