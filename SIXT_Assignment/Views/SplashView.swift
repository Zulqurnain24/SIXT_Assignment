//
//  SplashView.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 21/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol SplashViewProtocol {
    func setConstraints()
}

/* SplashView
 This is the UIView which is used to display the splash animation
 */
final class SplashView: UIView, SplashViewProtocol  {
    
    private var customSpinnerUIImageview: CustomSpinnerUIImageview = {
          var imageArray = Array<String>()
          for i in 0...16 {
              imageArray.append("car_travel\(i).png")
          }
          let customSpinnerUIImageview = CustomSpinnerUIImageview(image: UIImage(named: "car_travel1.png"), animationImagesNames: imageArray, animateDuration: 5.0)
          customSpinnerUIImageview.contentMode = .scaleAspectFit
          customSpinnerUIImageview.isUserInteractionEnabled = true
          customSpinnerUIImageview.round(by: 6)
          customSpinnerUIImageview.layer.borderWidth = 0
          return customSpinnerUIImageview
      }()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.white
        customSpinnerUIImageview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(customSpinnerUIImageview)

        setConstraints()
        playAnimation()
    }
    
    func setConstraints() {
         customSpinnerUIImageview.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).activate()
         customSpinnerUIImageview.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).activate()
        customSpinnerUIImageview.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0.1 * UIScreen.main.bounds.width).activate()
        customSpinnerUIImageview.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0.1 * UIScreen.main.bounds.width).activate()
    }
    
    func playAnimation() {
        customSpinnerUIImageview.spin()
    }
}


