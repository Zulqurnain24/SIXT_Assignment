//
//  SplashVC.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 20/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol SplashVCProtocol {
    func setupView()
    func loadView()
    func presentCarBrowseVC()
}

/* SplashVC
 This is the UIViewcontroller class responsible for displaying the splash screen animation
 */
final class SplashVC: UIViewController, SplashVCProtocol {

    override func viewDidLoad() {
       super.viewDidLoad()
       setupView()
    }

    func setupView() {
        let splashView = SplashView(frame: self.view.frame)
        view.addSubview(splashView)
        presentCarBrowseVC()
    }
    
    func presentCarBrowseVC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + DoubleConstants.animationDuration.rawValue) {
            guard let carBrowseVC = CarBrowseVC() as CarBrowseVC?, let carBrowseNavC = UINavigationController(rootViewController: carBrowseVC) as UINavigationController? else { return }
            carBrowseNavC.modalPresentationStyle = .fullScreen
            carBrowseNavC.navigationBar.barTintColor = Colors.white
                         carBrowseNavC.navigationBar.tintColor = Colors.reddish
                         carBrowseNavC.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
            self.modalPresentationStyle = .overFullScreen
            self.present(carBrowseNavC, animated: true, completion: nil)
        }
    }

}
