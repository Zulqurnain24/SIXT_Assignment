//
//  CarDetailVC.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 20/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import MapKit

protocol CarDetailVCProtocol {
    func loadView()
    static func getCarDetailVC(car: Car) -> CarDetailVC
}

/* CarDetailVC
 This is the UIViewcontroller class responsible for displaying the car detail to the user
 */
final class CarDetailVC: UIViewController {
    
    fileprivate var car: Car!

    override func viewDidLoad() {
         super.viewDidLoad()
    }

}

extension CarDetailVC: CarDetailVCProtocol, MKMapViewDelegate {

    override func loadView() {
        
        title = StringConstants.carDetails.rawValue
        
        self.parent?.title = ""
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: StringConstants.allCars.rawValue, style: .plain, target: nil, action: nil)
        
        let carDetailView = CarDetailView(frame: UIScreen.main.bounds)
        
        guard car != nil else {
            return
        }
        
        carDetailView.nameLabel.text = "\(StringConstants.name.rawValue): \(car.name)"
        carDetailView.modelNameLabel.text = "\(StringConstants.model.rawValue) \(car.modelName)"
        carDetailView.makeNameLabel.text = "\(StringConstants.make.rawValue) \(car.make)"
        carDetailView.transmissionTypeLabel.text = "\(StringConstants.transmission.rawValue) \(car.transmission)"
        carDetailView.fuelLevelLabel.text = "\(StringConstants.fuelLevel.rawValue) \(car.fuelLevel)"
        carDetailView.fuelTypeLabel.text = "\(StringConstants.fuelType.rawValue) \(car.fuelType)"
        carDetailView.colorLabel.text = "\(StringConstants.color.rawValue) \(car.color)"
        carDetailView.cleanlinessLabel.text = "\(StringConstants.cleanliness.rawValue) \(car.innerCleanliness)"
        carDetailView.numberPlatLabel.text = "\(StringConstants.licensePlate.rawValue) \(car.licensePlate)"
        carDetailView.imageView.imageFromServerURL(urlString: (car?.carImageUrl) ?? StringConstants.defaultImage.rawValue, completionHandler: {
            carDetailView.imageView.image = CommonFunctionality.resizeImage(image: carDetailView.imageView.image ?? UIImage(named: StringConstants.defaultImage.rawValue)!, newWidth: CGFloat(DoubleConstants.detailImageRatio.rawValue * Double(self.view.frame.width)))
        carDetailView.clipsToBounds = true
        carDetailView.contentMode = .scaleAspectFit
        carDetailView.setNeedsDisplay()
        })
        
        view = carDetailView
        
        carDetailView.map.delegate = self
        let carLocation = CLLocationCoordinate2D(latitude:  Double(car.latitude), longitude:  Double(car.longitude))
        carDetailView.map.addAnnotation(CarCoordinate(name: car.name, lat: carLocation.latitude, long: carLocation.longitude))
        let region = MKCoordinateRegion(center: carLocation, latitudinalMeters: CLLocationDistance(exactly: DoubleConstants.coordinateDistance.rawValue)!, longitudinalMeters: CLLocationDistance(exactly: DoubleConstants.coordinateDistance.rawValue)!)
        carDetailView.map.setRegion(carDetailView.map.regionThatFits(region), animated: true)
    }
    
    class func getCarDetailVC(car: Car) -> CarDetailVC {
        let carDetailVC = CarDetailVC()
        carDetailVC.car = car
        return carDetailVC
    }
    
}

