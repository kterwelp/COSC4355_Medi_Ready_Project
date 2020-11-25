//
//  TableViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Jared Talbert on 10/18/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class MedicationListViewController: UITableViewController, AddMedication, UpdateMedTable {
    
    var tempMedications = [Medication]()
    var selectedInformation = Medication()
    var timeArray = [String]()
    var medArray = [Medication]()
    var medArrayIndex = 0
    
    var eightAMMedications = [Medication]()
    var twelvePMMedications = [Medication]()
    var twoPMMedications = [Medication]()
    var fourPMMedications = [Medication]()
    var eightPMMedications = [Medication]()
    
    /*
        TEMPORARY TESTING
        TO BE REMOVED
     */
    
//    let med1 = Medication()
//    let med2 = Medication()
//    let med3 = Medication()
//    let med4 = Medication()
//    let med5 = Medication()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
           TEMPORARY TESTING
           TO BE REMOVED
        */
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        
        let dateStr = formatter.string(from: date)
        
        timeArray = [dateStr, "8:00 AM", "12:00 PM", "2:00 PM", "4:00 PM", "8:00 PM"]
        
//        med1.name = "Amlodipine"
//        med1.numOfTabsPerDose = 2
//        med1.timesTakenDaily = 3
//        med1.dateFilled = "10-01-2020"
//        med1.numOfTabsAvailable = 60
//        med1.reason = "High blood pressure"
//        med1.doctorFirstName = "Harry"
//        med1.doctorLastName = "Potter"
//        med1.hasBeenTaken = true
//
//        medArray.append(med1)
//
//        med2.name = "Ativan"
//        med2.numOfTabsPerDose = 1
//        med2.timesTakenDaily = 1
//        med2.dateFilled = "10-21-2020"
//        med2.numOfTabsAvailable = 30
//        med2.reason = "Anxiety"
//        med2.doctorFirstName = "Mickey"
//        med2.doctorLastName = "Mouse"
//        med2.hasBeenTaken = false
//
//        medArray.append(med2)
//
//        med3.name = "Atorvastatin"
//        med3.numOfTabsPerDose = 3
//        med3.timesTakenDaily = 2
//        med3.dateFilled = "08-03-2020"
//        med3.numOfTabsAvailable = 90
//        med3.reason = "High cholesterol"
//        med3.doctorFirstName = "Luke"
//        med3.doctorLastName = "Skywalker"
//        med3.hasBeenTaken = true
//
//        medArray.append(med3)
//
//        med4.name = "Metformin"
//        med4.numOfTabsPerDose = 1
//        med4.timesTakenDaily = 2
//        med4.dateFilled = "09-09-2020"
//        med4.numOfTabsAvailable = 60
//        med4.reason = "Diabetes"
//        med4.doctorFirstName = "Katniss"
//        med4.doctorLastName = "Everdeen"
//        med4.hasBeenTaken = false
//
//        medArray.append(med4)
//
//        med5.name = "Tylenol"
//        med5.numOfTabsPerDose = 1
//        med5.timesTakenDaily = 4
//        med5.dateFilled = "09-09-2020"
//        med5.numOfTabsAvailable = 60
//        med5.reason = "Pain"
//        med5.doctorFirstName = "The"
//        med5.doctorLastName = "Grinch"
//        med5.hasBeenTaken = false
//
//        medArray.append(med5)
        
//        tempMedications.append(med1)
//        tempMedications.append(med2)
//        tempMedications.append(med3)
//        tempMedications.append(med4)
        
//        eightAMMedications.append(med1)
//        eightAMMedications.append(med3)
//        eightAMMedications.append(med4)
//        twelvePMMedications.append(med2)
//        twoPMMedications.append(med1)
//        eightPMMedications.append(med1)
//        eightPMMedications.append(med3)
//        eightPMMedications.append(med4)
        
