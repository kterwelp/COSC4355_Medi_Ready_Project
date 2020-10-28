//
//  EditMedicationViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/27/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

protocol DeleteMedication {
    func deleteCurrentMedication()
}

class EditMedicationViewController: UIViewController {
    
    var editPassedInformation = Medication()
    
    var delegateVarDelete: DeleteMedication?
    
    @IBOutlet weak var medicationNameTextField: UITextField!
    @IBOutlet weak var numOfTabsPerDoseTextField: UITextField!
    @IBOutlet weak var timesTakenDailyTextField: UITextField!
    @IBOutlet weak var dateFilledTextField: UITextField!
    @IBOutlet weak var numOfTabsAvailableTextField: UITextField!
    @IBOutlet weak var reasonTextField: UITextField!
    @IBOutlet weak var doctorFirstNameTextField: UITextField!
    @IBOutlet weak var doctorLastNameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        medicationNameTextField.text = editPassedInformation.name
        numOfTabsPerDoseTextField.text = String(editPassedInformation.numOfTabsPerDose) + " tabs"
        timesTakenDailyTextField.text = String(editPassedInformation.timesTakenDaily) + " times daily"
        dateFilledTextField.text = editPassedInformation.dateFilled
        numOfTabsAvailableTextField.text = String(editPassedInformation.numOfTabsAvailable) + " tabs available"
        reasonTextField.text = editPassedInformation.reason
        doctorFirstNameTextField.text = editPassedInformation.doctorFirstName
        doctorLastNameTextField.text = editPassedInformation.doctorLastName
        
    }
    
    @IBAction func cancelEdit(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneEdit(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //TODO:  This is causing a bug where the Tab Bar disappears - Needs new solution
    @IBAction func deleteMedication(_ sender: Any) {
        
        delegateVarDelete?.deleteCurrentMedication()
        
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
