//
//  ParkErrors.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/15/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation

enum ParkErrors : Error {
    
    // Children
    case invalidDateOfBirth
    case exceedAge
    case happyBirthDay
    case notBornYet
    case tooYoungforSeniorPass
    
    // Employee
    case invalidFirstName
    case invalidLastName
    case invalidStreetName
    case invalidCity
    case invalidState
    case invalidZipCode
    
    case invalidProjectNumber
    case wrongProjectNumber
    
    //Vendor
    case invalidVendor
    case wrongVendorName
    case invalidDateOfService
    
    //Swipe
    case SwippedTwice
    
}

extension ParkErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .invalidDateOfBirth:
            return "Invalid Date of Birth"
        case .exceedAge:
            return "Must be under 5 years old"
        case .happyBirthDay:
            return "Happy BirthDay! But Sorry you are 5 years old today, please switch to different type of pass"
        case .notBornYet:
            return "You might input wrong Date(given Date in the future)"
        case .tooYoungforSeniorPass:
            return "Must be 65 years old and up for Senior Age"
        case .invalidFirstName:
            return "Invalid First Name"
        case .invalidLastName:
            return "Invalid Last Name"
        case .invalidStreetName:
            return "Invalid Street Name"
        case .invalidCity:
            return "Invalid City"
        case .invalidState:
            return "Invalid State"
        case .invalidZipCode:
            return "Invalid Zip Code"
        case .invalidProjectNumber:
            return "Invalid Project Numbers"
        case .wrongProjectNumber:
            return "please choose between 1001, 1002, 1003, 2001 or 2002"
        case .invalidVendor:
            return "Invalid Vendor"
        case .wrongVendorName:
            return "Vendors could access to our Park: Acme, Orkinm, Fedex or NWElectrical"
        case .invalidDateOfService:
            return "Invalid Date Of Service "
        case .SwippedTwice:
            return "You already swpipped, please try again after 5 seconds"
        }
    }
}
/* Creadit -> https://stackoverflow.com/questions/39176196/how-to-provide-a-localized-description-with-an-error-type-in-swift ( Error Handling ) */
