//
//  CreateNewPassController.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/24/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import UIKit

class CreateNewPassController: UIViewController {

    var entrant: Entrants?
    
    
    // Labels
        
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var PassLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var allRidesAccess: UILabel!
    @IBOutlet weak var skipLinesAccess: UILabel!
    @IBOutlet weak var SwipeResultText: UILabel!
    @IBOutlet weak var happybithdaylabel: UILabel!
    
    
    //Buttons
    
    @IBOutlet weak var AreaAccessButton: UIButton!
    @IBOutlet weak var RideAccessButton: UIButton!
    @IBOutlet weak var DiscountAccessButton: UIButton!
    
    
    
    //Stacks
    @IBOutlet weak var discountStacks: UIStackView!
    @IBOutlet weak var AreaStacks: UIStackView!
    @IBOutlet weak var discountPercentStacks: UIStackView!
    @IBOutlet weak var RideStacks: UIStackView!
    
    @IBOutlet weak var discountMerchStacks: UIStackView!
    // View
    
    @IBOutlet weak var SwipeResult: UIView!
    
    
    // Variables
    var firstName: String? = ""
    var lastName: String? = ""
    var fullName: String? = ""
    var company: String? = ""
    var merchDiscount: String? = ""
    var foodDiscount: String? = ""
    var dob: String? = ""
    var swipe = Swipe()
    var buttonPressed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNewEntrant()
      
        updatePassInfo()
        
        disableStacks()
        
        updateBirthdayText()
        
        updateNavigationBarLabel()
        
