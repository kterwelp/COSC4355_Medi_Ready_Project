//
//  AddMedicationViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/27/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class AddMedicationViewController: UIViewController {
    
    @IBOutlet weak var dateFilledTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        connectTextFields()
    }
    
    @IBAction func addMedication(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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
