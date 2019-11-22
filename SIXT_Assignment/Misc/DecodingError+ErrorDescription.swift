//
//  DecodingError+ErrorDescription.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 20/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

// Extension on Decoding Error to provide better and concise debug description
extension DecodingError {
    
    var errorDescription: String? {
        switch  self {
        case .dataCorrupted(let context):
            return NSLocalizedString(context.debugDescription, comment: "")
        case .keyNotFound(_, let context):
            return NSLocalizedString("\(context.debugDescription)", comment: "")
        case .typeMismatch(_, let context):
            return NSLocalizedString("\(context.debugDescription)", comment: "")
        case .valueNotFound(_, let context):
            return NSLocalizedString("\(context.debugDescription)", comment: "")
        @unknown default:
            fatalError()
        }
    }
}

