//
//  SecondViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 9/29/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profile = Profile()
    
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
        
//        profile.firstName = "Kermit"
//        profile.lastName = "The Frog"
//        profile.email = "kermit@gmail.com"
//        profile.password = "NotEasyBeingGreen123"
        
        nameLabel.text = profile.firstName + " " + profile.lastName
        emailLabel.text = profile.email
        passwordLabel.text = profile.password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditProfile" {
            
            let editProfileView = segue.destination as! EditProfileViewController
            
            editProfileView.editPassedInformation = profile
        }
        
        if segue.identifier == "showEditTimes" {
            
            let editTimesView = segue.destination as! EditTimesViewController
            
            editTimesView.editTimesPassedInformation = profile
        }
    }
    
    @IBAction func showEditProfile(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditProfile", sender: self)
    }
    
    @IBAction func showEditTimes(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditTimes", sender: self)
    }
    


}

