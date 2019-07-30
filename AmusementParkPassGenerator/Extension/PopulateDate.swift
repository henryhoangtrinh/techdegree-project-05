//
//  PopulateDate.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/23/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation


struct PopulateDate {
    
    // MARK: First Name
    static func givenFirstName() -> String? {
        let firstNames = ["Henry","Nancy","Ruki","Tony","Mimi"]
        
        guard let randomFirstName = firstNames.randomElement() else {
            return nil
        }
        return randomFirstName
    }
    
    // MARK: Last Name
    static func givenLastName() -> String? {
        let lastNames = ["Trinh","Vu","Tran","Nguyen","Parker"]
        
        guard let randomLastName = lastNames.randomElement() else {
            return nil
        }
        return randomLastName
    }
    
    // MARK: Date for Date of Birth & Service
    static func givenDate() -> String? {
        let dates = ["11/22/1990","05/03/2017","04/25/1950","06/28/1911","12/02/1962","01/01/2019","03/07/2019","12/01/2018","06/30/2017","11/15/2016","09/01/2015","04/19/2019","01/01/2012","01/01/1919"]
        
        guard let randomDate = dates.randomElement() else {
            return nil
        }
        return randomDate
    }
    
    // MARK:Street Address
    static func givenStreet() -> String? {
        let streetNames = ["419 S HIGH","510 TYLER RD","1105 MARSHALL AVE","999 MAIN STREET","01 GOLDEN BLVD"]
        
        guard let randomStreet = streetNames.randomElement() else {
            return nil
        }
        return randomStreet
    }
    
    // MARK: City
    static func  givenCity() -> String? {
        let cityNamnes = ["LONGVIEW", "DALLAS", "GARLAND", "NEWYORK", "HOUSTON"]
        
        guard let randomCity = cityNamnes.randomElement() else {
            return nil
        }
        return randomCity
    }
    
    // MARK: State
    static func givenState() -> String? {
        let stateNames = ["Texas", "California", "Alabama", "Colorado", "Arizona"]
        
        guard let randomState = stateNames.randomElement() else {
            return nil
        }
        return randomState
    }
    
    // MARK: Zip Code
    static func givenZipCode() -> String? {
        let zipCodes = ["75601", "12345", "50789", "37612", "10056"]
        
        guard let randomZipcode = zipCodes.randomElement() else {
            return nil
        }
        return randomZipcode
    }
    
    // MARK: Project
    static func givenPrject() -> String? {
        let projects = ["1001", "1002", "1003", "2001", "2002"]
        
        guard let randomProject = projects.randomElement() else {
            return nil
        }
        return randomProject
    }
    
    // MARK: Vendor
    static func givenVendor() -> String? {
        let vendors = ["Fedex", "Acme", "Orkin", "NWElectrical"]
        
        guard let randomVendor = vendors.randomElement() else {
            return nil
        }
        return randomVendor
    }
}
