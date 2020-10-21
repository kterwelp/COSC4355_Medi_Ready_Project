//
//  EditDoctorViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/20/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

protocol UpdateDoctor {
    func updateDoctor(updatedDoctor: Doctor, currentDoctorArrayIndex: Int)
}

protocol DeleteDoctor {
    func deleteCurrentDoctor(currentDoctorArray: [Doctor], currentDoctorArrayIndex: Int)
}

class EditDoctorViewController: UIViewController {
    
    var editPassedInformation = Doctor()
    var editPassedDoctorArrayIndex = 0
    var editDoctorArray = [Doctor]()
    
    var delegateVar: UpdateDoctor?
    var delegateVarDelete: DeleteDoctor?
    
    @IBOutlet weak var doctorNameTextField: UITextField!
    @IBOutlet weak var doctorSpecialtyTextField: UITextField!
    @IBOutlet weak var doctorPhoneNumberTextField: UITextField!
    @IBOutlet weak var doctorStreetAddressTextField: UITextField!
    @IBOutlet weak var doctorCityTextField: UITextField!
    @IBOutlet weak var doctorStateTextField: UITextField!
    @IBOutlet weak var doctorZipCodeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doctorNameTextField.text = editPassedInformation.name
        doctorSpecialtyTextField.text = editPassedInformation.specialty
        doctorPhoneNumberTextField.text = editPassedInformation.phoneNumber
        doctorStreetAddressTextField.text = editPassedInformation.streetAddress
        doctorCityTextField.text = editPassedInformation.city
        doctorStateTextField.text = editPassedInformation.state
        doctorZipCodeTextField.text = editPassedInformation.zipCode
    }
    
    @IBAction func cancelEdit(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneEdit(_ sender: Any) {
        
        //TODO:  When an alert is dismissed, it also dismisses the modal view
        guard doctorNameTextField.text!.count > 0 else {
            let missingNameAlert = UIAlertController(title: "Missing Name!", message: "Please enter the doctor's name", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        guard doctorSpecialtyTextField.text!.count > 0 else {
            let missingSpecialtyAlert = UIAlertController(title: "Missing Specialty!", message: "Please enter the doctor's specialty", preferredStyle: .alert)
            
            missingSpecialtyAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingSpecialtyAlert, animated: true)
            
            return
        }
        
        guard doctorPhoneNumberTextField.text!.count > 0 else {
            let missingPhoneNumberAlert = UIAlertController(title: "Missing Phone Number!", message: "Please enter the doctor's phone number", preferredStyle: .alert)
            
            missingPhoneNumberAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingPhoneNumberAlert, animated: true)
            
            return
        }
        
        if doctorNameTextField.text!.count > 0,
        doctorSpecialtyTextField.text!.count > 0,
        doctorPhoneNumberTextField.text!.count > 0 {
            
             editPassedInformation.name = doctorNameTextField.text!
             editPassedInformation.specialty = doctorSpecialtyTextField.text!
             editPassedInformation.phoneNumber = doctorPhoneNumberTextField.text!
             editPassedInformation.streetAddress = doctorStreetAddressTextField.text!
             editPassedInformation.city = doctorCityTextField.text!
             editPassedInformation.state = doctorStateTextField.text!
             editPassedInformation.zipCode = doctorZipCodeTextField.text!
             
             delegateVar?.updateDoctor(updatedDoctor: editPassedInformation, currentDoctorArrayIndex: editPassedDoctorArrayIndex)
             
             self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    
    @IBAction func deleteDoctor(_ sender: Any) {
        
        delegateVarDelete?.deleteCurrentDoctor(currentDoctorArray: editDoctorArray, currentDoctorArrayIndex: editPassedDoctorArrayIndex)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
