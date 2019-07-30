//
//  TestCases.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/15/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation


//class TestCases {
    /*
    static func ClassicGuestTest() {
        print("Test Case for ClassicGuest: No personal information required            \n")
        print("Case: According to the bussiness rules matrix: \n")
        
        let guest1 = ClassicGuest()
        
        print(guest1.entrantsPass?.areaAccess as Any)
        print(guest1.entrantsPass?.rideAccess as Any)
        print(guest1.entrantsPass?.typeOfPass as Any)
        print(guest1.entrantsPass?.discountAccessFor.food as Any)
        print(guest1.entrantsPass?.discountAccessFor.merchandise as Any)
    }
    
    static func VipGuestTest() {
        print("Test Case for ClassicGuest: No personal information required            \n")
        print("Case: According to the bussiness rules matrix: \n")
        
        let guest1 = VipGuest()
        
        print(guest1.entrantsPass?.areaAccess as Any)
        print(guest1.entrantsPass?.rideAccess as Any)
        print(guest1.entrantsPass?.typeOfPass as Any)
        print(guest1.entrantsPass?.discountAccessFor.food as Any)
        print(guest1.entrantsPass?.discountAccessFor.merchandise as Any)
    }
    
    static func ChildrenGuestTest() {
        print("Test Case for ChildrenGuest: Required - Date of Birth            \n")
        print("Case: given Date under 5 years old: \n")
        
        
        do {
            let birthday1 = Date.dateFromString(value: "11/22/2017")
            let guest3 = try ChildrenGuest(dateOfBirth: (birthday1)!)
            print(guest3.entrantsPass?.areaAccess as Any)
            print(guest3.entrantsPass?.rideAccess as Any)
            print(guest3.entrantsPass?.typeOfPass as Any)
            print(guest3.entrantsPass?.discountAccessFor.merchandise as Any)
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("*********************************************")
        
        print("\nCase: given Date is nil or .none: \n")
        
        do {
            let guest3 = try ChildrenGuest(dateOfBirth: .none)
            print(guest3.entrantsPass?.areaAccess as Any)
            print(guest3.entrantsPass?.rideAccess as Any)
            print(guest3.entrantsPass?.typeOfPass as Any)
            print(guest3.entrantsPass?.discountAccessFor.merchandise as Any)
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("*********************************************")
        
        print("\nCase: given Date over 5 years old \n")
        
        do {
            let birthday = Date.dateFromString(value: "11/22/2007")
            let guest3 = try ChildrenGuest(dateOfBirth: birthday)
            print(guest3.entrantsPass?.areaAccess as Any)
            print(guest3.entrantsPass?.rideAccess as Any)
            print(guest3.entrantsPass?.typeOfPass as Any)
            print(guest3.entrantsPass?.discountAccessFor.merchandise as Any)
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("*********************************************")
        
        print("\nCase: given Date is the Birthday \n")
        
        do {
            
            let guest3 = try ChildrenGuest(dateOfBirth: Date())
            print(guest3.entrantsPass?.areaAccess as Any)
            print(guest3.entrantsPass?.rideAccess as Any)
            print(guest3.entrantsPass?.typeOfPass as Any)
            print(guest3.entrantsPass?.discountAccessFor.merchandise as Any)
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("*********************************************")
        
        print("\nCase: given Date in the future \n")
        
        do {
            let birthday = Date.dateFromString(value: "11/22/2019")
            let guest3 = try ChildrenGuest(dateOfBirth: birthday)
            print(guest3.entrantsPass?.areaAccess as Any)
            print(guest3.entrantsPass?.rideAccess as Any)
            print(guest3.entrantsPass?.typeOfPass as Any)
            print(guest3.entrantsPass?.discountAccessFor.merchandise as Any)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    static func ServiceFoodEmployeeTest() {
        print("Test Case for ourly Employee - Food Services: Required - First Name, Last Name, Street Address, City, State, Zip Code \n")
        print("Case: Employee Food Services\n")
        print("#1: Create with all requirements")
        do {
            let guest4 = try EmployeeFoodServices(firstName: "Henry", lastName: "Trinh", streetName: "419 S HIGH", city: "Longview", state: "Texas", zipCode: "75601")
            print(guest4.entrantsPass?.areaAccess as Any)
            print(guest4.entrantsPass?.rideAccess as Any)
            print(guest4.entrantsPass?.typeOfPass as Any)
            print(guest4.entrantsPass?.discountAccessFor.merchandise as Any)
            print(guest4.entrantsPass?.discountAccessFor.food as Any)
            print(guest4.streetName as Any)
            print(guest4.city as Any)
            print(guest4.state as Any)
            print(guest4.zipCode as Any)
            print(guest4.lastName as Any)
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("\n#2: Create with missing First Name (Empty String with lots of white space)")
        do {
            _ = try EmployeeFoodServices(firstName: "      ", lastName: "Trinh", streetName: "419 S HIGH", city: "Longview", state: "Texas", zipCode: "75601")
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("\n#3: Create with missing Last Name (with empty String)")
        do {
            _ = try EmployeeFoodServices(firstName: "Henry", lastName: "", streetName: "419 S HIGH", city: "Longview", state: "Texas", zipCode: "75601")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    static func ServiceRideEmployeeTest() {
        print("Case: Employee Ride Services \n")
        print("#4: Create with all requirements")
        do {
            let guest4 = try EmployeeRideServices(firstName: "Henry", lastName: "Trinh", streetName: "419 S HIGH", city: "Longview", state: "Texas", zipCode: "75601")
            print(guest4.entrantsPass?.areaAccess as Any)
            print(guest4.entrantsPass?.rideAccess as Any)
            print(guest4.entrantsPass?.typeOfPass as Any)
            print(guest4.entrantsPass?.discountAccessFor.merchandise as Any)
            print(guest4.entrantsPass?.discountAccessFor.food as Any)
            print(guest4.streetName as Any)
            print(guest4.city as Any)
            print(guest4.state as Any)
            print(guest4.zipCode as Any)
            print(guest4.lastName as Any)
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("\n#5: Create with missing Street Name (with white spaces)")
        do {
            _ = try EmployeeRideServices(firstName: "Henry", lastName: "Trinh", streetName: "  ", city: "Longview" , state: "Texas", zipCode: "75601")
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("\n#6: Create with missing City (with white spaces)")
        do {
            _ = try EmployeeRideServices(firstName: "Henry", lastName: "Trinh", streetName: "419 S High", city: " " , state: "Texas", zipCode: "75601")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    static func ServiceMaintenanceEmployeeTest() {
        print("Case: Employee Maintenance Services \n")
        print("#7: Create with all requirements")
        do {
            let guest4 = try EmployeeMaintenanceServices(firstName: "Henry", lastName: "Trinh", streetName: "419 S HIGH", city: "Longview", state: "Texas", zipCode: "75601")
          //  print(guest4.entrantsPass?.areaAccess as Any)
            print(guest4.entrantsPass?.rideAccess as Any)
            print(guest4.entrantsPass?.typeOfPass as Any)
            print(guest4.entrantsPass?.discountAccessFor.merchandise as Any)
            print(guest4.entrantsPass?.discountAccessFor.food as Any)
            
            print(guest4.streetName as Any)
            print(guest4.city as Any)
            print(guest4.state as Any)
            print(guest4.zipCode as Any)
            print(guest4.lastName as Any)
        } catch let error {
            print(error.localizedDescription)
        }
        
        
        print("\n#8: Create with missing Zip Code (with empty string)")
        do {
            _ = try EmployeeMaintenanceServices(firstName: "Henry", lastName: "Trinh", streetName: "419 S HIGH", city: "Longview" , state: "Texas", zipCode: "")
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("\n#9: Create with missing State (with empty string)")
        do {
            _ = try EmployeeMaintenanceServices(firstName: "Henry", lastName: "Trinh", streetName: "419 S HIGH", city: "Longview" , state: " ", zipCode: "75601")
        } catch let error {
            print(error.localizedDescription)
        }

    }
    
    static func ManagerTest() {
        print("Case: Manager \n")
        print("#10: Create with all requirements")
        do {
            let guest4 = try Manager(firstName: "Henry", lastName: "Trinh", streetName: "419 S HIGH", city: "Longview", state: "Texas", zipCode: "75601")
            //print(guest4.entrantsPass?.areaAccess as Any)
            print(guest4.entrantsPass?.rideAccess as Any)
            print(guest4.entrantsPass?.typeOfPass as Any)
            print(guest4.entrantsPass?.discountAccessFor.merchandise as Any)
            print(guest4.entrantsPass?.discountAccessFor.food as Any)
            print(guest4.streetName as Any)
            print(guest4.city as Any)
            print(guest4.state as Any)
            print(guest4.zipCode as Any)
            print(guest4.lastName as Any)
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("\n#11: Create with wrong format for zipCode (with more than 5 digits)")
        do {
            _ = try Manager(firstName: "Henry", lastName: "Trinh", streetName: "419 S HIGH", city: "Longview" , state: "Texas", zipCode: "7560100000")
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("\n#12: Create with wrong format for zipCode (with less than 5 digits)")
        do {
            _ = try Manager(firstName: "Henry", lastName: "Trinh", streetName: "419 S HIGH", city: "Longview" , state: "Texas", zipCode: "756")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    static func doubleSwipeCheck(second: Int) {
        let guest1 = ClassicGuest()
        Swipe.swipping(entrants: guest1, atRide: .AccessAllRides)
        
        sleep(UInt32(second))
        
        Swipe.swipping(entrants: guest1, atRide: .AccessAllRides)
        print(Swipe.isSwippedTwice(entrant: guest1))
    }
    */
    
    
   /* static func ContractoCheck() {
        do {
            let entrant = try ContractEmployee(firstName: "Henry", lastName: "lastNameString", streetName: "a", city: "a", state: "stateString", zipCode: "77777", projectNumber: "1")
            
            print(entrant.areaAccess as Any)
            print(entrant.entrantsPass?.rideAccess as Any)
            print(entrant.entrantsPass?.typeOfPass as Any)
            print(entrant.entrantsPass?.discountAccessFor.merchandise as Any)
            print(entrant.entrantsPass?.discountAccessFor.food as Any)
            print(entrant.firstName as Any)
            print(entrant.lastName as Any)
            print(entrant.streetName as Any)
            print(entrant.city as Any)
            print(entrant.state as Any)
            print(entrant.zipCode as Any)
            print(entrant.lastName as Any)
        }  catch let error {
            print(error.localizedDescription)
        }
 
    }
*/
//    static func populateTest() {
//        print(PopulateDate.givenFirstName())
//    }
//
//    static func doubleSwipeCheck(second: Int) {
//        let guest1 = ClassicGuest()
//        Swipe.swiping(entrants: guest1, atArea: .KitchenAreas)
//
//        sleep(UInt32(6))
//
//        Swipe.swiping(entrants: guest1, atArea: .KitchenAreas)
//        print(Swipe.isSwippedTwice(entrant: guest1))
//    }
//
//}
