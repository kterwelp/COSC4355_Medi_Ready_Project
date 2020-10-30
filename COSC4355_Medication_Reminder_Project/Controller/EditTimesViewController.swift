//
//  EditTimesViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let timePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 125))//1
        timePicker.datePickerMode = .time //2
        timePicker.minuteInterval = 15
        self.inputView = timePicker //3
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}

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
        connectTextFields()
        
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
    
    func connectTextFields() {
        
        self.onceDailyTextField.setInputViewDatePicker(target: self, selector: #selector(onceTapDone))
        
        self.twiceDailyTextField1.setInputViewDatePicker(target: self, selector: #selector(twiceTapDone1))
        
        self.twiceDailyTextField2.setInputViewDatePicker(target: self, selector: #selector(twiceTapDone2))
        
        self.threeTimesDailyTextField1.setInputViewDatePicker(target: self, selector: #selector(threeTapDone1))
        
        self.threeTimesDailyTextField2.setInputViewDatePicker(target: self, selector: #selector(threeTapDone2))
        
        self.threeTimesDailyTextField3.setInputViewDatePicker(target: self, selector: #selector(threeTapDone3))
        
        self.fourTimesDailyTextField1.setInputViewDatePicker(target: self, selector: #selector(fourTapDone1))
        
        self.fourTimesDailyTextField2.setInputViewDatePicker(target: self, selector: #selector(fourTapDone2))
        
        self.fourTimesDailyTextField3.setInputViewDatePicker(target: self, selector: #selector(fourTapDone3))
        
        self.fourTimesDailyTextField4.setInputViewDatePicker(target: self, selector: #selector(fourTapDone4))
    }
    
    @objc func onceTapDone() {
        if let timePicker = self.onceDailyTextField.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.timeStyle = .short // 2-3
            self.onceDailyTextField.text = dateformatter.string(from: timePicker.date) //2-4
        }
        self.onceDailyTextField.resignFirstResponder() // 2-5
    }
    
    @objc func twiceTapDone1() {
        if let timePicker = self.twiceDailyTextField1.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.timeStyle = .short // 2-3
            self.twiceDailyTextField1.text = dateformatter.string(from: timePicker.date) //2-4
        }
        self.twiceDailyTextField1.resignFirstResponder() // 2-5
    }
    
    @objc func twiceTapDone2() {
        if let timePicker = self.twiceDailyTextField2.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.timeStyle = .short // 2-3
            self.twiceDailyTextField2.text = dateformatter.string(from: timePicker.date) //2-4
        }
        self.twiceDailyTextField2.resignFirstResponder() // 2-5
    }
    
    @objc func threeTapDone1() {
        if let timePicker = self.threeTimesDailyTextField1.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.timeStyle = .short // 2-3
            self.threeTimesDailyTextField1.text = dateformatter.string(from: timePicker.date) //2-4
        }
        self.threeTimesDailyTextField1.resignFirstResponder() // 2-5
    }
    
    @objc func threeTapDone2() {
        if let timePicker = self.threeTimesDailyTextField2.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.timeStyle = .short // 2-3
            self.threeTimesDailyTextField2.text = dateformatter.string(from: timePicker.date) //2-4
        }
        self.threeTimesDailyTextField2.resignFirstResponder() // 2-5
    }
    
    @objc func threeTapDone3() {
        if let timePicker = self.threeTimesDailyTextField3.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.timeStyle = .short // 2-3
            self.threeTimesDailyTextField3.text = dateformatter.string(from: timePicker.date) //2-4
        }
        self.threeTimesDailyTextField3.resignFirstResponder() // 2-5
    }
    
    @objc func fourTapDone1() {
        if let timePicker = self.fourTimesDailyTextField1.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.timeStyle = .short // 2-3
            self.fourTimesDailyTextField1.text = dateformatter.string(from: timePicker.date) //2-4
        }
        self.fourTimesDailyTextField1.resignFirstResponder() // 2-5
    }
    
    @objc func fourTapDone2() {
        if let timePicker = self.fourTimesDailyTextField2.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.timeStyle = .short // 2-3
            self.fourTimesDailyTextField2.text = dateformatter.string(from: timePicker.date) //2-4
        }
        self.fourTimesDailyTextField2.resignFirstResponder() // 2-5
    }
    
    @objc func fourTapDone3() {
        if let timePicker = self.fourTimesDailyTextField3.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.timeStyle = .short // 2-3
            self.fourTimesDailyTextField3.text = dateformatter.string(from: timePicker.date) //2-4
        }
        self.fourTimesDailyTextField3.resignFirstResponder() // 2-5
    }
    
    @objc func fourTapDone4() {
        if let timePicker = self.fourTimesDailyTextField4.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.timeStyle = .short // 2-3
            self.fourTimesDailyTextField4.text = dateformatter.string(from: timePicker.date) //2-4
        }
        self.fourTimesDailyTextField4.resignFirstResponder() // 2-5
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
