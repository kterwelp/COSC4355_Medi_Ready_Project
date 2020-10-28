//
//  MedicationDetailsViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/27/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class MedicationDetailsViewController: UIViewController, DeleteMedication {
    
    var passedInformation = Medication()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tabsTakenLabel: UILabel!
    @IBOutlet weak var timesTakenDailyLabel: UILabel!
    @IBOutlet weak var dateFilledLabel: UILabel!
    @IBOutlet weak var numTabsAvailableLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var doctorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController!.navigationBar.tintColor = UIColor.systemIndigo
        
        nameLabel.text = passedInformation.name
        tabsTakenLabel.text = String(passedInformation.numOfTabsPerDose) + " tabs"
        timesTakenDailyLabel.text = String(passedInformation.timesTakenDaily)  + " times daily"
        dateFilledLabel.text = passedInformation.dateFilled
        numTabsAvailableLabel.text = String(passedInformation.numOfTabsAvailable)  + " tabs"
        reasonLabel.text = passedInformation.reason
        doctorLabel.text = "Dr. " + passedInformation.doctorFirstName + " " + passedInformation.doctorLastName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditMedication" {
            let editMedicationView = segue.destination as! EditMedicationViewController

            editMedicationView.editPassedInformation = passedInformation
            
            //TODO: Complete functionality
//            editDoctorView.editPassedDoctorArrayIndex = passedDoctorArrayIndex
//            editDoctorView.editDoctorArray = detailsDoctorArray
//            editDoctorView.delegateVar = self
            editMedicationView.delegateVarDelete = self
        }
        
        if segue.identifier == "showMedicationList" {

            //TODO: Complete functionality for deleting medication
//            let medicationListView = segue.destination as! MedicationListViewController
            
//            detailsDoctorArray.remove(at: passedDoctorArrayIndex)
//            doctorListView.doctorArray = detailsDoctorArray
        }
    }
    
    @IBAction func deleteMedication(_ sender: Any) {
        
        performSegue(withIdentifier: "showMedicationList", sender: self)
    }
    
    @IBAction func editMedication(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditMedication", sender: self)
    }

    func deleteCurrentMedication() {
        
        //TODO: Complete functionality
    //    detailsDoctorArray = currentDoctorArray
    //    passedDoctorArrayIndex = currentDoctorArrayIndex
        performSegue(withIdentifier: "showMedicationList", sender: self)
        
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
