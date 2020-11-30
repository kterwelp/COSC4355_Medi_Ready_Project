//
//  SecondViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 9/29/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UpdateProfile {
    
    var profile = Profile()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
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
            editProfileView.delegateVar = self
            editProfileView.editPassedInformation = profile
        }
    }
    
    @IBAction func showEditProfile(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditProfile", sender: self)
    }
    
    @IBAction func showEditTimes(_ sender: Any) {
        
        performSegue(withIdentifier: "showEditTimes", sender: self)
    }
    
    func updateProfile() {
        let profileUD = UserDefaults.standard
        
        profile.firstName = profileUD.string(forKey: "firstName")!
        profile.lastName = profileUD.string(forKey: "lastName")!
        profile.email = profileUD.string(forKey: "email")!
        profile.password = profileUD.string(forKey: "password")!
        
        nameLabel.text = profile.firstName + " " + profile.lastName
        emailLabel.text = profile.email
        passwordLabel.text = profile.password
    }

}

