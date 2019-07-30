//
//  Swipe.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/15/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation





// Swipping Method
struct Swipe {
    static func swiping(entrants: Entrants, atArea: AreaAccess) -> SwipeResult {
        
        var result: SwipeResult
        if (entrants.areaAccess.contains(atArea)) {
            mySound.loadGrantedSound()
            mySound.playGameSound()
            result = .valid
        } else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            
            result = .deny
        }
        return result
    }
    
    
    
    static func swipping(entrants: Entrants,atRide: RideAccess) -> SwipeResult {
        var result: SwipeResult
        
        switch atRide {
        case .AccessAllRides:
           if (entrants.entrantsPass?.rideAccess.contains(atRide))!{
            mySound.loadGrantedSound()
            mySound.playGameSound()
            result = .valid
           } else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            
            result = .deny
            }
        case .SkipAllRideLines:
            if (entrants.entrantsPass?.rideAccess.contains(atRide))!{
                mySound.loadGrantedSound()
                mySound.playGameSound()
                result = .valid
            } else {
                mySound.loadDeniedSound()
                mySound.playGameSound()
                
                result = .deny
            }
        case .NoRidesAccess:
            if (entrants.entrantsPass?.rideAccess.contains(atRide))!{
                mySound.loadGrantedSound()
                mySound.playGameSound()
                result = .valid
            } else {
                mySound.loadDeniedSound()
                mySound.playGameSound()
                
                result = .deny
            }
        case .NoSkipLinesAcess:
            if (entrants.entrantsPass?.rideAccess.contains(atRide))!{
                mySound.loadGrantedSound()
                mySound.playGameSound()
                result = .valid
            } else {
                mySound.loadDeniedSound()
                mySound.playGameSound()
                
                result = .deny
            }
        }
        return result
    }
    
    
    static func swippingFor(FoodDiscount: Int, from entrants: Entrants) -> SwipeResult {
        var result: SwipeResult
        if entrants.entrantsPass?.discountAccessFor.food == FoodDiscount {
            mySound.loadGrantedSound()
            mySound.playGameSound()
            result = .valid
        } else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            
            result = .deny
        }
        return result
    }
    
    static func swippingFor(MerchandisDiscount: Int, from entrants: Entrants)  -> SwipeResult {
        var result: SwipeResult
        if entrants.entrantsPass?.discountAccessFor.merchandise == MerchandisDiscount {
            mySound.loadGrantedSound()
            mySound.playGameSound()
            result = .valid
        } else {
            mySound.loadDeniedSound()
            mySound.playGameSound()
            
            result = .deny
        }
        return result
    }
    
    
    static func isSwippedTwice(entrant: Entrants) throws -> SwipeResult {
        let currentSwipe = Date()
        var result: SwipeResult
        
        if let previousSwipe = entrant.entrantsPass?.lastSwipe {
                let swipeTime = Int(currentSwipe.timeIntervalSince(previousSwipe))
                print("you just swipped \(swipeTime)s ago ")
                if swipeTime > 5 {
                
                    entrant.entrantsPass?.lastSwipe = currentSwipe
              
                    result = .valid
                        
                } else {
                   
                    
                    entrant.entrantsPass?.lastSwipe = currentSwipe
                  
                    result = .deny
                    
                    throw ParkErrors.SwippedTwice
                        }
        } else {
                entrant.entrantsPass?.lastSwipe = currentSwipe
                    throw ParkErrors.SwippedTwice
        }
        
        return result
    }
    
}
