//
//  AddAllergyViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

protocol AddAllergy {
    func addAllergy(addedAllergy: Allergy)
}

class AddAllergyViewController: UIViewController {
    
    var addedAllergyInformation = Allergy()
    var delegateVar: AddAllergy?
    
    
    @IBOutlet weak var medicationAllergyTextField: UITextField!
    @IBOutlet weak var reactionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reactionTextView.layer.borderWidth = 1
        reactionTextView.layer.borderColor = UIColor.lightGray.cgColor
        reactionTextView.layer.cornerRadius = 6
    }
    
    @IBAction func addAllergy(_ sender: Any) {
        
        guard medicationAllergyTextField.text!.count > 0 else {
            let missingNameAlert = UIAlertController(title: "Missing Medication Allergy!", message: "Please enter the name of the medication that causes your allergic reaction", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        if reactionTextView.text!.count > 0,
        reactionTextView.text! != "Please replace this text with information regarding the allergic reaction." {
            addedAllergyInformation.reactions = reactionTextView.text!
        }
        
        if medicationAllergyTextField.text!.count > 0 {
            addedAllergyInformation.medicationName = medicationAllergyTextField.text!
            
            delegateVar?.addAllergy(addedAllergy: addedAllergyInformation)
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func cancelAddAllergy(_ sender: Any) {
        
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
