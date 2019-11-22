//
//  Enums.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 20/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

/* Enums
 This class contains the enums
 */


// swift result type
enum ResultType<T> {
    case Success(T)
    case Failure(e: Error)
}

// Error for unknown case
enum JSONDecodingError: Error, LocalizedError {
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .unknownError:
            return NSLocalizedString("Unknown Error occured", comment: "")
        }
    }
}

//DoubleConstants Enum
enum DoubleConstants: Double {
    typealias RawValue = Double
    case animationDuration = 4.0
    case cellImageRatio = 0.65
    case detailImageRatio = 0.35
    case coordinateDistance = 5000.0
}

//StringConstants Enum
enum StringConstants: String {
    typealias RawValue = String
    case internetErrorTitleText = "Error"
    case carBrowseVCTitle = "Delivery List"
    case internetErrorMessageText = "Please connect to internet."
    case serviceUnavailable = "It seems service is unavailable temporarily. Please try again later"
    case carsKey = "deliveries"
    case issueWithTheServer = "It seems there is an issue with the server at the moment. Please try later"
    case persistentStoreData = "Internet is unavailable for now the data is restored from persistent store. Please restore internet connection for the latest data"
    case bmwMiniCooper = "../SceneKitAssetCatalog/mini.scn"
    case defaultImage = "defaultImage"
    case refreshButton = "refreshButton"
    case name = "Name:"
    case model = "Model:"
    case make = "Make:"
    case transmission = "Transmission:"
    case fuelLevel = "Fuel Level:"
    case fuelType = "Fuel Type:"
    case color = "Color:"
    case cleanliness = "Cleanliness:"
    case licensePlate = "License Plate:"
    case carDetails = "Car Details"
    case allCars = "All Cars"
    case errorDownloadingImage = "Error downloading image"
    case carCoordinateIdentifier = "car location"
    case carListTableIdentifier = "CarListTable"
}

