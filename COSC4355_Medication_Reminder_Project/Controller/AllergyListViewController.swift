//
//  AllergyListViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class AllergyListViewController: UITableViewController, AddAllergy {
    
    var allergyArray = [Allergy]()
    var selectedInformation = Allergy()
    var allergyArrayIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

//        let allergy1 = Allergy()
//        let allergy2 = Allergy()
//        let allergy3 = Allergy()
//        let allergy4 = Allergy()
//        let allergy5 = Allergy()
//
//        allergy1.medicationName = "Penicillin"
//        allergy1.reactions = "Rash, Swelling"
//
//        allergy2.medicationName = "Morphine"
//        allergy2.reactions = "Shortness of breath, Respiratory issues"
//        
//        allergy3.medicationName = "Norco"
//        allergy3.reactions = "Hives, Rash"
//
//        allergy4.medicationName = "Nystatin"
//        allergy4.reactions = "Hives, Rash, Swelling"
//
//        allergy5.medicationName = "Aspirin"
//        allergy5.reactions = "Bruising, High blood pressure"
//
//        allergyArray.append(allergy1)
//        allergyArray.append(allergy2)
//        allergyArray.append(allergy3)
//        allergyArray.append(allergy4)
//        allergyArray.append(allergy5)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allergyArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.TableView.CellHeight
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allergyCell", for: indexPath)

        // Configure the cell...
        let cellLbl = cell.viewWithTag(1) as! UILabel
        
        cellLbl.text = allergyArray[indexPath.row].medicationName

        return cell
    }
    
    override func viewWillAppear(_ animated:Bool) {
       super.viewWillAppear(animated)
        if allergyArray.count > 1 {
            allergyArray.sort { $0.medicationName < $1.medicationName }
        }
       tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAllergyInfo" {
            let seg = segue.destination as! AllergyDetailsViewController
            seg.passedInformation = selectedInformation
            seg.passedAllergyArrayIndex = allergyArrayIndex
            seg.detailsAllergyArray = allergyArray
            seg.hidesBottomBarWhenPushed = true
        }
        
        if segue.identifier == "showAddAllergy" {
            let addAllergyView = segue.destination as! AddAllergyViewController
            addAllergyView.delegateVar = self
            addAllergyView.hidesBottomBarWhenPushed = true
        }
        
        if segue.identifier == "showProfile" {

            let ProfileView = segue.destination as! ProfileViewController
            
            ProfileView.hidesBottomBarWhenPushed = true
    
        }
        
    }
    
    @IBAction func showAddAllergy(_ sender: Any) {
        
        performSegue(withIdentifier: "showAddAllergy", sender: self)
    }
    
    
    
    func addAllergy(addedAllergy: Allergy) {
        allergyArray.append(addedAllergy)
        if allergyArray.count > 1 {
            allergyArray.sort { $0.medicationName < $1.medicationName }
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedInformation = allergyArray[indexPath.row]
        //allergyArrayIndex = indexPath.row
        self.performSegue(withIdentifier: "showAllergyInfo", sender: self)
    }
    
    @IBAction func showProfile(_ sender: Any) {
        
        performSegue(withIdentifier: "showProfile", sender: self)
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
