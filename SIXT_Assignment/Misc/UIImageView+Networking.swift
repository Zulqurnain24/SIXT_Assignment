//
//  UIImageView+Networking.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 20/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

/* UIImageView
 This extension contains the mechanism for downloading the image asynchronously
 */
let cache: NSCache = NSCache<NSString, UIImage>() //Cache to store downloaded images
extension UIImageView {
    func imageFromServerURL(urlString: String, completionHandler: @escaping () -> Void) {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if let image = cache.object(forKey: urlString as NSString) {
                DispatchQueue.main.async(execute: { () -> Void in
                    self.image = image
                    completionHandler()
                })
                return
            }
            if error != nil {
                print(error ?? StringConstants.errorDownloadingImage.rawValue)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                guard let image = UIImage(data: data!) else { return }
                self.image = image
                cache.setObject(image, forKey: urlString as NSString)
                completionHandler()
            })
            
        }).resume()
    }
    
}



