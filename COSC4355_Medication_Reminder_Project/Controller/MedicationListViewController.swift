//
//  TableViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Jared Talbert on 10/18/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class MedicationListViewController: UITableViewController {
    
    var tempMedications = [Medication]()
    var selectedInformation = Medication()
    var timeArray = ["8:00 AM", "12:00 PM", "2:00 PM", "8:00 PM"]
    
    var eightAMMedications = [Medication]()
    var twelvePMMedications = [Medication]()
    var twoPMMedications = [Medication]()
    var eightPMMedications = [Medication]()
    
    /*
        TEMPORARY TESTING
        TO BE REMOVED
     */
    
    let med1 = Medication()
    let med2 = Medication()
    let med3 = Medication()
    let med4 = Medication()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
           TEMPORARY TESTING
           TO BE REMOVED
        */
        
        med1.name = "Amlodipine"
        med1.numOfTabsPerDose = 2
        med1.timesTakenDaily = 3
        med1.dateFilled = "10-01-2020"
        med1.numOfTabsAvailable = 60
        med1.reason = "High blood pressure"
        med1.doctorFirstName = "Harry"
        med1.doctorLastName = "Potter"
        med1.hasBeenTaken = true
        
        med2.name = "Ativan"
        med2.numOfTabsPerDose = 1
        med2.timesTakenDaily = 1
        med2.dateFilled = "10-21-2020"
        med2.numOfTabsAvailable = 30
        med2.reason = "Anxiety"
        med2.doctorFirstName = "Mickey"
        med2.doctorLastName = "Mouse"
        med2.hasBeenTaken = false
        
        med3.name = "Atorvastatin"
        med3.numOfTabsPerDose = 3
        med3.timesTakenDaily = 2
        med3.dateFilled = "08-03-2020"
        med3.numOfTabsAvailable = 90
        med3.reason = "High cholesterol"
        med3.doctorFirstName = "Luke"
        med3.doctorLastName = "Skywalker"
        med3.hasBeenTaken = true
        
        med4.name = "Metformin"
        med4.numOfTabsPerDose = 1
        med4.timesTakenDaily = 2
        med4.dateFilled = "09-09-2020"
        med4.numOfTabsAvailable = 60
        med4.reason = "Diabetes"
        med4.doctorFirstName = "Katniss"
        med4.doctorLastName = "Everdeen"
        med4.hasBeenTaken = false
        
//        tempMedications.append(med1)
//        tempMedications.append(med2)
//        tempMedications.append(med3)
//        tempMedications.append(med4)
        
        eightAMMedications.append(med1)
        eightAMMedications.append(med3)
        eightAMMedications.append(med4)
        twelvePMMedications.append(med2)
        twoPMMedications.append(med1)
        eightPMMedications.append(med1)
        eightPMMedications.append(med3)
        eightPMMedications.append(med4)
    }

    // MARK: - Table view data source

    // TODO: Use number of times meds taken per day to calc # of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return timeArray[section]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.init(red: 0.149, green: 0.729, blue: 0.933, alpha: 1.0)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return eightAMMedications.count
        } else if section == 1 {
            return twelvePMMedications.count
        } else if section == 2 {
            return twoPMMedications.count
        } else if section == 3 {
            return eightPMMedications.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.TableView.CellHeight
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicationCell", for: indexPath)

        let cellLabel = cell.viewWithTag(1) as! UILabel
        
        if indexPath.section == 0 {
            cellLabel.text = eightAMMedications[indexPath.row].name
        } else if indexPath.section == 1 {
            cellLabel.text = twelvePMMedications[indexPath.row].name
        } else if indexPath.section == 2 {
            cellLabel.text = twoPMMedications[indexPath.row].name
        } else if indexPath.section == 3 {
            cellLabel.text = eightPMMedications[indexPath.row].name
        }
        
        
        //      Code below is for checking of meds - Will look into options later
//        cell.accessoryType = tempMedications[indexPath.row].hasBeenTaken ? .checkmark : .none // applies a checkmark to the cell based on whether or not the medication has been taken today

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMedicationInfo" {
            let seg = segue.destination as! MedicationDetailsViewController
            seg.passedInformation = selectedInformation
//            seg.passedDoctorArrayIndex = doctorArrayIndex
//            seg.detailsDoctorArray = doctorArray
            seg.hidesBottomBarWhenPushed = true
        }
        
//        if segue.identifier == "showAddMedication" {
//            let addDoctorView = segue.destination as! AddDoctorViewController
//            addDoctorView.delegateVar = self
//            addDoctorView.hidesBottomBarWhenPushed = true
//        }
        
        if segue.identifier == "showProfile" {

            let ProfileView = segue.destination as! ProfileViewController
            
            ProfileView.hidesBottomBarWhenPushed = true
    
        }
        
    }
    
    //TODO: Consider adding later when data is not hard coded
//    override func viewWillAppear(_ animated:Bool) {
//       super.viewWillAppear(animated)
//        if tempMedications.count > 1 {
//            tempMedications.sort { $0.name < $1.name }
//        }
//       tableView.reloadData()
//    }
    
    // MARK: TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            selectedInformation = eightAMMedications[indexPath.row]
        } else if indexPath.section == 1 {
            selectedInformation = twelvePMMedications[indexPath.row]
        } else if indexPath.section == 2 {
            selectedInformation = twoPMMedications[indexPath.row]
        } else if indexPath.section == 3 {
            selectedInformation = eightPMMedications[indexPath.row]
        }
        
        self.performSegue(withIdentifier: "showMedicationInfo", sender: self)

//      Code below is for checking of meds - Will look into options later
//        let medication = tempMedications[indexPath.row]
//
//        medication.hasBeenTaken = !medication.hasBeenTaken
//
//        tableView.deselectRow(at: indexPath, animated: true)
//        tableView.reloadData()
        
        
    }
    
    // MARK: - Data Updating Methods
    
    // TODO: Finish implementation of adding new medication
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // need to open Add Medication VC
    }
    
    @IBAction func showProfile(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showProfile", sender: self)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