//        for (index, med) in medArray.enumerated() {
//            sortMedsByTime(med: medArray[index])
//            print(med)
//        }
        
        
    }

    // MARK: - Table view data source

    // TODO: Use number of times meds taken per day to calc # of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return timeArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return timeArray[section]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        if section != 0 {
            view.tintColor = UIColor.init(red: 0.149, green: 0.729, blue: 0.933, alpha: 1.0)
            header.textLabel?.textAlignment = NSTextAlignment.left

        } else {
            header.textLabel?.textAlignment = NSTextAlignment.center
            view.tintColor = UIColor.init(red: 0.451, green: 0.824, blue: 0.953, alpha: 1.0)
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 0
        } else if section == 1 {
            return eightAMMedications.count
        } else if section == 2 {
            return twelvePMMedications.count
        } else if section == 3 {
            return twoPMMedications.count
        } else if section == 4 {
            return fourPMMedications.count
        } else if section == 5 {
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
        
        if indexPath.section == 1 {
            cellLabel.text = eightAMMedications[indexPath.row].name
        } else if indexPath.section == 2 {
            cellLabel.text = twelvePMMedications[indexPath.row].name
        } else if indexPath.section == 3 {
            cellLabel.text = twoPMMedications[indexPath.row].name
        } else if indexPath.section == 4 {
            cellLabel.text = fourPMMedications[indexPath.row].name
        } else if indexPath.section == 5 {
            cellLabel.text = eightPMMedications[indexPath.row].name
        }
        
        
        //      Code below is for checking of meds - Will look into options later
//        cell.accessoryType = tempMedications[indexPath.row].hasBeenTaken ? .checkmark : .none // applies a checkmark to the cell based on whether or not the medication has been taken today

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            print(indexPath)
            
            // Section 1 is 8AM time
            if indexPath.section == 1 {
                
                switch eightAMMedications[indexPath.row].timesTakenDaily {
                case 2:
                    let idxPath = removeMedication(tempMedArray: &eightPMMedications, section: 5, med: eightAMMedications[indexPath.row])
                    print(idxPath.row)
                    removeMedFromTableView(indexPath: idxPath)
                case 3:
                    let idxPath2PM = removeMedication(tempMedArray: &twoPMMedications, section: 3, med: eightAMMedications[indexPath.row])
                    print(idxPath2PM.row)
                    removeMedFromTableView(indexPath: idxPath2PM)
                    
                    let idxPath8PM = removeMedication(tempMedArray: &eightPMMedications, section: 5, med: eightAMMedications[indexPath.row])
                    print(idxPath8PM.row)
                    removeMedFromTableView(indexPath: idxPath8PM)
                case 4:
                    let idxPath12PM = removeMedication(tempMedArray: &twelvePMMedications, section: 2, med: eightAMMedications[indexPath.row])
                    print(idxPath12PM.row)
                    removeMedFromTableView(indexPath: idxPath12PM)
                    
                    let idxPath4PM = removeMedication(tempMedArray: &fourPMMedications, section: 4, med: eightAMMedications[indexPath.row])
                    print(idxPath4PM.row)
                    removeMedFromTableView(indexPath: idxPath4PM)
                    
                    let idxPath8PM = removeMedication(tempMedArray: &eightPMMedications, section: 5, med: eightAMMedications[indexPath.row])
                    print(idxPath8PM.row)
                    removeMedFromTableView(indexPath: idxPath8PM)
                default:
                    break
                }
                
                eightAMMedications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            // Section 2 is 12PM time - Only for 4 times daily - No switch statement
            } else if indexPath.section == 2 {
                
                let idxPath8AM = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: twelvePMMedications[indexPath.row])
                print(idxPath8AM.row)
                removeMedFromTableView(indexPath: idxPath8AM)
                
                let idxPath4PM = removeMedication(tempMedArray: &fourPMMedications, section: 4, med: twelvePMMedications[indexPath.row])
                print(idxPath4PM.row)
                removeMedFromTableView(indexPath: idxPath4PM)
                
                let idxPath8PM = removeMedication(tempMedArray: &eightPMMedications, section: 5, med: twelvePMMedications[indexPath.row])
                print(idxPath8PM.row)
                removeMedFromTableView(indexPath: idxPath8PM)
                
                twelvePMMedications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
             
            // Section 3 is 2PM time - Only for 3 times daily - No switch statement
            } else if indexPath.section == 3 {
                
                let idxPath8AM = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: twoPMMedications[indexPath.row])
                print(idxPath8AM.row)
                removeMedFromTableView(indexPath: idxPath8AM)
                
                let idxPath8PM = removeMedication(tempMedArray: &eightPMMedications, section: 5, med: twoPMMedications[indexPath.row])
                print(idxPath8PM.row)
                removeMedFromTableView(indexPath: idxPath8PM)
                
                twoPMMedications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
             
            // Section 4 is 4PM time - Only for 4 times daily - No switch statement
            } else if indexPath.section == 4 {
                
                let idxPath8AM = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: fourPMMedications[indexPath.row])
                print(idxPath8AM.row)
                removeMedFromTableView(indexPath: idxPath8AM)
                
                let idxPath12PM = removeMedication(tempMedArray: &twelvePMMedications, section: 2, med: fourPMMedications[indexPath.row])
                print(idxPath12PM.row)
                removeMedFromTableView(indexPath: idxPath12PM)
                
                let idxPath8PM = removeMedication(tempMedArray: &eightPMMedications, section: 5, med: fourPMMedications[indexPath.row])
                print(idxPath8PM.row)
                removeMedFromTableView(indexPath: idxPath8PM)
                
                fourPMMedications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
              
            // Section 5 is 8PM
            } else {
                
                switch eightPMMedications[indexPath.row].timesTakenDaily {
                case 2:
                    let idxPath = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: eightPMMedications[indexPath.row])
                    print(idxPath.row)
                    removeMedFromTableView(indexPath: idxPath)
                case 3:
                    let idxPath8AM = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: eightPMMedications[indexPath.row])
                    print(idxPath8AM.row)
                    removeMedFromTableView(indexPath: idxPath8AM)
                    
                    let idxPath2PM = removeMedication(tempMedArray: &twoPMMedications, section: 3, med: eightPMMedications[indexPath.row])
                    print(idxPath2PM.row)
                    removeMedFromTableView(indexPath: idxPath2PM)
                case 4:
                    let idxPath8AM = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: eightPMMedications[indexPath.row])
                    print(idxPath8AM.row)
                    removeMedFromTableView(indexPath: idxPath8AM)
                    
                    let idxPath12PM = removeMedication(tempMedArray: &twelvePMMedications, section: 2, med: eightPMMedications[indexPath.row])
                    print(idxPath12PM.row)
                    removeMedFromTableView(indexPath: idxPath12PM)
                    
                    let idxPath4PM = removeMedication(tempMedArray: &fourPMMedications, section: 4, med: eightPMMedications[indexPath.row])
                    print(idxPath4PM.row)
                    removeMedFromTableView(indexPath: idxPath4PM)
                default:
                    break
                }
                
                eightPMMedications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
