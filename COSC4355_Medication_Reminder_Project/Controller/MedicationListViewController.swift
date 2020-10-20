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
    
    /*
        TEMPORARY TESTING
        TO BE REMOVED
     */
    
    
    
    let med1 = Medication(name: "Amlodipine", timesTakenDaily: [8, 14, 20], hasBeenTaken: true)
    let med2 = Medication(name: "Lisinopril", timesTakenDaily: [8, 14, 20], hasBeenTaken: false)
    let med3 = Medication(name: "Atorvastatin", timesTakenDaily: [8, 14, 20], hasBeenTaken: true)
    let med4 = Medication(name: "Metformin", timesTakenDaily: [8, 14, 20], hasBeenTaken: false)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        /*
           TEMPORARY TESTING
           TO BE REMOVED
        */
        tempMedications.append(med1)
        tempMedications.append(med2)
        tempMedications.append(med3)
        tempMedications.append(med4)
    }

    // MARK: - Table view data source

    // TODO: Use number of times meds taken per day to calc # of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tempMedications.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.TableView.CellHeight
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicationCell", for: indexPath)

        let medicationNameLabel = cell.viewWithTag(1) as! UILabel
        
        medicationNameLabel.text = tempMedications[indexPath.row].name
        
        cell.accessoryType = tempMedications[indexPath.row].hasBeenTaken ? .checkmark : .none // applies a checkmark to the cell based on whether or not the medication has been taken today

        return cell
    }
    
    // MARK: TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let medication = tempMedications[indexPath.row]
        
        medication.hasBeenTaken = !medication.hasBeenTaken
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    // MARK: - Data Updating Methods
    
    // TODO: Finish implementation of adding new medication
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // need to open Add Medication VC
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
