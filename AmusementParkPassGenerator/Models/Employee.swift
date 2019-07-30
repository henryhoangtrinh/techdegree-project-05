//
//  Employee.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/15/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation

protocol Employee: Namable, Address, Entrants {}


class EmployeeFoodServices : Employee {
    var areaAccess: [AreaAccess] = [.AmusementAreas, .KitchenAreas]
    
    var streetName: String?
    
    var city: String?
    
    var state: String?
    
    var zipCode: String?
    
    var firstName: String?
    
    var lastName: String?
    
    var entrantsPass: Passes! = EmployeeFoodServicesPass()
    
    var entrantsType: TypeOfEntrants = .EmployeeFoodServicesEntrant
    
    init(firstName: String, lastName: String, streetName: String, city: String, state: String ,zipCode: String) throws {
        self.firstName = firstName
        self.lastName = lastName
        self.streetName = streetName
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
        try nameCheck(firstName: firstName, lastName: lastName)
        
        try addressCheck(streetName: streetName, city: city, state: state, zipCode: zipCode)
        
    }
}

class EmployeeRideServices : Employee {
    var areaAccess: [AreaAccess] = [.AmusementAreas, .RideControlAreas]
    
    var streetName: String?
    
    var city: String?
    
    var state: String?
    
    var zipCode: String?
    
    var firstName: String?
    
    var lastName: String?
    
    var entrantsPass: Passes! = EmployeeRideServicesPass()
    
    var entrantsType: TypeOfEntrants = .EmployeeRideServicesEntrant
    
    init(firstName: String?, lastName: String?, streetName: String?, city: String?, state: String? ,zipCode: String?) throws {
        self.firstName = firstName
        self.lastName = lastName
        self.streetName = streetName
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
        try nameCheck(firstName: firstName, lastName: lastName)
        
        try addressCheck(streetName: streetName, city: city, state: state, zipCode: zipCode)
        
    }
}

class EmployeeMaintenanceServices : Employee {
    var areaAccess: [AreaAccess] = [.AmusementAreas, .KitchenAreas, .RideControlAreas, .MaintenanceAreas]
    
    var streetName: String?
    
    var city: String?
    
    var state: String?
    
    var zipCode: String?
    
    var firstName: String?
    
    var lastName: String?
    
    var entrantsPass: Passes! = EmployeeMaintenacePass()
    
    var entrantsType: TypeOfEntrants = .EmployeeMaintenanceEntrant
    
    init(firstName: String, lastName: String, streetName: String, city: String, state: String ,zipCode: String) throws {
        self.firstName = firstName
        self.lastName = lastName
        self.streetName = streetName
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
        try nameCheck(firstName: firstName, lastName: lastName)
        
        try addressCheck(streetName: streetName, city: city, state: state, zipCode: zipCode)
        
    }
}

class Manager : Employee {
    var areaAccess: [AreaAccess] = [.AmusementAreas, .KitchenAreas , .MaintenanceAreas, .OfficeAreas, .RideControlAreas]
    
    
    var streetName: String?
    
    var city: String?
    
    var state: String?
    
    var zipCode: String?
    
    var firstName: String?
    
    var lastName: String?
    
    var entrantsPass: Passes! = ManagerPass()
    
    var entrantsType: TypeOfEntrants = .ManagerEntrant
    
    init(firstName: String, lastName: String, streetName: String, city: String, state: String ,zipCode: String) throws {
        self.firstName = firstName
        self.lastName = lastName
        self.streetName = streetName
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
        try nameCheck(firstName: firstName, lastName: lastName)
        
        try addressCheck(streetName: streetName, city: city, state: state, zipCode: zipCode)
        
    }
}
/////////////////////////////////////////


//MARK: Contract Employee

enum ProjectNumber: String {
    case project1001 = "1001"
    case project1002 = "1002"
    case project1003 = "1003"
    
    case project2001 = "2001"
    case project2002 = "2002"
}

class ContractEmployee : Employee, ProjectID {
    
    
    var areaAccess: [AreaAccess] {
        switch self.projectNumber {
        case .project1001?:
            return [.AmusementAreas, .RideControlAreas]
        case .project1002?:
             return [.AmusementAreas, .MaintenanceAreas, .RideControlAreas]
        case .project1003?:
             return [.AmusementAreas, .KitchenAreas , .MaintenanceAreas, .OfficeAreas, .RideControlAreas]
        case .project2001?:
             return [ .OfficeAreas]
        case .project2002?:
             return [ .KitchenAreas , .MaintenanceAreas]
        case .none:
            return []
        }
    }
    
    var projectNumber: ProjectNumber?
    
    var firstName: String?
    
    var lastName: String?
    
    var streetName: String?
    
    var city: String?
    
    var state: String?
    
    var zipCode: String?
    
    var entrantsType: TypeOfEntrants = .ContractEmployeeEntrant
    
    var entrantsPass: Passes! = ContractEmployeePass()
    
    init(firstName: String, lastName: String, streetName: String, city: String, state: String ,zipCode: String, projectNumber: String) throws {
        self.firstName = firstName
        self.lastName = lastName
        self.streetName = streetName
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.projectNumber = ProjectNumber(rawValue: projectNumber)
        
        
        try projectCheck(projectNumber: projectNumber)
        try nameCheck(firstName: firstName, lastName: lastName)
        
        try addressCheck(streetName: streetName, city: city, state: state, zipCode: zipCode)
        
    }
}


// MARK : Vendor

