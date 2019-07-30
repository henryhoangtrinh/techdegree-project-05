//
//  Extension.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/15/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation

//      Some random protocol
// For Children

var mySound = SoundManager()

protocol Age {
    var dateOfBirth: Date? { get }
}

// For Employee
protocol Namable {
    var firstName: String? { get }
    var lastName: String? { get }
}

protocol Address {
    var streetName: String? { get }
    var city: String? { get }
    var state: String? { get }
    var zipCode: String? { get }
}

extension Date {
    static func dateFromString(value: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: value )
        return date
    }
}
// Creadit ->  https://stackoverflow.com/questions/24089999/how-do-you-create-a-swift-date-object (TimeFormatter)

extension Entrants {
    
    func dateOfBirthCheck(date : Date?) throws {
        
        guard let dateOfBirth = date else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.invalidDateOfBirth
        }
        
        let now = Date()
        let age = Calendar.current.dateComponents([.year, .month, .day], from: dateOfBirth, to: now)
        
        if let year = age.year, let month = age.month, let day = age.day {
            if day < 0 {
                mySound.loadDeniedSound()
                mySound.playGameSound()
                throw ParkErrors.notBornYet
            } else if month == 0 && day == 0 && year == 5 {
                mySound.loadDeniedSound()
                mySound.playGameSound()
                throw ParkErrors.happyBirthDay
            } else if year >= 5 {
                mySound.loadDeniedSound()
                mySound.playGameSound()
                throw ParkErrors.exceedAge
            }
        }
    }
    
    

    func SeniorAgeCheck(date: Date?) throws {
        
        guard let dateOfBirth = date else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.invalidDateOfBirth
        }
        
        let now = Date()
        let age = Calendar.current.dateComponents([.year], from: dateOfBirth, to: now)
        
        if let year = age.year {
            if year < 65 {
                mySound.loadDeniedSound()
                mySound.playGameSound()
                throw ParkErrors.tooYoungforSeniorPass
            }
        }
    }
    
    func BirthdayCheck(date: Date?) -> String {
        
       let dateOfBirth = date 
        var greeting = String()
        let now = Date()
        let age = Calendar.current.dateComponents([ .year, .month, .day], from: dateOfBirth!, to: now)
        if let day = age.day, let month = age.month{
            if day == 0 && month == 0 {
               
               greeting = "Happy Bithday"
            } else {
              
              greeting = ""
            }
        }
        return greeting
    }
    
 
 
    func nameCheck(firstName: String?, lastName: String?) throws {
        guard let firstname = firstName, ((firstname.trimmingCharacters(in: .whitespaces)) != "") else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.invalidFirstName
        }
        
        guard let lastname = lastName, ((lastname.trimmingCharacters(in: .whitespaces)) != "") else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.invalidLastName
        }
    }
    
    func addressCheck(streetName: String?, city: String?, state: String?, zipCode: String?) throws {
        
        guard let streetname = streetName, ((streetname.trimmingCharacters(in: .whitespaces)) != "") else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.invalidStreetName
        }
        
        guard let cityname = city, ((cityname.trimmingCharacters(in: .whitespaces)) != "") else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.invalidCity
        }
        
        guard let statename = state, ((statename.trimmingCharacters(in: .whitespaces)) != "") else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.invalidState
        }
        
        guard let zipcode = zipCode, ((zipcode.trimmingCharacters(in: .whitespaces)) != ""), (zipcode.count == 5) else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw  ParkErrors.invalidZipCode
        }
    }
    
    func projectCheck(projectNumber: String?) throws {
        guard let projectnumber = projectNumber, ((projectnumber.trimmingCharacters(in: .whitespaces)) != ""), (projectnumber.count == 4) else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw  ParkErrors.invalidProjectNumber
        }
        
        if projectnumber == "1001" {
            print("Welcome Contractor 1001")
        } else if projectnumber == "1002" {
            print("Welcome Contractor 1002")
        } else if projectnumber == "1003" {
            print("Welcome Contractor 1003")
        } else if projectnumber == "2001" {
            print("Welcome Contractor 2001")
        } else if projectnumber == "2002" {
            print("Welcome Contractor 2002")
       
        }else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.wrongProjectNumber
        }
    }
    
    func companyCheck(companyName: String?) throws {
        guard let companyname = companyName, ((companyname.trimmingCharacters(in: .whitespaces)) != "") else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw  ParkErrors.invalidVendor
        }
        
        if companyname == "Acme" {
            print("Thanks for your helps,\(companyname)")
        } else if companyname == "Orkin" {
            print("Thanks for your helps,\(companyname)")
        } else if companyname == "Fedex" {
            print("Thanks for your helps,\(companyname)")
        } else if companyname == "NWElectrical" {
            print("Thanks for your helps,\(companyname)")
        } else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.wrongVendorName
        }
        
    }
    
    func serviceDateCheck(time: Date?) throws {
        guard let dateOfBirth = time else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.invalidDateOfService
        }
    }
    
    func EmployeeBirthDayCheck(date: Date?) throws {
        guard let dateOfBirth = date else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            throw ParkErrors.invalidDateOfBirth
        }
    }
}

