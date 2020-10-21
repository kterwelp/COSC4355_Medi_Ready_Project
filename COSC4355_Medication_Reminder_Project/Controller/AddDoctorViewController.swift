//
//  AddDoctorViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/20/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

protocol AddDoctor {
    func addDoctor(addedDoctor: Doctor)
}

class AddDoctorViewController: UIViewController {
    
    var addedDoctorInformation = Doctor()
    var delegateVar: AddDoctor?
    
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
    }
    
    @IBAction func addDoctor(_ sender: Any) {
        
        addedDoctorInformation.name = doctorNameTextField.text!
        addedDoctorInformation.specialty = doctorSpecialtyTextField.text!
        addedDoctorInformation.phoneNumber = doctorPhoneNumberTextField.text!
        addedDoctorInformation.streetAddress = doctorStreetAddressTextField.text!
        addedDoctorInformation.city = doctorCityTextField.text!
        addedDoctorInformation.state = doctorStateTextField.text!
        addedDoctorInformation.zipCode = doctorZipCodeTextField.text!
        
        delegateVar?.addDoctor(addedDoctor: addedDoctorInformation)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAddDoctor(_ sender: Any) {
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
