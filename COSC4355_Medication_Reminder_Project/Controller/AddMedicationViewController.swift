//
//  AddMedicationViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/27/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

protocol AddMedication {
    func addMedication(addedMed: Medication)
}

class AddMedicationViewController: UIViewController {
    
    var addedMedInformation = Medication()
    
    var delegateVar: AddMedication?
    
    @IBOutlet weak var medNameTextField: UITextField!
    @IBOutlet weak var tabsTakenPerDoseTextField: UITextField!
    @IBOutlet weak var timesTakenDailyTextField: UITextField!
    @IBOutlet weak var dateFilledTextField: UITextField!
    @IBOutlet weak var numOfTabsAvailableTextField: UITextField!
    @IBOutlet weak var reasonTextField: UITextField!
    @IBOutlet weak var doctorFirstNameTextField: UITextField!
    @IBOutlet weak var doctorLastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        connectTextFields()
    }
    
    @IBAction func addMedication(_ sender: Any) {
        
        guard medNameTextField.text!.count > 0 else {
            let missingNameAlert = UIAlertController(title: "Missing Medication Name!", message: "Please enter the medication name", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        guard tabsTakenPerDoseTextField.text!.count > 0 else {
            let missingNameAlert = UIAlertController(title: "Missing Number of Tablets Per Dose!", message: "Please enter the number of tablets taken per dose for this medication", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        guard timesTakenDailyTextField.text!.count > 0 else {
            let missingNameAlert = UIAlertController(title: "Missing Number of Times Taken Daily!", message: "Please enter the number of times this medication is taken each day", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        guard dateFilledTextField.text!.count > 0 else {
            let missingNameAlert = UIAlertController(title: "Missing Date Filled by Pharmacy!", message: "Please enter the date this medication was last filled by the pharmacy", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        guard numOfTabsAvailableTextField.text!.count > 0 else {
            let missingNameAlert = UIAlertController(title: "Missing Number of Tablets Available!", message: "Please enter the current number of tablets available for this medication", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        guard Int(tabsTakenPerDoseTextField.text!) != nil else {
            let alert = UIAlertController(title: "Number of Tablets Per Dose Integer Only!", message: "Please only enter integers for the number of tablets per dose", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        guard Int(timesTakenDailyTextField.text!) != nil else {
            let alert = UIAlertController(title: "Number of Times Daily Integer Only!", message: "Please only enter integers for the number of times taken daily", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        guard Int(numOfTabsAvailableTextField.text!) != nil else {
            let alert = UIAlertController(title: "Number of Tabs Available Integer Only!", message: "Please only enter integers for the number of tabs available", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        if medNameTextField.text!.count > 0,
            tabsTakenPerDoseTextField.text!.count > 0,
            timesTakenDailyTextField.text!.count > 0,
            dateFilledTextField.text!.count > 0,
            numOfTabsAvailableTextField.text!.count > 0 {
            
            addedMedInformation.name = medNameTextField.text!
            addedMedInformation.numOfTabsPerDose = Int(tabsTakenPerDoseTextField.text!)!
            addedMedInformation.timesTakenDaily = Int(timesTakenDailyTextField.text!)!
            addedMedInformation.dateFilled = dateFilledTextField.text!
            addedMedInformation.numOfTabsAvailable = Int(numOfTabsAvailableTextField.text!)!
            addedMedInformation.reason = reasonTextField.text!
            addedMedInformation.doctorFirstName = doctorFirstNameTextField.text!
            addedMedInformation.doctorLastName = doctorLastNameTextField.text!
            
            delegateVar?.addMedication(addedMed: addedMedInformation)
            
            self.dismiss(animated: true, completion: nil)
        }

    }
    
    @IBAction func cancelAddMedication(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func connectTextFields() {
        
        self.dateFilledTextField.setInputViewDatePicker(target: self, selector: #selector(dateFilledTapDone))
    }
    
    @objc func dateFilledTapDone() {
        if let datePicker = self.dateFilledTextField.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            //dateformatter.dateStyle = .short// 2-3
            dateformatter.dateFormat = "MM-dd-yyyy"
            self.dateFilledTextField.text = dateformatter.string(from: datePicker.date) //2-4
        }
        self.dateFilledTextField.resignFirstResponder() // 2-5
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
