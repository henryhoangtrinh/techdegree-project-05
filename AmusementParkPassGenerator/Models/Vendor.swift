//
//  Vendor.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/23/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation


enum VendorCompany: String {
    case Acme
    case Orkin
    case Fedex
    case NWElectrical
}

protocol BasicVendor: Namable, Company, Age, DateOfService, Entrants {}

class Vendor: BasicVendor {
    var company: VendorCompany?
    
    var entrantsType: TypeOfEntrants = .VendorEntrant
    
    var entrantsPass: Passes! = VendorPass()
    
    var areaAccess: [AreaAccess] {
        switch self.company {
            
        case .Acme?:
            return [.KitchenAreas]
        case .Orkin?:
            return [.AmusementAreas, .KitchenAreas , .RideControlAreas]
        case .Fedex?:
            return [ .MaintenanceAreas, .OfficeAreas]
        case .NWElectrical?:
            return [.AmusementAreas, .KitchenAreas , .MaintenanceAreas, .OfficeAreas, .RideControlAreas]
        case .none:
            return []
        }
    }
    
    var firstName: String?
    
    var lastName: String?
    
    var dateOfBirth: Date?
    
    var dateOfService: Date?
    
    init(firstName: String?, lastName: String?, dateOfBirth: Date?, dateOfService: Date?, company: String) throws {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.dateOfService = dateOfService
        self.company = VendorCompany(rawValue: company)
        
        try EmployeeBirthDayCheck(date: dateOfBirth)
        try nameCheck(firstName: firstName, lastName: lastName)
        try companyCheck(companyName: company)
        try serviceDateCheck(time: dateOfService)
        
    }
    
}
