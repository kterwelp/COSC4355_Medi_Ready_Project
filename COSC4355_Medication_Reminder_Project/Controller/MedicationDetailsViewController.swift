//
//  MedicationDetailsViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/27/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

protocol UpdateMedTable {
    func removeMedFromTable(removedMed: Medication, prevTimesTakenDaily: Int)
    func sortMedsByTime(med: Medication)
    func updateMedNotificationMsg(addedMed: Medication)
    func updateRefillNotification()
}

class MedicationDetailsViewController: UIViewController, UpdateMedication {
    
    var passedInformation = Medication()
    var currentMed = Medication()
    var previousTimesTakenDaily = 0
    
    var delegateVar: UpdateMedTable?
    
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
        
        if passedInformation.doctorFirstName != "" || passedInformation.doctorLastName != "" {
            doctorLabel.text = "Dr. " + passedInformation.doctorFirstName + " " + passedInformation.doctorLastName
        } else {
            
            doctorLabel.text = passedInformation.doctorFirstName + " " + passedInformation.doctorLastName
        }
        
        previousTimesTakenDaily = passedInformation.timesTakenDaily
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditMedication" {
            let editMedicationView = segue.destination as! EditMedicationViewController

            editMedicationView.editPassedInformation = passedInformation
            editMedicationView.delegateVar = self
            
            //TODO: Complete functionality
//            editDoctorView.editPassedDoctorArrayIndex = passedDoctorArrayIndex
//            editDoctorView.editDoctorArray = detailsDoctorArray
            
        }
        
        if segue.identifier == "showMedicationList" {

            //TODO: Complete functionality for deleting medication
//            let medicationListView = segue.destination as! MedicationListViewController
            
//            detailsDoctorArray.remove(at: passedDoctorArrayIndex)
//            doctorListView.doctorArray = detailsDoctorArray
        }
    }
    
    
    @IBAction func editMedication(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditMedication", sender: self)
    }
    
    func updateMedication(updatedMedication: Medication) {
        
        nameLabel.text = updatedMedication.name
        tabsTakenLabel.text = String(updatedMedication.numOfTabsPerDose) + " tabs"
        timesTakenDailyLabel.text = String(updatedMedication.timesTakenDaily)  + " times daily"
        dateFilledLabel.text = updatedMedication.dateFilled
        numTabsAvailableLabel.text = String(updatedMedication.numOfTabsAvailable)  + " tabs"
        reasonLabel.text = updatedMedication.reason
        
        if updatedMedication.doctorFirstName != "" || updatedMedication.doctorLastName != "" {
            
            doctorLabel.text = "Dr. " + updatedMedication.doctorFirstName + " " + updatedMedication.doctorLastName
        } else {
            
            doctorLabel.text = updatedMedication.doctorFirstName + " " + updatedMedication.doctorLastName
        }
        
        currentMed = updatedMedication

    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Moving from MedicationDetailsViewController to MedicationListViewController
        if self.isMovingFromParent {
            
            if currentMed.name != "" {
                
                print("Passed: " + passedInformation.name)
                
                delegateVar?.removeMedFromTable(removedMed: currentMed, prevTimesTakenDaily: previousTimesTakenDaily)
                delegateVar?.sortMedsByTime(med: currentMed)
                delegateVar?.updateMedNotificationMsg(addedMed: currentMed)
                delegateVar?.updateRefillNotification()
                
            }
            
        }
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
