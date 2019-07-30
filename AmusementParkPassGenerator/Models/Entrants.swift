//
//  Entrants.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/14/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation

//          Entrants files
protocol Entrants {
    var entrantsType: TypeOfEntrants { get }
    var entrantsPass: Passes! { get set }
    var areaAccess: [AreaAccess] { get }
}

enum TypeOfEntrants {
    case ClassicEntrant
    case VipEntrant
    case ChildrenEntrant
    case SeniorEntrant
    case SeasonEntrant
    
    case EmployeeFoodServicesEntrant
    case EmployeeRideServicesEntrant
    case EmployeeMaintenanceEntrant
    case ManagerEntrant
    
    case ContractEmployeeEntrant
    case VendorEntrant
    
}
