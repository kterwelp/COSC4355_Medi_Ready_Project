//
//  TableViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Jared Talbert on 10/18/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit
import UserNotifications

class MedicationListViewController: UITableViewController, AddMedication, UpdateMedTable {
    
    var tempMedications = [Medication]()
    var selectedInformation = Medication()
    var timeArray = [String]()
    var profile = Profile()
    var medSet = Set<String>()
    //medArray is not being used and can be removed later
    var medArray = [Medication]()
    // Is medArrayIndex being used???
    var medArrayIndex = 0
    
    var eightAMMedications = [Medication]()
    var twelvePMMedications = [Medication]()
    var twoPMMedications = [Medication]()
    var fourPMMedications = [Medication]()
    var eightPMMedications = [Medication]()
    
    let content8AM = UNMutableNotificationContent()
    let content12PM = UNMutableNotificationContent()
    let content2PM = UNMutableNotificationContent()
    let content4PM = UNMutableNotificationContent()
    let content8PM = UNMutableNotificationContent()
    let contentRefill = UNMutableNotificationContent()
    
    // *** Change the numbers below to test medication notifications at different times ***
    // *** Use 24-hour clock for PM times - Example: 5PM = 17 ***
    let eightAMHour = 23
    let eightAMMinute = 55
    let eightAMSecond = 0
    
    let twelvePMHour = 22
    let twelvePMMinute = 59
    let twelvePMSecond = 0
    
    let twoPMHour = 23
    let twoPMMinute = 20
    let twoPMSecond = 0
    
    let fourPMHour = 23
    let fourPMMinute = 01
    let fourPMSecond = 0
    
    let eightPMHour = 23
    let eightPMMinute = 56
    let eightPMSecond = 0
    
    let refillHour = 1
    let refillMinute = 19
    let refillSecond = 0
    
    /*
        TEMPORARY TESTING
        TO BE REMOVED
     */
    
    let med1 = Medication()
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
        
        let results8AM = update8AMContent()
        eightAMNotification(currDate: date, title: results8AM.title, body: results8AM.body)
        
        let results12PM = update12PMContent()
        twelvePMNotification(currDate: date, title: results12PM.title, body: results12PM.body)
        
        let results2PM = update2PMContent()
        twoPMNotification(currDate: date, title: results2PM.title, body: results2PM.body)
        
        let results4PM = update4PMContent()
        fourPMNotification(currDate: date, title: results4PM.title, body: results4PM.body)
        
        let results8PM = update8PMContent()
        eightPMNotification(currDate: date, title: results8PM.title, body: results8PM.body)
        
//        med1.name = "Amlodipine"
//        med1.numOfTabsPerDose = 2
//        med1.timesTakenDaily = 3
//        med1.dateFilled = "10-01-2020"
//        med1.numOfTabsAvailable = 59
//        med1.reason = "High blood pressure"
//        med1.doctorFirstName = "Harry"
//        med1.doctorLastName = "Potter"
//        med1.hasBeenTaken = true
        
        updateRefillNotification()
        
        let profileUD = UserDefaults.standard
        
        if profileUD.string(forKey: "currentUser") == "user@gmail.com" {
            profile.firstName = profileUD.string(forKey: "firstNameUser")!
            profile.lastName = profileUD.string(forKey: "lastNameUser")!
            profile.email = profileUD.string(forKey: "emailUser")!
            profile.password = profileUD.string(forKey: "passwordUser")!
        } else {
            profile.firstName = profileUD.string(forKey: "firstName")!
            profile.lastName = profileUD.string(forKey: "lastName")!
            profile.email = profileUD.string(forKey: "email")!
            profile.password = profileUD.string(forKey: "password")!
        }
        
//        calculateRefillDate(med: med1)
        
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
                
                let tempMed = eightAMMedications[indexPath.row]
                eightAMMedications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                medSet.remove(tempMed.name.lowercased())
                updateMedNotificationMsg(addedMed: tempMed)
                updateRefillNotification()
                
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
                
                let tempMed = twelvePMMedications[indexPath.row]
                twelvePMMedications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                medSet.remove(tempMed.name.lowercased())
                updateMedNotificationMsg(addedMed: tempMed)
                updateRefillNotification()
             
