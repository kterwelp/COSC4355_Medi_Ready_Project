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
    
}

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
        
        connectTextFields()
        
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
