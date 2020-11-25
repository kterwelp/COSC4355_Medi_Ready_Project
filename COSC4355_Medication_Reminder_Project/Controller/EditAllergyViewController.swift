//
//  EditAllergyViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

protocol UpdateAllergy {
    func updateAllergy(updatedAllergy: Allergy, currentAllergyArrayIndex: Int)
}

class EditAllergyViewController: UIViewController {
    
    var editPassedInformation = Allergy()
    var editPassedAllergyArrayIndex = 0
    var editAllergyArray = [Allergy]()
    
    var delegateVar: UpdateAllergy?

    @IBOutlet weak var reactionTextView: UITextView!
    @IBOutlet weak var medicationAllergyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reactionTextView.layer.borderWidth = 1
        reactionTextView.layer.borderColor = UIColor.lightGray.cgColor
        reactionTextView.layer.cornerRadius = 6
        
        medicationAllergyTextField.text = editPassedInformation.medicationName
        reactionTextView.text = editPassedInformation.reactions
    }
    
    @IBAction func cancelEdit(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneEditing(_ sender: Any) {
        
        guard medicationAllergyTextField.text!.count > 0 else {
            let missingNameAlert = UIAlertController(title: "Missing Medication Allergy!", message: "Please enter the name of the medication that causes your allergic reaction", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        if medicationAllergyTextField.text!.count > 0 {
            
            editPassedInformation.medicationName = medicationAllergyTextField.text!
            editPassedInformation.reactions = reactionTextView.text!
            
            delegateVar?.updateAllergy(updatedAllergy: editPassedInformation, currentAllergyArrayIndex: editPassedAllergyArrayIndex)
            
            self.dismiss(animated: true, completion: nil)
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
