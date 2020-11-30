//
//  EditMedicationViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/27/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 125))//1
        datePicker.datePickerMode = .date //2
        self.inputView = datePicker //3
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}

protocol UpdateMedication {
    func updateMedication(updatedMedication: Medication)
}

class EditMedicationViewController: UIViewController {
    
    var editPassedInformation = Medication()
    
    var delegateVar: UpdateMedication?
    
    @IBOutlet weak var medicationNameLabel: UILabel!
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
        
        connectTextFields()
        
        medicationNameLabel.text = editPassedInformation.name
        numOfTabsPerDoseTextField.text = String(editPassedInformation.numOfTabsPerDose)
        timesTakenDailyTextField.text = String(editPassedInformation.timesTakenDaily)
        dateFilledTextField.text = editPassedInformation.dateFilled
        numOfTabsAvailableTextField.text = String(editPassedInformation.numOfTabsAvailable)
        reasonTextField.text = editPassedInformation.reason
        doctorFirstNameTextField.text = editPassedInformation.doctorFirstName
        doctorLastNameTextField.text = editPassedInformation.doctorLastName
        
    }
    
    @IBAction func cancelEdit(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneEdit(_ sender: Any) {
        
        guard numOfTabsPerDoseTextField.text!.count > 0 else {
            let alert = UIAlertController(title: "Missing Number of Tablets Per Dose!", message: "Please enter the number of tablets taken per dose for this medication", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        guard timesTakenDailyTextField.text!.count > 0 else {
            let alert = UIAlertController(title: "Missing Number of Times Taken Daily!", message: "Please enter the number of times this medication is taken each day", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        guard dateFilledTextField.text!.count > 0 else {
            let alert = UIAlertController(title: "Missing Date Filled by Pharmacy!", message: "Please enter the date this medication was last filled by the pharmacy", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        guard numOfTabsAvailableTextField.text!.count > 0 else {
            let alert = UIAlertController(title: "Missing Number of Tablets Available!", message: "Please enter the current number of tablets available for this medication", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        guard Int(numOfTabsPerDoseTextField.text!) != nil else {
            let alert = UIAlertController(title: "Number of Tablets Per Dose Integer Only!", message: "Please only enter integers for the number of tablets per dose (i.e. 2)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        guard Int(timesTakenDailyTextField.text!) != nil else {
            let alert = UIAlertController(title: "Number of Times Daily Integer Only!", message: "Please only enter integers for the number of times taken daily  (i.e. 4)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        guard Int(numOfTabsAvailableTextField.text!) != nil else {
            let alert = UIAlertController(title: "Number of Tabs Available Integer Only!", message: "Please only enter integers for the number of tabs available (i.e. 30)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        guard Int(timesTakenDailyTextField.text!)! >= 1 && Int(timesTakenDailyTextField.text!)! <= 4  else {
            let alert = UIAlertController(title: "Number of Times Daily 1 to 4 Only!", message: "Please only enter integers 1 to 4 for the number of times taken daily", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        
        if numOfTabsPerDoseTextField.text!.count > 0,
            timesTakenDailyTextField.text!.count > 0,
            dateFilledTextField.text!.count > 0,
            numOfTabsAvailableTextField.text!.count > 0 {
            
            editPassedInformation.numOfTabsPerDose = Int(numOfTabsPerDoseTextField.text!)!
            editPassedInformation.timesTakenDaily = Int(timesTakenDailyTextField.text!)!
            editPassedInformation.dateFilled = dateFilledTextField.text!
            editPassedInformation.numOfTabsAvailable = Int(numOfTabsAvailableTextField.text!)!
            editPassedInformation.reason = reasonTextField.text!
            editPassedInformation.doctorFirstName = doctorFirstNameTextField.text!
            editPassedInformation.doctorLastName = doctorLastNameTextField.text!
            
            delegateVar?.updateMedication(updatedMedication: editPassedInformation)
            
            self.dismiss(animated: true, completion: nil)
        }
        
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
