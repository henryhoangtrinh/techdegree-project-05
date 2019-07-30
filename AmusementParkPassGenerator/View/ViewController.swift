//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/14/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables
    var passType: String = ""
    var entrant: Entrants?
    var birthdayString: String = ""
    var firstNameString: String = ""
    var lastNameString: String = ""
    var streetNameString: String = ""
    var cityString: String = ""
    var stateString: String = ""
    var zipcodeString: String = ""
    var dateOfServiceString: String = ""
    var projectnumberString: String!
    var companyString: String!
    
    var isMeetingRequire: Bool = false
    
    // Text Field
    
    @IBOutlet weak var dateOfBirthTF: UITextField!
    @IBOutlet weak var ssnTF: UITextField!
    @IBOutlet weak var projectNumbersTF: UITextField!
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    
    
    @IBOutlet weak var companyTF: UITextField!
    @IBOutlet weak var dateOfServiceTF: UITextField!
    
    
    @IBOutlet weak var streetNameTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var zipCodeTF: UITextField!
    
    // Buttons
    
    @IBOutlet weak var guestButtons: UIButton!
    @IBOutlet weak var employeeButtons: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    @IBOutlet weak var generatePassButton: UIButton!
    
    
    
    
    @IBOutlet weak var ChildButton: UIButton!
    @IBOutlet weak var ClassicButton: UIButton!
    @IBOutlet weak var VIPButton: UIButton!
    @IBOutlet weak var SeniorButton: UIButton!
    @IBOutlet weak var SeasonButton: UIButton!
    
    @IBOutlet weak var FoodServiceButton: UIButton!
    @IBOutlet weak var RideServiceButton: UIButton!
    @IBOutlet weak var MaintenanceButton: UIButton!
    @IBOutlet weak var ContractorButton: UIButton!
    
    
    //Stacks
    
    @IBOutlet weak var guestStacks: UIStackView!
    @IBOutlet weak var employeeStacks: UIStackView!
    
    ///////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guestStacks.isHidden = true
        employeeStacks.isHidden = true
        disableTextField()
        generatePassButton.isEnabled = false
 
        
    }
    
    
    //MARK: Select from the Guest-Employee-Manager-Vendor

    @IBAction func guestSelection(_ sender: UIButton) {
        employeeStacks.isHidden = true
        guestStacks.isHidden = false
    }
    
    
    @IBAction func employeeSelection(_ sender: UIButton) {
        guestStacks.isHidden = true
        employeeStacks.isHidden = false
    }
    
    @IBAction func managerSelection(_ sender: UIButton) {
        guestStacks.isHidden = true
        employeeStacks.isHidden = true
    }
    
    @IBAction func vendorSelection(_ sender: UIButton) {
        guestStacks.isHidden = true
        employeeStacks.isHidden = true
    }
    
    //MARK: Select from Guest selection - Employee selection
    
    
    @IBAction func childPass(_ sender: UIButton) {
        disableTextField()
        AgeEnable()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    @IBAction func classicPass(_ sender: UIButton) {
        disableTextField()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    @IBAction func vipPass(_ sender: UIButton) {
        disableTextField()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    @IBAction func seniorPass(_ sender: UIButton) {
        disableTextField()
        NameEnable()
        AgeEnable()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    @IBAction func seasonPass(_ sender: UIButton) {
        disableTextField()
        NameEnable()
        AddressEnable()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    @IBAction func FoodServiceEmployeePass(_ sender: UIButton) {
        disableTextField()
        NameEnable()
        AddressEnable()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    
    @IBAction func RideServiceEmployeePass(_ sender: UIButton) {
        disableTextField()
        NameEnable()
        AddressEnable()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    @IBAction func Maintenance(_ sender: UIButton) {
        disableTextField()
        NameEnable()
        AddressEnable()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    @IBAction func ContractorPass(_ sender: UIButton) {
        disableTextField()
        NameEnable()
        AddressEnable()
        ProjectEnable()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    
    @IBAction func ManagerPass(_ sender: UIButton) {
        disableTextField()
        NameEnable()
        AddressEnable()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    
    @IBAction func VendorPass(_ sender: UIButton) {
        disableTextField()
        AgeEnable()
        NameEnable()
        CompanyServiceEnable()
        generatePassButton.isEnabled = true
        guard let pass = sender.currentTitle else { return }
        passType = pass
    }
    
    //MARK: Populate Date for random guest
    
    
    @IBAction func populateDate(_ sender: UIButton) {
        
        if dateOfBirthTF.isUserInteractionEnabled {
            dateOfBirthTF.text = PopulateDate.givenDate()
        } else {
            dateOfBirthTF.text = ""
        }
        
        if projectNumbersTF.isUserInteractionEnabled {
            projectNumbersTF.text = PopulateDate.givenPrject()
        }
        
        if firstNameTF.isUserInteractionEnabled {
            firstNameTF.text = PopulateDate.givenFirstName()
        }
        

        if lastNameTF.isUserInteractionEnabled {
            lastNameTF.text = PopulateDate.givenLastName()
        }
        
        if companyTF.isUserInteractionEnabled{
            companyTF.text = PopulateDate.givenVendor()
        }
        
        if dateOfServiceTF.isUserInteractionEnabled {
            dateOfServiceTF.text = PopulateDate.givenDate()
        }
        
        if streetNameTF.isUserInteractionEnabled {
            streetNameTF.text = PopulateDate.givenStreet()
        }
        
        if cityTF.isUserInteractionEnabled {
            cityTF.text = PopulateDate.givenCity()
        }
        
        if stateTF.isUserInteractionEnabled {
            stateTF.text = PopulateDate.givenState()
        }
        
        if zipCodeTF.isUserInteractionEnabled {
            zipCodeTF.text = PopulateDate.givenZipCode()
        }
//
    }
    
    
    //MARK: Generate Pass & Populate Data
    
    
    @IBAction func generatePass(_ sender: UIButton) {
        createPass()
    }
    
    
    func createPass() {

        firstNameString = firstNameTF.text!
        lastNameString = lastNameTF.text!
       
        streetNameString = streetNameTF.text!
        cityString = cityTF.text!
        stateString = stateTF.text!
        zipcodeString = zipCodeTF.text!
        
        companyString = companyTF.text!
        
        projectnumberString = projectNumbersTF.text!
        
        birthdayString = dateOfBirthTF.text!
        let birthday = Date.dateFromString(value: birthdayString )
        
        dateOfServiceString = dateOfServiceTF.text!
        let worktime = Date.dateFromString(value: dateOfServiceString)

        switch passType {
        case "Classic":
             entrant =   ClassicGuest()
             isMeetingRequire = true
        case "VIP":
             entrant =    VipGuest()
             isMeetingRequire = true
        case "Child" :
            do {
             entrant = try ChildrenGuest(dateOfBirth: birthday)
            isMeetingRequire = true
            }catch let error {
                showAlert(title: "Could not create Pass", message: error.localizedDescription)
                
            }
        case "Senior":
            do {
             entrant =  try SeniorGuest(dateOfBirth: birthday, firstName: firstNameString, lastName: lastNameString)
             isMeetingRequire = true
            }catch let error {
                showAlert(title: "Could not create Pass", message: error.localizedDescription)
                
            }
            
        case "Season":
            do {
            entrant =  try SeasonGuest(firstName: firstNameString, lastName: lastNameString, streetName: streetNameString, city: cityString, state: stateString, zipCode: zipcodeString)
                 isMeetingRequire = true
            }catch let error {
                showAlert(title: "Could not create Pass", message: error.localizedDescription)
                
            }
            
        case "Food Services" :
            do {
            entrant =  try EmployeeFoodServices(firstName: firstNameString, lastName: lastNameString, streetName: streetNameString, city: cityString, state: stateString, zipCode: zipcodeString)
                 isMeetingRequire = true
            }catch let error {
                showAlert(title: "Could not create Pass", message: error.localizedDescription)
                
            }
        case "Ride Services" :
            do {
            entrant =  try EmployeeRideServices(firstName: firstNameString, lastName: lastNameString, streetName: streetNameString, city: cityString, state: stateString, zipCode: zipcodeString)
                 isMeetingRequire = true
            }catch let error {
                showAlert(title: "Could not create Pass", message: error.localizedDescription)
                
            }
        case "Maintenance" :
            do {
            entrant =  try  EmployeeMaintenanceServices(firstName: firstNameString, lastName: lastNameString, streetName: streetNameString, city: cityString, state: stateString, zipCode: zipcodeString)
            }catch let error {
                showAlert(title: "Could not create Pass", message: error.localizedDescription)
                
            }
        case "Contractor" :
            do {
            entrant =  try  ContractEmployee(firstName: firstNameString, lastName: lastNameString, streetName: streetNameString, city: cityString, state: stateString, zipCode: zipcodeString, projectNumber: projectnumberString)
            }catch let error {
                showAlert(title: "Could not create Pass", message: error.localizedDescription)
                
            }
            
        case "Manager" :
            do {
            entrant =  try    Manager(firstName: firstNameString, lastName: lastNameString, streetName: streetNameString, city: cityString, state: stateString, zipCode: zipcodeString)
            }catch let error {
                showAlert(title: "Could not create Pass", message: error.localizedDescription)
                
            }
        case "Vendor" :
            do {
            entrant =  try   Vendor(firstName: firstNameString, lastName: lastNameString, dateOfBirth: birthday, dateOfService: worktime, company: companyString)
            }catch let error {
                showAlert(title: "Could not create Pass", message: error.localizedDescription)
                
            }
        default:
            return
            }
//
        if isMeetingRequire {
        performSegue(withIdentifier: "createNewPass", sender: nil)
        }
    
        }
    
    func disableTextField() {
        dateOfBirthTF.isUserInteractionEnabled = false
        dateOfBirthTF.alpha = 0.5
        dateOfBirthTF.text = ""
        ssnTF.isUserInteractionEnabled = false
        ssnTF.alpha = 0.5
        ssnTF.text = ""
        projectNumbersTF.isUserInteractionEnabled = false
        projectNumbersTF.alpha = 0.5
        projectNumbersTF.text = ""
        
        firstNameTF.isUserInteractionEnabled = false
        firstNameTF.alpha = 0.5
        firstNameTF.text = ""
        lastNameTF.isUserInteractionEnabled = false
        lastNameTF.alpha = 0.5
        lastNameTF.text = ""
        
        companyTF.isUserInteractionEnabled = false
        companyTF.alpha = 0.5
        companyTF.text = ""
        dateOfServiceTF.isUserInteractionEnabled = false
        dateOfServiceTF.alpha = 0.5
        dateOfServiceTF.text = ""
        
        streetNameTF.isUserInteractionEnabled = false
        streetNameTF.alpha = 0.5
        streetNameTF.text = ""
        cityTF.isUserInteractionEnabled = false
        cityTF.alpha = 0.5
        cityTF.text = ""
        stateTF.isUserInteractionEnabled = false
        stateTF.alpha = 0.5
        stateTF.text = ""
        zipCodeTF.isUserInteractionEnabled = false
        zipCodeTF.alpha = 0.5
        zipCodeTF.text = ""
    }
    
    func AgeEnable() {
        dateOfBirthTF.isUserInteractionEnabled = true
        dateOfBirthTF.alpha = 1.0
        dateOfBirthTF.text = ""
       
    }
    
    
    func NameEnable() {
        firstNameTF.isUserInteractionEnabled = true
        firstNameTF.alpha = 1.0
        lastNameTF.isUserInteractionEnabled = true
        lastNameTF.alpha = 1.0
        
     
    }
    
    func AddressEnable() {
        streetNameTF.isUserInteractionEnabled = true
        streetNameTF.alpha = 1.0
        cityTF.isUserInteractionEnabled = true
        cityTF.alpha = 1.0
        stateTF.isUserInteractionEnabled = true
        stateTF.alpha = 1.0
        zipCodeTF.isUserInteractionEnabled = true
        zipCodeTF.alpha = 1.0
        zipCodeTF.text = ""
    }
    
    func ProjectEnable() {
        projectNumbersTF.isUserInteractionEnabled = true
        projectNumbersTF.alpha = 1
        projectNumbersTF.text = ""
    }
    
    func CompanyServiceEnable() {
        companyTF.isUserInteractionEnabled = true
        companyTF.alpha = 1
        companyTF.text = ""
        
        dateOfServiceTF.isUserInteractionEnabled = true
        dateOfServiceTF.alpha = 1
        dateOfServiceTF.text = ""
    }
    
    //MARK: unwind
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) {
        //reset to default
        guestStacks.isHidden = true
        employeeStacks.isHidden = true
        disableTextField()
        generatePassButton.isEnabled = false
        isMeetingRequire = false
        mySound.loadGrantedSound()
        mySound.playGameSound()
    }
    
    //MARK: Passing data
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createNewPass" {
            guard let navigationVC = segue.destination as? UINavigationController else { return }
            guard let entrantInfo = navigationVC.topViewController as? CreateNewPassController else { return }
            entrantInfo.firstName = firstNameString
            entrantInfo.lastName = lastNameString
            
            entrantInfo.entrant = entrant
            entrantInfo.dob = birthdayString 
            entrantInfo.company = companyString
            
        }
}

    
    func showAlert(title: String, message: String){
        //If an alert is shown and the segue status is true then the "Continue" option will show.
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        if isMeetingRequire {
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler:{ action in
                self.performSegue(withIdentifier: "CreateNewPass", sender: nil)
            }))
        } else {
            //if not an error needs to be addressed by the user
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        }
        //Must present the alert for the user to view it.
        self.present(alert, animated: true)
    }

}
