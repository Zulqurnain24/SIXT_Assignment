//
//  NSLayoutConstraintExtension.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 20/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

/* NSLayoutConstraint
 This extension contains method for activating the NSLayoutConstraints
 */
extension NSLayoutConstraint {
    @discardableResult func activate() -> NSLayoutConstraint {
        isActive = true
        return self
    }
}


