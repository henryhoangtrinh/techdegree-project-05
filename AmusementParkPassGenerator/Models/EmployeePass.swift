//
//  EmployeePass.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/15/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation

/*           Passes for Employee           */

class EmployeePass : Passes {
    override init(typeOfPass: TypeOfPasses) {
        super.init(typeOfPass: typeOfPass)
    }
}

class EmployeeFoodServicesPass : EmployeePass {
    init() {
        super.init(typeOfPass: .EmployeeFoodServicesPass)
    }
}

class EmployeeRideServicesPass : EmployeePass {
    init() {
        super.init(typeOfPass: .EmployeeRideServicesPass)
    }
}

class EmployeeMaintenacePass : EmployeePass {
    init() {
        super.init(typeOfPass: .EmployeeMaintenancePass)
    }
}

class ManagerPass : EmployeePass {
    init() {
        super.init(typeOfPass: .ManagerPass)
    }
}

class ContractEmployeePass : EmployeePass {
    init() {
        super.init(typeOfPass: .ContractEmployeePass)
    }
}

class VendorPass : EmployeePass {
    init() {
        super.init(typeOfPass: .VendorPass)
    }
}
