//
//  DoctorDetailsViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/19/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class DoctorDetailsViewController: UIViewController {
    
    var passedInformation = Doctor()

    @IBOutlet weak var doctorNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doctorNameLabel.text = passedInformation.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditDoctor" {
            let editDoctorView = segue.destination as! EditDoctorViewController
            
            editDoctorView.editPassedInformation = passedInformation
        }
    }
    
    @IBAction func showEditDoctor(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditDoctor", sender: self)
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
