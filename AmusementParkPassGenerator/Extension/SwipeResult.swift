//
//  SwipeResult.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/28/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation
import UIKit

enum SwipeResult : String {
    case valid = "OK"
    case deny = "Denied"
    
    func showColor() -> UIColor {
        switch self {
        case .valid:
            return UIColor.green
        case .deny :
            return UIColor.red
        }
    }
    
    func showResult() -> String {
        switch self {
        case .valid:
            return "Valid Access"
        case .deny:
            return "Denied"
        }
    }
}
