//
//  EditTimesViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class EditTimesViewController: UIViewController {
    
    var editTimesPassedInformation = Profile()
    
    @IBOutlet weak var onceDailyTextField: UITextField!
    @IBOutlet weak var twiceDailyTextField1: UITextField!
    @IBOutlet weak var twiceDailyTextField2: UITextField!
    @IBOutlet weak var threeTimesDailyTextField1: UITextField!
    @IBOutlet weak var threeTimesDailyTextField2: UITextField!
    @IBOutlet weak var threeTimesDailyTextField3: UITextField!
    @IBOutlet weak var fourTimesDailyTextField1: UITextField!
    @IBOutlet weak var fourTimesDailyTextField2: UITextField!
    @IBOutlet weak var fourTimesDailyTextField3: UITextField!
    @IBOutlet weak var fourTimesDailyTextField4: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        onceDailyTextField.text = editTimesPassedInformation.onceDaily
        twiceDailyTextField1.text = editTimesPassedInformation.twiceDaily[0]
        twiceDailyTextField2.text = editTimesPassedInformation.twiceDaily[1]
        threeTimesDailyTextField1.text = editTimesPassedInformation.threeTimesDaily[0]
        threeTimesDailyTextField2.text = editTimesPassedInformation.threeTimesDaily[1]
        threeTimesDailyTextField3.text = editTimesPassedInformation.threeTimesDaily[2]
        fourTimesDailyTextField1.text = editTimesPassedInformation.fourTimesDaily[0]
        fourTimesDailyTextField2.text = editTimesPassedInformation.fourTimesDaily[1]
        fourTimesDailyTextField3.text = editTimesPassedInformation.fourTimesDaily[2]
        fourTimesDailyTextField4.text = editTimesPassedInformation.fourTimesDaily[3]
    }
    
    @IBAction func cancelEditTimes(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneEditingTimes(_ sender: Any) {
        
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
