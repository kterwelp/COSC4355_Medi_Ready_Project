//
//  SecondViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 9/29/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user = Profile()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var onceDailyLabel: UILabel!
    @IBOutlet weak var twiceDailyLabel: UILabel!
    @IBOutlet weak var threeTimesDailyLabel: UILabel!
    @IBOutlet weak var fourTimesDailyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController!.navigationBar.tintColor = UIColor.systemIndigo
        
        user.firstName = "Kermit"
        user.lastName = "The Frog"
        user.email = "kermit@gmail.com"
        user.password = "NotEasyBeingGreen123"
        user.onceDaily = "12:00 PM"
        user.twiceDaily = ["8:00 AM", "8:00 PM"]
        user.threeTimesDaily = ["8:00 AM", "2:00 PM", "8:00 PM"]
        user.fourTimesDaily = ["8:00 AM", "12:00 PM", "4:00PM", "8:00 PM"]
        
        nameLabel.text = user.firstName + " " + user.lastName
        emailLabel.text = user.email
        passwordLabel.text = "********************"
        onceDailyLabel.text = "Once Daily: " + user.onceDaily
        twiceDailyLabel.text = "Twice Daily: " + user.twiceDaily[0] + ", " + user.twiceDaily[1]
        threeTimesDailyLabel.text = "Three Times Daily: " + user.threeTimesDaily[0] + ", " + user.threeTimesDaily[1] + ", " + user.threeTimesDaily[2]
        fourTimesDailyLabel.text = "Four Times Daily: " + user.fourTimesDaily[0] + ", " + user.fourTimesDaily[1] + ", " + user.fourTimesDaily[2] + ", " + user.fourTimesDaily[3]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditProfile" {
            
            let editProfileView = segue.destination as! EditProfileViewController
            
            editProfileView.editPassedInformation = user
        }
        
        if segue.identifier == "showEditTimes" {
            
            let editTimesView = segue.destination as! EditTimesViewController
            
            editTimesView.editTimesPassedInformation = user
        }
    }
    
    @IBAction func showEditProfile(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditProfile", sender: self)
    }
    
    @IBAction func showEditTimes(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditTimes", sender: self)
    }
    


}