//            if medArray[indexPath.row].timesTakenDaily > 1 {
//
//                let indexPath2 = removeAllRows(med: medArray[indexPath.row], section: indexPath.section)
//                //medArray.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//                removeMedFromTableView(indexPath: indexPath2)
//            }
//
//            //medArray.remove(at: indexPath.row)
//            eightAMMedications.remove(at: 0)
//            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
    // This can be removed if it is not used later
    func removeAllRows(med: Medication, section: Int) -> IndexPath {
                
        let indexPath = removeMedication(tempMedArray: &eightPMMedications, section: 4, med: med)
        // removeMedFromTableView(indexPath: indexPath)
        
        return indexPath
        
    }
    
    func removeMedication( tempMedArray: inout [Medication], section: Int, med: Medication) -> IndexPath {
        print("med: " + med.name)
        print("tempMedArray: " + tempMedArray[0].name)
        let index = tempMedArray.firstIndex(where: { $0.name == med.name })!
        tempMedArray.removeAll(where: { $0.name == med.name })
        return IndexPath(item: index, section: section)
        
    }
    
    func removeMedFromTableView(indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        if medArray.count > 1 {
            medArray.sort { $0.name < $1.name }
        }
       tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMedicationInfo" {
            let seg = segue.destination as! MedicationDetailsViewController
            seg.passedInformation = selectedInformation
            seg.delegateVar = self
//            seg.passedDoctorArrayIndex = doctorArrayIndex
//            seg.detailsDoctorArray = doctorArray
            seg.hidesBottomBarWhenPushed = true
        }
        
        if segue.identifier == "showAddMedication" {
            let addMedView = segue.destination as! AddMedicationViewController
            addMedView.delegateVar = self
            addMedView.hidesBottomBarWhenPushed = true
        }
        
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
        
        if indexPath.section == 1 {
            selectedInformation = eightAMMedications[indexPath.row]
            medArrayIndex = indexPath.row
        } else if indexPath.section == 2 {
            selectedInformation = twelvePMMedications[indexPath.row]
            medArrayIndex = indexPath.row
        } else if indexPath.section == 3 {
            selectedInformation = twoPMMedications[indexPath.row]
            medArrayIndex = indexPath.row
        } else if indexPath.section == 4 {
            selectedInformation = fourPMMedications[indexPath.row]
            medArrayIndex = indexPath.row
        } else if indexPath.section == 5 {
            selectedInformation = eightPMMedications[indexPath.row]
            medArrayIndex = indexPath.row
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
        performSegue(withIdentifier: "showAddMedication", sender: self)
    }
    
    @IBAction func showProfile(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showProfile", sender: self)
    }
    
    func sortMedsByTime(med: Medication) {
        switch med.timesTakenDaily {
        case 1:
            eightAMMedications.append(med)
            eightAMMedications.sort { $0.name < $1.name }
        case 2:
            eightAMMedications.append(med)
            eightPMMedications.append(med)
            eightAMMedications.sort { $0.name < $1.name }
            eightPMMedications.sort { $0.name < $1.name }
        case 3:
            eightAMMedications.append(med)
            twoPMMedications.append(med)
            eightPMMedications.append(med)
            eightAMMedications.sort { $0.name < $1.name }
            twoPMMedications.sort { $0.name < $1.name }
            eightPMMedications.sort { $0.name < $1.name }
        case 4:
            eightAMMedications.append(med)
            twelvePMMedications.append(med)
            fourPMMedications.append(med)
            eightPMMedications.append(med)
            eightAMMedications.sort { $0.name < $1.name }
            twelvePMMedications.sort { $0.name < $1.name }
            fourPMMedications.sort { $0.name < $1.name }
            eightPMMedications.sort { $0.name < $1.name }
        default:
            print("Medication timesTakenDaily value has no match!")
            return
        }
    }
    
    func removeMedFromTable(removedMed: Medication) {
        
        switch removedMed.timesTakenDaily {
        case 1:
            let idxPath = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: removedMed)
            removeMedFromTableView(indexPath: idxPath)
        case 2:
            let idxPath8AM = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: removedMed)
            removeMedFromTableView(indexPath: idxPath8AM)
            
            let idxPath8PM = removeMedication(tempMedArray: &eightPMMedications, section: 5, med: removedMed)
            removeMedFromTableView(indexPath: idxPath8PM)
        case 3:
            let idxPath8AM = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: removedMed)
            removeMedFromTableView(indexPath: idxPath8AM)
            
            let idxPath2PM = removeMedication(tempMedArray: &twoPMMedications, section: 3, med: removedMed)
            removeMedFromTableView(indexPath: idxPath2PM)
            
            let idxPath8PM = removeMedication(tempMedArray: &eightPMMedications, section: 5, med: removedMed)
            removeMedFromTableView(indexPath: idxPath8PM)
        case 4:
            let idxPath8AM = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: removedMed)
            removeMedFromTableView(indexPath: idxPath8AM)
            
            let idxPath12PM = removeMedication(tempMedArray: &twelvePMMedications, section: 2, med: removedMed)
            removeMedFromTableView(indexPath: idxPath12PM)
            
            let idxPath4PM = removeMedication(tempMedArray: &fourPMMedications, section: 4, med: removedMed)
            removeMedFromTableView(indexPath: idxPath4PM)
            
            let idxPath8PM = removeMedication(tempMedArray: &eightPMMedications, section: 5, med: removedMed)
            removeMedFromTableView(indexPath: idxPath8PM)
        default:
            break
        }
    }
    
    func addMedication(addedMed: Medication) {
        medArray.append(addedMed)
        sortMedsByTime(med: addedMed)
        if medArray.count > 1 {
             medArray.sort { $0.name < $1.name }
         }
        tableView.reloadData()
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