            // Section 3 is 2PM time - Only for 3 times daily - No switch statement
            } else if indexPath.section == 3 {
                
                let idxPath8AM = removeMedication(tempMedArray: &eightAMMedications, section: 1, med: twoPMMedications[indexPath.row])
                print(idxPath8AM.row)
                removeMedFromTableView(indexPath: idxPath8AM)
                
                let idxPath8PM = removeMedication(tempMedArray: &eightPMMedications, section: 5, med: twoPMMedications[indexPath.row])
                print(idxPath8PM.row)
                removeMedFromTableView(indexPath: idxPath8PM)
                
                let tempMed = twoPMMedications[indexPath.row]
                twoPMMedications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                medSet.remove(tempMed.name.lowercased())
                updateMedNotificationMsg(addedMed: tempMed)
                updateRefillNotification()
             
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
                
                let tempMed = fourPMMedications[indexPath.row]
                fourPMMedications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                medSet.remove(tempMed.name.lowercased())
                updateMedNotificationMsg(addedMed: tempMed)
                updateRefillNotification()
              
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
                
                let tempMed = eightPMMedications[indexPath.row]
                eightPMMedications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                medSet.remove(tempMed.name.lowercased())
                updateMedNotificationMsg(addedMed: tempMed)
                updateRefillNotification()
                
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
//        print("tempMedArray: " + tempMedArray[0].name)
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
            addMedView.medSetAdd = medSet
            addMedView.hidesBottomBarWhenPushed = true
        }
        
        if segue.identifier == "showProfile" {

            let profileView = segue.destination as! ProfileViewController
            profileView.profile = profile
            profileView.hidesBottomBarWhenPushed = true
    
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
    
    func removeMedFromTable(removedMed: Medication, prevTimesTakenDaily: Int) {
        
        switch prevTimesTakenDaily {
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
    
    func eightAMNotification(currDate: Date, title: String, body: String) {
        
        let center = UNUserNotificationCenter.current()
        
        let options: UNAuthorizationOptions = [.alert, .sound]
        
        center.requestAuthorization(options: options) { (granted, error) in
            
            if error != nil {
                print(error!)
            }
            
            if !granted {
                print("Access was not granted!")
            } else {
                
                self.content8AM.title = title
                self.content8AM.body = body
                self.content8AM.sound = UNNotificationSound.default

                let gregorian = Calendar(identifier: .gregorian)
                var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currDate)

                components.hour = self.eightAMHour
                components.minute = self.eightAMMinute
                components.second = self.eightAMSecond

                let date = gregorian.date(from: components)!

                let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)

                let request = UNNotificationRequest(identifier: "eightAMNotification", content: self.content8AM, trigger: trigger)

                UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
                    if let error = error {
                        print(error)
                    }
                })
            }
        }
        
    }
    
    func twelvePMNotification(currDate: Date, title: String, body: String) {
        
        let center = UNUserNotificationCenter.current()
        
        let options: UNAuthorizationOptions = [.alert, .sound]
        
        center.requestAuthorization(options: options) { (granted, error) in
            
            if error != nil {
                print(error!)
            }
            
            if !granted {
                print("Access was not granted!")
            } else {
                
                self.content12PM.title = title
                self.content12PM.body = body
                self.content12PM.sound = UNNotificationSound.default

                let gregorian = Calendar(identifier: .gregorian)
                var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currDate)

                components.hour = self.twelvePMHour
                components.minute = self.twelvePMMinute
                components.second = self.twelvePMSecond

                let date = gregorian.date(from: components)!

                let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)

                let request = UNNotificationRequest(identifier: "twelvePMNotification", content: self.content12PM, trigger: trigger)

                UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
                    if let error = error {
                        print(error)
                    }
                })
            }
        }
    }
    
    func twoPMNotification(currDate: Date, title: String, body: String) {
        
        let center = UNUserNotificationCenter.current()
        
        let options: UNAuthorizationOptions = [.alert, .sound]
        
        center.requestAuthorization(options: options) { (granted, error) in
            
            if error != nil {
                print(error!)
            }
            
            if !granted {
                print("Access was not granted!")
            } else {
                
                self.content2PM.title = title
                self.content2PM.body = body
                self.content2PM.sound = UNNotificationSound.default

                let gregorian = Calendar(identifier: .gregorian)
                var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currDate)

                components.hour = self.twoPMHour
                components.minute = self.twoPMMinute
                components.second = self.twoPMSecond

                let date = gregorian.date(from: components)!

                let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)

                let request = UNNotificationRequest(identifier: "twoPMNotification", content: self.content2PM, trigger: trigger)

                UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
                    if let error = error {
                        print(error)
                    }
                })
            }
        }
    }
    
    func fourPMNotification(currDate: Date, title: String, body: String) {
        
        let center = UNUserNotificationCenter.current()
        
        let options: UNAuthorizationOptions = [.alert, .sound]
        
        center.requestAuthorization(options: options) { (granted, error) in
            
            if error != nil {
                print(error!)
            }
            
            if !granted {
                print("Access was not granted!")
            } else {
                
                self.content4PM.title = title
                self.content4PM.body = body
                self.content4PM.sound = UNNotificationSound.default

                let gregorian = Calendar(identifier: .gregorian)
                var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currDate)

                components.hour = self.fourPMHour
                components.minute = self.fourPMMinute
                components.second = self.fourPMSecond

                let date = gregorian.date(from: components)!

                let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)

                let request = UNNotificationRequest(identifier: "fourPMNotification", content: self.content4PM, trigger: trigger)

                UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
                    if let error = error {
                        print(error)
                    }
                })
            }
        }
    }
    
    func eightPMNotification(currDate: Date, title: String, body: String) {
        
        let center = UNUserNotificationCenter.current()
        
        let options: UNAuthorizationOptions = [.alert, .sound]
        
        center.requestAuthorization(options: options) { (granted, error) in
            
            if error != nil {
                print(error!)
            }
            
            if !granted {
                print("Access was not granted!")
            } else {
                
                self.content8PM.title = title
                self.content8PM.body = body
                self.content8PM.sound = UNNotificationSound.default

                let gregorian = Calendar(identifier: .gregorian)
                var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currDate)

                components.hour = self.eightPMHour
                components.minute = self.eightPMMinute
                components.second = self.eightPMSecond

                let date = gregorian.date(from: components)!

                let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)

                let request = UNNotificationRequest(identifier: "eightPMNotification", content: self.content8PM, trigger: trigger)

                UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
                    if let error = error {
                        print(error)
                    }
                })
            }
        }
    }
    
    func addMedication(addedMed: Medication) {
        medArray.append(addedMed)
        sortMedsByTime(med: addedMed)
        medSet.insert(addedMed.name.lowercased())
        updateMedNotificationMsg(addedMed: addedMed)
        updateRefillNotification()
        if medArray.count > 1 {
             medArray.sort { $0.name < $1.name }
         }
        tableView.reloadData()
    }
    
    func updateMedNotificationMsg(addedMed: Medication) {
        
        switch addedMed.timesTakenDaily {
        case 1:
            let results = update8AMContent()
            
            let date = Date()
            eightAMNotification(currDate: date, title: results.title, body: results.body)
        case 2:
            let results8AM = update8AMContent()
            let results8PM = update8PMContent()
            
            let date = Date()
            eightAMNotification(currDate: date, title: results8AM.title, body: results8AM.body)
            eightPMNotification(currDate: date, title: results8PM.title, body: results8PM.body)
        case 3:
            let results8AM = update8AMContent()
            let results2PM = update2PMContent()
            let results8PM = update8PMContent()
            
            let date = Date()
            eightAMNotification(currDate: date, title: results8AM.title, body: results8AM.body)
            twoPMNotification(currDate: date, title: results2PM.title, body: results2PM.body)
            eightPMNotification(currDate: date, title: results8PM.title, body: results8PM.body)
        case 4:
            let results8AM = update8AMContent()
            let results12PM = update12PMContent()
            let results4PM = update4PMContent()
            let results8PM = update8PMContent()
            
            let date = Date()
            eightAMNotification(currDate: date, title: results8AM.title, body: results8AM.body)
            twelvePMNotification(currDate: date, title: results12PM.title, body: results12PM.body)
            fourPMNotification(currDate: date, title: results4PM.title, body: results4PM.body)
            eightPMNotification(currDate: date, title: results8PM.title, body: results8PM.body)
        default:
            break
        }
    }
    
    func update8AMContent() -> (title: String, body: String) {
        
        if eightAMMedications.count == 0 {
            return("No Medications at 8AM!", "There are no 8AM medications in your schedule")
        } else {
            content8AM.title = "Time to Take 8AM Medications!"
            
            for (index, food) in eightAMMedications.enumerated() {
                
                if index == 0 {
                    content8AM.body = "Take the following medications: \(food.name)"
                } else {
                    content8AM.body += ", \(food.name)"
                }
            }
            
            return(content8AM.title, content8AM.body)
        }
    }
    
    func update12PMContent() -> (title: String, body: String) {
        
        if twelvePMMedications.count == 0 {
            return("No Medications at 12PM!", "There are no 12PM medications in your schedule")
        } else {
            
            content12PM.title = "Time to Take 12PM Medications!"
            
            for (index, food) in twelvePMMedications.enumerated() {
                
                if index == 0 {
                    content12PM.body = "Take the following medications: \(food.name)"
                } else {
                    content12PM.body += ", \(food.name)"
                }
            }
            
            return(content12PM.title, content12PM.body)
        }
        
    }
    
    func update2PMContent() -> (title: String, body: String) {
        
        if twoPMMedications.count == 0 {
            return("No Medications at 2PM!", "There are no 2PM medications in your schedule")
        } else {
            
            content2PM.title = "Time to Take 2PM Medications!"
            
            for (index, food) in twoPMMedications.enumerated() {
                
                if index == 0 {
                    content2PM.body = "Take the following medications: \(food.name)"
                } else {
                    content2PM.body += ", \(food.name)"
                }
            }
            
            return(content2PM.title, content2PM.body)
        }
        
    }
    
    func update4PMContent() -> (title: String, body: String) {
        
        if fourPMMedications.count == 0 {
            return("No Medications at 4PM!", "There are no 4PM medications in your schedule")
        } else {
            
            content4PM.title = "Time to Take 4PM Medications!"
            
            for (index, food) in fourPMMedications.enumerated() {
                
                if index == 0 {
                    content4PM.body = "Take the following medications: \(food.name)"
                } else {
                    content4PM.body += ", \(food.name)"
                }
            }
            
            return(content4PM.title, content4PM.body)
        }
        
    }
    
    func update8PMContent() -> (title: String, body: String) {
        
        if eightPMMedications.count == 0 {
            return("No Medications at 8PM!", "There are no 8PM medications in your schedule")
        } else {
            
            content8PM.title = "Time to Take 8PM Medications!"
            
            for (index, food) in eightPMMedications.enumerated() {
                
                if index == 0 {
                    content8PM.body = "Take the following medications: \(food.name)"
                } else {
                    content8PM.body += ", \(food.name)"
                }
            }
            
            return(content8PM.title, content8PM.body)
        }
        
    }
    
    func updateRefillNotification() {
        var refills = [String: Date]()
        
        let todayDate = Date()
        let todayDateStr = formatDateString(date: todayDate)
        
        var refillTitle = "Date Today: \(todayDateStr)\n\nUpcoming Refill Dates:\n"
        
       // print(dateFormatter.string(from: refillDate))
        
        if eightAMMedications.count > 0 {
            for medication in eightAMMedications {
                
                let refillDate = calculateRefillDate(med: medication)
                refills[medication.name] = refillDate
            }
            
            let sortedRefillsByDate = refills.sorted { $0.1 < $1.1 }
            
            print(sortedRefillsByDate)
            
            for refill in sortedRefillsByDate {
                let date = formatDateString(date: refill.value)
                refillTitle += "\(refill.key): Refill by \(date)\n"
            }
            
        } else {
            refillTitle += "No upcoming medication refills."
        }
        
        print(refillTitle)
        
        let center = UNUserNotificationCenter.current()
        
        let options: UNAuthorizationOptions = [.alert, .sound]
        
        center.requestAuthorization(options: options) { (granted, error) in
            
            if error != nil {
                print(error!)
            }
            
            if !granted {
                print("Access was not granted!")
            } else {
                
                self.contentRefill.title = "Daily Refill Reminder"
                self.contentRefill.body = refillTitle
                self.contentRefill.sound = UNNotificationSound.default

                let currDate = Date()
                
                let gregorian = Calendar(identifier: .gregorian)
                var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currDate)

                components.hour = self.refillHour
                components.minute = self.refillMinute
                components.second = self.refillSecond

                let date = gregorian.date(from: components)!

                let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)

                let request = UNNotificationRequest(identifier: "refillNotification", content: self.contentRefill, trigger: trigger)

                UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
                    if let error = error {
                        print(error)
                    }
                })
            }
        }
    }
    
    func calculateRefillDate(med: Medication) -> Date {
        switch med.timesTakenDaily {
        case 1:
            let numDaysLeft = med.numOfTabsAvailable / (med.numOfTabsPerDose * med.timesTakenDaily)
            let refillDay = numDaysLeft - 5
            
            let formattedDate = formatDate(date: med.dateFilled)
            let refillDate = Calendar.current.date(byAdding: .day, value: refillDay, to: formattedDate)!
            
            return refillDate
            
        case 2:
            let numDaysLeft = med.numOfTabsAvailable / (med.numOfTabsPerDose * med.timesTakenDaily)
            let refillDay = numDaysLeft - 5
            
            let formattedDate = formatDate(date: med.dateFilled)
            let refillDate = Calendar.current.date(byAdding: .day, value: refillDay, to: formattedDate)!
            
            return refillDate
            
        case 3:
            let numDaysLeft = med.numOfTabsAvailable / (med.numOfTabsPerDose * med.timesTakenDaily)
            let refillDay = numDaysLeft - 5
            
            let formattedDate = formatDate(date: med.dateFilled)
            let refillDate = Calendar.current.date(byAdding: .day, value: refillDay, to: formattedDate)!
            
            return refillDate
            
        case 4:
            let numDaysLeft = med.numOfTabsAvailable / (med.numOfTabsPerDose * med.timesTakenDaily)
            let refillDay = numDaysLeft - 5
            
            let formattedDate = formatDate(date: med.dateFilled)
            let refillDate = Calendar.current.date(byAdding: .day, value: refillDay, to: formattedDate)!
            
            return refillDate
            
        default:
            return Date()
        }
    }
    
    func formatDate(date: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM-dd-yyyy"
        if let date = dateFormatter.date(from: date) {
            return date
        }
        
        return Date()
    }
    
    func formatDateString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        return dateFormatter.string(from: date)
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
