//
//  AllergyDetailsViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class AllergyDetailsViewController: UIViewController {

    var passedInformation = Allergy()
    
    @IBOutlet weak var allergyMedicationNameLabel: UILabel!
    @IBOutlet weak var reactionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController!.navigationBar.tintColor = UIColor.systemIndigo
        
        allergyMedicationNameLabel.text = passedInformation.medicationName
        reactionTextView.text = passedInformation.reactions
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditAllergy" {
            let editAllergyView = segue.destination as! EditAllergyViewController
            
            editAllergyView.editPassedInformation = passedInformation
//            editDoctorView.editPassedDoctorArrayIndex = passedDoctorArrayIndex
//            editDoctorView.editDoctorArray = detailsDoctorArray
//            editDoctorView.delegateVar = self
//            editDoctorView.delegateVarDelete = self
        }
    }
    
    @IBAction func editAllergy(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditAllergy", sender: self)
    }
    
    @IBAction func deleteAllergy(_ sender: Any) {
        
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