        mySound.loadGrantedSound()
        mySound.playGameSound()

    }
    
    func updateNewEntrant() {
       
        if !(firstName == "") && !(lastName == "") {
        fullName = "\(firstName!) \(lastName!)"
        } else {
            fullName = "New Entrant"
        }
        nameLabel.text = fullName
        companyLabel.text = "\(company!)"
        merchDiscountLabel.text = "\(entrant?.entrantsPass?.discountAccessFor.merchandise as AnyObject)% Merchandise Discount"
        foodDiscountLabel.text = "\(entrant?.entrantsPass?.discountAccessFor.food as AnyObject)% Food Discount"
        
        
        print(fullName as AnyObject)
        print("\(entrant?.entrantsPass?.discountAccessFor.merchandise as AnyObject)% Merchandise Discount")
        print("\(entrant?.entrantsPass?.discountAccessFor.food as AnyObject)% Food Discount")
    }
    

    
    func updateBirthdayText() {
       
        guard let birthdaycheck = dob else {
            return
        }
       
        let birthday = Date.dateFromString(value: birthdaycheck)
       
        if birthdaycheck != "" {
      
            happybithdaylabel.text = entrant?.BirthdayCheck(date: birthday)
        } else {
             happybithdaylabel.text = ""
        }
    }
    
    func updatePassInfo() {
        guard let pass = entrant?.entrantsPass else { return }
        PassLabel.text = pass.typeOfPass.rawValue
        
        if pass.rideAccess[0].rawValue != "" {
            allRidesAccess.text = pass.rideAccess[0].rawValue
        } else {
            allRidesAccess.text = ""
        }
        
        if pass.rideAccess[1].rawValue != "" {
            skipLinesAccess.text = pass.rideAccess[1].rawValue
        } else {
            skipLinesAccess.text = ""
        }
        
        print(pass.typeOfPass.rawValue)
        print(pass.rideAccess[0].rawValue)
        print(pass.rideAccess[1].rawValue)
        print(entrant?.areaAccess as Any)
    }

    func updateNavigationBarLabel() {
        let titleLabel = UILabel()
        titleLabel.text = "Create New Pass"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        navigationItem.titleView = titleLabel
    }

    func disableStacks() {
        AreaStacks.isHidden = true
        RideStacks.isHidden = true
        discountStacks.isHidden = true
        discountPercentStacks.isHidden = true
        discountMerchStacks.isHidden = true
    }
    
    func swipeCheckDouble() {
        do {
          let check =  try Swipe.isSwippedTwice(entrant: entrant!)
    
            SwipeResultText.text = "\(check.showResult())"
            entrant?.entrantsPass.lastSwipe = Date()
            
        } catch let error {
            showAlert(title: "Error", message: error.localizedDescription)
        }
    }
    
    func swipeAreaCheck(for AreaAccess: AreaAccess) {
        let area =  Swipe.swiping(entrants: entrant!, atArea: AreaAccess)

        SwipeResult.backgroundColor = area.showColor()
        SwipeResultText.text = "\(area.showResult()) Access "
    }
    
    
    func swipeRideCheck(for RideAccess: RideAccess) {
        let area =  Swipe.swipping(entrants: entrant!,atRide: RideAccess)
 
        SwipeResult.backgroundColor = area.showColor()
        SwipeResultText.text = "\(area.showResult()) Access "
    }
    
    func swipeFoodDiscountCheck( percent: Int) {
        let discount = Swipe.swippingFor(FoodDiscount: percent, from: entrant!)
        SwipeResult.backgroundColor = discount.showColor()
        SwipeResultText.text = "\(discount.showResult()) Discount Access "
    }
    
    func swipeMerchDiscountCheck( percent: Int) {
        let discount = Swipe.swippingFor(MerchandisDiscount: percent, from: entrant!)
        SwipeResult.backgroundColor = discount.showColor()
        SwipeResultText.text = "\(discount.showResult()) Discount Access "
    }
    
    @IBAction func AreaAccess(_ sender: UIButton) {
        AreaStacks.isHidden = false
        RideStacks.isHidden = true
        discountStacks.isHidden = true
        discountPercentStacks.isHidden = true
        discountMerchStacks.isHidden = true
    }
    
    @IBAction func RideAccess(_ sender: UIButton) {
        AreaStacks.isHidden = true
        RideStacks.isHidden = false
        discountStacks.isHidden = true
        discountPercentStacks.isHidden = true
        discountMerchStacks.isHidden = true
    }
    
    @IBAction func DiscountAccess(_ sender: UIButton) {
        AreaStacks.isHidden = true
        RideStacks.isHidden = true
        discountStacks.isHidden = false
        discountPercentStacks.isHidden = true
        discountMerchStacks.isHidden = true
    }
    
    @IBAction func FoodPercent(_ sender: UIButton) {
        AreaStacks.isHidden = true
        RideStacks.isHidden = true
        discountStacks.isHidden = true
        discountPercentStacks.isHidden = false
        discountMerchStacks.isHidden = true
    }
    
    @IBAction func MerchandisePercent(_ sender: UIButton) {
        AreaStacks.isHidden = true
        RideStacks.isHidden = true
        discountStacks.isHidden = true
        discountPercentStacks.isHidden = true
        discountMerchStacks.isHidden = false
    }
    
    // MARK: AREA ACCESS CHECK
    @IBAction func Amusement(_ sender: UIButton) {
      
        if sender.currentTitle == "Amusement"  {

            if !(buttonPressed == 0) {
                swipeAreaCheck(for: .AmusementAreas)
                swipeCheckDouble()
                buttonPressed = 0
             
            } else if (buttonPressed == 0) {
               
                swipeAreaCheck(for: .AmusementAreas)
                buttonPressed += 1

            }
        } else {
            buttonPressed = 0

        }
    }
    
    
    @IBAction func Kitchen(_ sender: UIButton) {

        if sender.currentTitle == "Kitchen" {

            if !(buttonPressed == 0) {
                swipeAreaCheck(for: .KitchenAreas)
                swipeCheckDouble()
                buttonPressed = 0
            } else if (buttonPressed == 0) {
                swipeAreaCheck(for: .KitchenAreas)
                buttonPressed += 1
            }
        } else {
            buttonPressed = 0
        }
    }
    
    @IBAction func RideControl(_ sender: UIButton) {
        if sender.currentTitle == "Ride Control"  {
            
            if !(buttonPressed == 0) {
                
                swipeAreaCheck(for: .RideControlAreas)
                swipeCheckDouble()
                buttonPressed = 0
               
            } else if (buttonPressed == 0) {
               
                swipeAreaCheck(for: .RideControlAreas)
                buttonPressed += 1
               
            }
        } else {
            buttonPressed = 0
           
        }
    }
    
    @IBAction func Maintenance(_ sender: UIButton) {
        if sender.currentTitle == "Maintenance"  {
            
            if !(buttonPressed == 0) {
                
                swipeAreaCheck(for: .MaintenanceAreas)
                swipeCheckDouble()
                buttonPressed = 0
                
            } else if (buttonPressed == 0) {
               
                swipeAreaCheck(for: .MaintenanceAreas)
                buttonPressed += 1
           
            }
        } else {
            buttonPressed = 0
        }
    }
    
    @IBAction func Office(_ sender: UIButton) {
        if sender.currentTitle == "Office"  {
            
            if !(buttonPressed == 0) {
                swipeAreaCheck(for: .OfficeAreas)
                swipeCheckDouble()
                buttonPressed = 0
            } else if (buttonPressed == 0) {
                swipeAreaCheck(for: .OfficeAreas)
                buttonPressed += 1
            }
        } else {
            buttonPressed = 0
        }
    }
    
    
    //MARK: RIDE ACCESS CHECK
    @IBAction func AllRideAccess(_ sender: UIButton) {
        if sender.currentTitle == "All Rides Access"  {
            
            if !(buttonPressed == 0) {
                swipeRideCheck(for: .SkipAllRideLines)
                swipeCheckDouble()
                buttonPressed = 0
            } else if (buttonPressed == 0) {
                swipeRideCheck(for: .AccessAllRides)
                buttonPressed += 1
            }
        } else {
            buttonPressed = 0
        }
    }

    
    @IBAction func SkipLinesAccess(_ sender: UIButton) {
        if sender.currentTitle == "Skip Lines Access"  {
            
            if !(buttonPressed == 0) {
                swipeRideCheck(for: .SkipAllRideLines)
                swipeCheckDouble()
                buttonPressed = 0
            } else if (buttonPressed == 0) {
                swipeRideCheck(for: .SkipAllRideLines)
                buttonPressed += 1
            }
        } else {
            buttonPressed = 0
        }
    }
  
    
    @IBAction func FoodDiscountAccess(_ sender: UIButton) {
            if !(buttonPressed == 0) {
                DiscountCheck(percent: sender.currentTitle!)
                swipeCheckDouble()
                buttonPressed = 0
            } else if (buttonPressed == 0) {
                DiscountCheck(percent: sender.currentTitle!)
                buttonPressed += 1
            }
    }
    
    
    @IBAction func MerchandiseDiscountAccess(_ sender: UIButton) {
        
        if !(buttonPressed == 0) {
            DiscountMerchCheck(percent: sender.currentTitle!)
            swipeCheckDouble()
            buttonPressed = 0
        } else if (buttonPressed == 0) {

            DiscountMerchCheck(percent: sender.currentTitle!)
            buttonPressed += 1
        }
    }
    
    
    
    
    func DiscountCheck(percent: String) {
        switch percent {
        case "0%":
            swipeFoodDiscountCheck(percent: 0)
        case "10%":
            swipeFoodDiscountCheck(percent: 10)
        case "15%":
            swipeFoodDiscountCheck(percent: 15)
        case "20%":
            swipeFoodDiscountCheck(percent: 20)
        case "25%":
            swipeFoodDiscountCheck(percent: 25)
        default:
            break
            
        }
    }
    
    func DiscountMerchCheck(percent: String) {
        switch percent {
        case "0%":
            swipeMerchDiscountCheck(percent: 0)
        case "10%":
            swipeMerchDiscountCheck(percent: 10)
        case "15%":
            swipeMerchDiscountCheck(percent: 15)
        case "20%":
            swipeMerchDiscountCheck(percent: 20)
        case "25%":
            swipeMerchDiscountCheck(percent: 25)
        default:
            break
            
        }
    }
    
    func showAlert(title: String, message: String){
        //If an alert is shown and the segue status is true then the "Continue" option will show.
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        
            //if not an error needs to be addressed by the user
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        //Must present the alert for the user to view it.
        self.present(alert, animated: true)
    }
    
    
    
}




