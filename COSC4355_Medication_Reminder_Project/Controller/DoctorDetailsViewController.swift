//
//  DoctorDetailsViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/19/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class DoctorDetailsViewController: UIViewController, UpdateDoctor {
    
    var passedInformation = Doctor()
    var passedDoctorArrayIndex = 0

    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorSpecialtyLabel: UILabel!
    @IBOutlet weak var doctorPhoneNumberLabel: UILabel!
    @IBOutlet weak var doctorStreetAddressLabel: UILabel!
    @IBOutlet weak var doctorCityStateZipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doctorNameLabel.text = passedInformation.name
        doctorSpecialtyLabel.text = passedInformation.specialty
        doctorPhoneNumberLabel.text = passedInformation.phoneNumber
        doctorStreetAddressLabel.text = passedInformation.streetAddress
        doctorCityStateZipLabel.text = passedInformation.city + ", " + passedInformation.state + " " + passedInformation.zipCode
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditDoctor" {
            let editDoctorView = segue.destination as! EditDoctorViewController
            
            editDoctorView.editPassedInformation = passedInformation
            editDoctorView.editPassedDoctorArrayIndex = passedDoctorArrayIndex
            editDoctorView.delegateVar = self
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        viewDidLoad()
//    }
    
    @IBAction func showEditDoctor(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditDoctor", sender: self)
    }
    
    func updateDoctor(updatedDoctor: Doctor, currentDoctorArrayIndex: Int) {
        passedDoctorArrayIndex = currentDoctorArrayIndex
        doctorNameLabel.text = updatedDoctor.name
        doctorSpecialtyLabel.text = updatedDoctor.specialty
        doctorPhoneNumberLabel.text = updatedDoctor.phoneNumber
        doctorStreetAddressLabel.text = updatedDoctor.streetAddress
        doctorCityStateZipLabel.text = updatedDoctor.city + ", " + updatedDoctor.state + " " + updatedDoctor.zipCode
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
