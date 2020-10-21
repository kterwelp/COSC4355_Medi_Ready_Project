//
//  TableViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Jared Talbert on 10/18/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class DoctorsListViewController: UITableViewController {
    
    var doctorArray = [Doctor]()
    var selectedInformation = Doctor()
    var doctorArrayIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doc1 = Doctor()
        let doc2 = Doctor()
        let doc3 = Doctor()
        let doc4 = Doctor()
        let doc5 = Doctor()
        let doc6 = Doctor()
        
        doc1.name = "Stephen Colbert"
        doc1.specialty = "Family Medicine"
        doc1.streetAddress = "123 Stephen Street"
        doc1.city = "San Diego"
        doc1.state = "CA"
        doc1.zipCode = "92101-1234"
        doc1.phoneNumber = "123-456-7890"
        
        doc2.name = "Jon Stewart"
        doc2.specialty = "Oncology"
        doc2.streetAddress = "123 Jon Street"
        doc2.city = "San Diego"
        doc2.state = "CA"
        doc2.zipCode = "92101-1234"
        doc2.phoneNumber = "123-456-7890"
        
        doc3.name = "Beyonce Knowles"
        doc3.specialty = "Gynecologist"
        doc3.streetAddress = "123 Beyonce Street"
        doc3.city = "San Diego"
        doc3.state = "CA"
        doc3.zipCode = "92101-1234"
        doc3.phoneNumber = "123-456-7890"
        
        doc4.name = "Elton John"
        doc4.specialty = "Geriatrics"
        doc4.streetAddress = "123 Elton Street"
        doc4.city = "San Diego"
        doc4.state = "CA"
        doc4.zipCode = "92101-1234"
        doc4.phoneNumber = "123-456-7890"
        
        doc5.name = "Mary Poppins"
        doc5.specialty = "Orthopedics"
        doc5.streetAddress = "123 Poppins Street"
        doc5.city = "San Diego"
        doc5.state = "CA"
        doc5.zipCode = "92101-1234"
        doc5.phoneNumber = "123-456-7890"
        
        doc6.name = "Mickey Mouse"
        doc6.specialty = "Radiology"
        doc6.streetAddress = "123 Disney Street"
        doc6.city = "San Diego"
        doc6.state = "CA"
        doc6.zipCode = "92101-1234"
        doc6.phoneNumber = "123-456-7890"
        
        doctorArray.append(doc1)
        doctorArray.append(doc2)
        doctorArray.append(doc3)
        doctorArray.append(doc4)
        doctorArray.append(doc5)
        doctorArray.append(doc6)
        
        print(doctorArray[2].name)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return doctorArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorCell", for: indexPath)

        // Configure the cell...
        let cellLbl = cell.viewWithTag(1) as! UILabel
        
        cellLbl.text = doctorArray[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.TableView.CellHeight
    }
    
    override func viewWillAppear(_ animated:Bool) {
       super.viewWillAppear(animated)
       tableView.reloadData()
        print(doctorArray[2].name)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDoctorInfo" {
            let seg = segue.destination as! DoctorDetailsViewController
            seg.passedInformation = selectedInformation
            seg.passedDoctorArrayIndex = doctorArrayIndex
            seg.hidesBottomBarWhenPushed = true
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedInformation = doctorArray[indexPath.row]
        doctorArrayIndex = indexPath.row
        self.performSegue(withIdentifier: "showDoctorInfo", sender: self)
    }
    
    @IBAction func showAddDoctor(_ sender: Any) {
        performSegue(withIdentifier: "showAddDoctor", sender: self)
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
