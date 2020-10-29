//
//  EditAllergyViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class EditAllergyViewController: UIViewController {
    
    var editPassedInformation = Allergy()

    @IBOutlet weak var reactionTextView: UITextView!
    @IBOutlet weak var allergyMedicationNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reactionTextView.layer.borderWidth = 1
        reactionTextView.layer.borderColor = UIColor.lightGray.cgColor
        reactionTextView.layer.cornerRadius = 6
        
        allergyMedicationNameTextField.text = editPassedInformation.medicationName
        reactionTextView.text = editPassedInformation.reactions
    }
    
    @IBAction func cancelEdit(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneEditing(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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
