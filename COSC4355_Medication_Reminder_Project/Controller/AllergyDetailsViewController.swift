//
//  AllergyDetailsViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class AllergyDetailsViewController: UIViewController, UpdateAllergy {

    var passedInformation = Allergy()
    var detailsAllergyArray = [Allergy]()
    var passedAllergyArrayIndex = 0
    
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
            editAllergyView.editPassedAllergyArrayIndex = passedAllergyArrayIndex
            editAllergyView.editAllergyArray = detailsAllergyArray
            editAllergyView.delegateVar = self
//            editDoctorView.delegateVarDelete = self
        }
    }
    
    @IBAction func editAllergy(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditAllergy", sender: self)
    }
    
    @IBAction func deleteAllergy(_ sender: Any) {
        
    }
    
    func updateAllergy(updatedAllergy: Allergy, currentAllergyArrayIndex: Int) {
        
        if reactionTextView.text != "Please replace this text with information regarding the allergic reaction." {
            passedAllergyArrayIndex = currentAllergyArrayIndex
            allergyMedicationNameLabel.text = updatedAllergy.medicationName
            reactionTextView.text = updatedAllergy.reactions
        } else {
            passedAllergyArrayIndex = currentAllergyArrayIndex
            allergyMedicationNameLabel.text = updatedAllergy.medicationName
        }
        
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
