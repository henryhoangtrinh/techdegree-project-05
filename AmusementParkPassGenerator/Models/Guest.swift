//
//  Guest.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/15/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation

//          Guest Classes

class ClassicGuest: Entrants {
    var areaAccess: [AreaAccess] = [.AmusementAreas]
    
    var entrantsType: TypeOfEntrants = .ClassicEntrant
    
    var entrantsPass: Passes! = ClassicPass()
    
}


class VipGuest: Entrants {
    var areaAccess: [AreaAccess] = [.AmusementAreas]
    
    var entrantsType: TypeOfEntrants = .VipEntrant
    
    var entrantsPass: Passes! = VipPass()
    
}

class ChildrenGuest: Entrants, Age {
    var areaAccess: [AreaAccess] = [.AmusementAreas]
    
    var entrantsType: TypeOfEntrants = .ChildrenEntrant
    
    var entrantsPass: Passes! = ChildrenPass()
    
    var dateOfBirth: Date? // to check the b-day for requirements
    
    
    
    init(dateOfBirth: Date?) throws {
        self.dateOfBirth = dateOfBirth
        
        try dateOfBirthCheck(date: dateOfBirth)
        
    }
}

class SeniorGuest: Entrants, Age, Namable {
    var areaAccess: [AreaAccess] = [.AmusementAreas]
    
    var entrantsType: TypeOfEntrants = .SeniorEntrant
    
    var entrantsPass: Passes! = SeniorPass()
    
    var dateOfBirth: Date?
    
    var firstName: String?
    
    var lastName: String?
    
    init(dateOfBirth: Date?, firstName: String?, lastName: String?) throws {
        self.dateOfBirth = dateOfBirth
        self.firstName = firstName
        self.lastName = lastName
        
        try SeniorAgeCheck(date: dateOfBirth)
        
        try nameCheck(firstName: firstName, lastName: lastName)
        
    }
}

class SeasonGuest: Entrants,Namable, Address {
    var areaAccess: [AreaAccess] = [.AmusementAreas]
    
    var entrantsType: TypeOfEntrants = .SeasonEntrant
    
    var entrantsPass: Passes! = SeasonPass()
    
    var firstName: String?
    
    var lastName: String?
    
    var streetName: String?
    
    var city: String?
    
    var state: String?
    
    var zipCode: String?
    
    init(firstName: String?, lastName: String?, streetName: String?, city: String?, state: String?, zipCode: String?) throws {
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
