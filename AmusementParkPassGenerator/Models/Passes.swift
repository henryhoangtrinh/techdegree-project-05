//
//  Passes.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/14/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation


//          Passes Files
enum TypeOfPasses : String {
    case ClassicPass = "Classic Pass"
    case VipPass = "VIP Pass"
    case ChildrenPass = "Free Children Pass"
    
    case SeniorPass = "Senior Pass"
    case SeasonPass = "Seasonal Pass"
    
    case EmployeeFoodServicesPass = "Foods Employee"
    case EmployeeRideServicesPass = "Rides Employee"
    case EmployeeMaintenancePass = "Maintenance"
    case ManagerPass = "Manager"
    
    case VendorPass = "Vendor"
    case ContractEmployeePass = "Contractor"
    
}

class Passes {
    //var infoPass : String
    //var typeOfEntrants : TypeOfEntrants
    var typeOfPass: TypeOfPasses
    
    var lastSwipe: Date = Date()
    
     
    
    
    var rideAccess : [RideAccess] {
        switch self.typeOfPass {
        case .ClassicPass, .ChildrenPass, .EmployeeFoodServicesPass, .EmployeeRideServicesPass, .EmployeeMaintenancePass, .ManagerPass:
            return [.AccessAllRides, .NoSkipLinesAcess]
        case .VipPass, .SeasonPass, .SeniorPass:
            return [.AccessAllRides, .SkipAllRideLines]
        case .VendorPass, .ContractEmployeePass:
            return [.NoRidesAccess, .NoSkipLinesAcess]
        }
    }
    
    var discountAccessFor: DiscountType {
        switch self.typeOfPass {
        case .ClassicPass, .ChildrenPass, .VendorPass, .ContractEmployeePass:
            return DiscountType(food: 0, merchandise: 0)
        case .SeniorPass:
            return DiscountType(food: 10, merchandise: 10)
        case .VipPass, .SeasonPass:
            return DiscountType(food: 10, merchandise: 20)
        case .EmployeeFoodServicesPass, .EmployeeMaintenancePass , .EmployeeRideServicesPass:
            return DiscountType(food: 15, merchandise: 25)
        case .ManagerPass:
            return DiscountType(food: 25, merchandise: 25)
        }
    }
    
    init(typeOfPass: TypeOfPasses) {
        self.typeOfPass = typeOfPass
        
    }
}
