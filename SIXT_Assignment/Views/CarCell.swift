//
//  CarCell.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 19/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol CarCellProtocol {
    func setConstraints()
    func configure(id: String, modelIdentifier: String, makeName: String, modelName: String, name: String, group: String, color: String, series: String, fuelType: String, transmission: String, licensePlate: String, carImageUrl: String, latitude: Double, longitude: Double, innerCleanliness: String, fuelLevel: Float, _ completionHandler: (() -> Void)?)
}

/* CarCell
 This is the UITableViewCell which is used in CarListBrowseView Tableview
 */
final class CarCell: UITableViewCell, CarCellProtocol {
    
    internal var modelNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blackish
        label.font = Fonts.body
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.enableAutoLayout()
        return label
    } ()
    
    internal var makeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blackish
        label.font = Fonts.body
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.enableAutoLayout()
        return label
    } ()
    
    internal var transmissionTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blackish
        label.font = Fonts.body
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.enableAutoLayout()
        return label
    } ()
    
    internal var fuelTypeLabel: UILabel = {
        let label = UILabel()
           label.textColor = Colors.blackish
           label.font = Fonts.body
           label.lineBreakMode = .byWordWrapping
           label.numberOfLines = 0
           label.enableAutoLayout()
           return label
    } ()
    
    internal var fuelLevelLabel: UILabel = {
        let label = UILabel()
           label.textColor = Colors.blackish
           label.font = Fonts.body
           label.lineBreakMode = .byWordWrapping
           label.numberOfLines = 0
           label.enableAutoLayout()
           return label
    } ()
    
    internal var colorLabel: UILabel = {
        let label = UILabel()
           label.textColor = Colors.blackish
           label.font = Fonts.body
           label.lineBreakMode = .byWordWrapping
           label.numberOfLines = 0
           label.enableAutoLayout()
           return label
    } ()
    
    internal var stackView: UIStackView!
    
    internal static let thumbnailHeightWidth: CGFloat = 200.0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Colors.white
        self.layoutMargins = .init()
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.image = UIImage(named: StringConstants.defaultImage.rawValue)
        self.contentView.layoutMargins.left = 5
        self.contentView.layoutMargins.right = 5
        self.contentView.layoutMargins.top = 5
        self.contentView.layoutMargins.bottom = 5
        self.contentView.backgroundColor = Colors.white
        self.imageView?.layer.cornerRadius = 5.0
        self.imageView?.layer.masksToBounds = true
        self.imageView?.alpha = 0.75
        
        addSubview(modelNameLabel)
        addSubview(makeNameLabel)
        addSubview(transmissionTypeLabel)
        addSubview(fuelLevelLabel)
        addSubview(fuelTypeLabel)
        addSubview(colorLabel)

        setConstraints()
    }
    
    func setConstraints() {
        imageView?.contentMode = .scaleAspectFit
        imageView?.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 0.4 * frame.size.width, height: 0.4 * frame.size.width, enableInsets: false)
         modelNameLabel.anchor(top: topAnchor, left: imageView?.rightAnchor, bottom: self.topAnchor, right: self.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
         makeNameLabel.anchor(top: modelNameLabel.bottomAnchor, left: imageView?.rightAnchor, bottom: transmissionTypeLabel.topAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
         transmissionTypeLabel.anchor(top: makeNameLabel.bottomAnchor, left: imageView?.rightAnchor, bottom: fuelLevelLabel.topAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
         fuelLevelLabel.anchor(top: transmissionTypeLabel.bottomAnchor, left: imageView?.rightAnchor, bottom: fuelTypeLabel.topAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
         fuelTypeLabel.anchor(top: fuelLevelLabel.bottomAnchor, left: imageView?.rightAnchor, bottom: colorLabel.topAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        colorLabel.anchor(top: modelNameLabel.bottomAnchor, left: imageView?.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
         
        stackView = UIStackView(arrangedSubviews: [modelNameLabel, makeNameLabel, transmissionTypeLabel, fuelTypeLabel, fuelLevelLabel, colorLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 2.5
        addSubview(stackView)
        bringSubviewToFront(stackView)
        stackView.center = self.center
        stackView.anchor(top: topAnchor, left: imageView?.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: Padding.small, paddingLeft: 0, paddingBottom: Padding.small, paddingRight: Padding.small, width: 0.5 * self.frame.width, height: 0.9 * self.frame.height, enableInsets: false)
    }
    
    func configure(id: String, modelIdentifier: String, makeName: String, modelName: String, name: String, group: String, color: String, series: String, fuelType: String, transmission: String, licensePlate: String, carImageUrl: String, latitude: Double, longitude: Double, innerCleanliness: String, fuelLevel: Float,  _ completionHandler: (() -> Void)? = nil) {
        self.makeNameLabel.text = "\(StringConstants.make.rawValue) \(makeName)"
        self.modelNameLabel.text = "\(StringConstants.model.rawValue) \(modelName)"
        self.transmissionTypeLabel.text = "\(StringConstants.transmission.rawValue) \(transmission)"
        self.fuelTypeLabel.text = "\(StringConstants.fuelType.rawValue) \(fuelType)"
        self.fuelLevelLabel.text = "\(StringConstants.fuelLevel.rawValue) \(fuelLevel) %"
        self.imageView?.imageFromServerURL(urlString: carImageUrl, completionHandler: {
            self.imageView?.image = CommonFunctionality.resizeImage(image: self.imageView?.image ?? UIImage(named: StringConstants.defaultImage.rawValue)!, newWidth: CGFloat(DoubleConstants.cellImageRatio.rawValue) * self.frame.width)
            self.imageView?.clipsToBounds = true
            self.imageView?.layer.cornerRadius = 10
            self.imageView?.contentMode = .scaleAspectFit
            self.imageView?.setNeedsDisplay()
            guard completionHandler != nil else {return}
            completionHandler?()
        })
        
        modelNameLabel.sizeToFit()
        makeNameLabel.sizeToFit()
        transmissionTypeLabel.sizeToFit()
        fuelTypeLabel.sizeToFit()
        fuelLevelLabel.sizeToFit()
        colorLabel.sizeToFit()
        
        self.setNeedsDisplay()
    }
}

