//
//  EditDoctorViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/20/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class EditDoctorViewController: UIViewController {
    
    var editPassedInformation = Doctor()
    
    @IBOutlet weak var doctorNameTextField: UITextField!
    @IBOutlet weak var doctorSpecialtyTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doctorNameTextField.text = editPassedInformation.name
        doctorSpecialtyTextField.text = editPassedInformation.specialty
    }
    
    @IBAction func cancelEdit(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneEdit(_ sender: Any) {
        
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
