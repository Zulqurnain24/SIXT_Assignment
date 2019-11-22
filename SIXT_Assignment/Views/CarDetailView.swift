//
//  CarDetailView.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 19/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import MapKit

protocol CarDetailViewProtocol {
    func setUpLocationManager()
    func setConstraints()
    func centerMapOnLocation(location: CLLocation)
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation)
}

/* CarDetailView
 This is the UIView which is used to display the delivery detail
 */
final class CarDetailView: UIView, CLLocationManagerDelegate, CarDetailViewProtocol  {
    
    internal var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blackish
        label.font = Fonts.body
        label.enableAutoLayout()
        return label
    } ()
    
    internal var modelNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blackish
        label.font = Fonts.body
        label.enableAutoLayout()
        return label
    } ()
    
    internal var makeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blackish
        label.font = Fonts.body
        label.enableAutoLayout()
        return label
    } ()
    
    internal var transmissionTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blackish
        label.font = Fonts.body
        label.enableAutoLayout()
        return label
    } ()
    
    internal var fuelTypeLabel: UILabel = {
           let label = UILabel()
           label.textColor = Colors.blackish
           label.font = Fonts.body
           label.enableAutoLayout()
           return label
    } ()
    
    internal var fuelLevelLabel: UILabel = {
           let label = UILabel()
           label.textColor = Colors.blackish
           label.font = Fonts.body
           label.enableAutoLayout()
           return label
    } ()
    
    internal var colorLabel: UILabel = {
           let label = UILabel()
           label.textColor = Colors.blackish
           label.font = Fonts.body
           label.enableAutoLayout()
           return label
    } ()
    
    internal var cleanlinessLabel: UILabel = {
           let label = UILabel()
           label.textColor = Colors.blackish
           label.font = Fonts.body
           label.enableAutoLayout()
           return label
    } ()
    
    internal var numberPlatLabel: UILabel = {
            let label = UILabel()
            label.textColor = Colors.blackish
            label.font = Fonts.body
            label.enableAutoLayout()
            return label
    } ()
    
    internal var stackView: UIStackView!
       
    internal let distanceSpan: Double = 500
    internal let regionRadius: Double = 500
    internal var locationManager: CLLocationManager? = {
        let locationManager = CLLocationManager()
        return locationManager
    } ()
    
    internal var map: MKMapView = {
        let mapView = MKMapView()
        mapView.backgroundColor = Colors.white
        mapView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 150, height: 75))
        mapView.userTrackingMode = .follow
        mapView.enableAutoLayout()
        return mapView
    } ()
    
    internal var imageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: StringConstants.defaultImage.rawValue))
        imageView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 45, height: 45))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = Colors.lightGray
        imageView.enableAutoLayout()
        return imageView
    } ()

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.white
            
        addSubview(map)
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(modelNameLabel)
        addSubview(makeNameLabel)
        addSubview(transmissionTypeLabel)
        addSubview(fuelTypeLabel)
        addSubview(fuelLevelLabel)
        addSubview(colorLabel)
        addSubview(cleanlinessLabel)
        addSubview(numberPlatLabel)
        
        setUpLocationManager()
        setConstraints()
    }
    
    func setUpLocationManager() {
        
        locationManager = CLLocationManager()
        
        if let locationManager = locationManager {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.requestAlwaysAuthorization()
            locationManager.distanceFilter = 50
            locationManager.startUpdatingLocation()
        }
    }
    
    func setConstraints() {
        map.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).activate()
        map.bottomAnchor.constraint(equalTo: modelNameLabel.topAnchor, constant: -Padding.standard).activate()
        map.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 2).activate()
        map.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 2).activate()
        map.widthAnchor.constraint(equalTo: (self.widthAnchor), constant: -(0.1 * ScreenDimensions.width)).activate()
        map.heightAnchor.constraint(equalTo: (self.heightAnchor), constant: -(0.4 * ScreenDimensions.height)).activate()
        
        imageView.topAnchor.constraint(equalTo: map.bottomAnchor, constant: Padding.small).activate()
        imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: Padding.standard/8).activate()
        imageView.trailingAnchor.constraint(equalTo: modelNameLabel.leadingAnchor, constant: -Padding.standard/2).activate()
     
        nameLabel.topAnchor.constraint(equalTo: map.bottomAnchor, constant: 0).activate()
        nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).activate()
        nameLabel.trailingAnchor.constraint(equalTo: modelNameLabel.leadingAnchor, constant: -Padding.standard/2).activate()
        
        modelNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).activate()
        modelNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).activate()
        modelNameLabel.trailingAnchor.constraint(equalTo: transmissionTypeLabel.leadingAnchor, constant: -Padding.standard/2).activate()
        
        transmissionTypeLabel.topAnchor.constraint(equalTo: modelNameLabel.bottomAnchor, constant: 0).activate()
        transmissionTypeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).activate()
        transmissionTypeLabel.trailingAnchor.constraint(equalTo: fuelTypeLabel.leadingAnchor, constant: -Padding.standard/2).activate()
        
        fuelTypeLabel.topAnchor.constraint(equalTo: transmissionTypeLabel.bottomAnchor, constant: 0).activate()
        fuelTypeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).activate()
        fuelTypeLabel.sizeThatFits(CGSize(width: 0.65 * self.frame.size.width, height: 0.5 * self.frame.size.height))
        
        modelNameLabel.topAnchor.constraint(equalTo: fuelTypeLabel.bottomAnchor, constant: 0).activate()
        modelNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).activate()
        modelNameLabel.sizeThatFits(CGSize(width: 0.65 * self.frame.size.width, height: 0.5 * self.frame.size.height))

        cleanlinessLabel.topAnchor.constraint(equalTo: modelNameLabel.bottomAnchor, constant: 0).activate()
        cleanlinessLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).activate()
        cleanlinessLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).activate()
        
        numberPlatLabel.topAnchor.constraint(equalTo: cleanlinessLabel.bottomAnchor, constant: 0).activate()
        numberPlatLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).activate()
        numberPlatLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).activate()
        
        stackView = UIStackView(arrangedSubviews: [nameLabel, modelNameLabel, makeNameLabel, transmissionTypeLabel, fuelLevelLabel, fuelTypeLabel, colorLabel, cleanlinessLabel, numberPlatLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 1
        addSubview(stackView)
        bringSubviewToFront(stackView)
        stackView.center = self.center
        stackView.anchor(top: map.bottomAnchor, left: imageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: Padding.small, paddingLeft: Padding.small, paddingBottom: Padding.small, paddingRight: Padding.small, width: 0.5 * frame.width, height: 0.25 * frame.height, enableInsets: false)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        if let mapView = self.map as MKMapView? {
            let region = MKCoordinateRegion(center: newLocation.coordinate, latitudinalMeters: self.distanceSpan, longitudinalMeters: self.distanceSpan)
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
        }
    }
}


