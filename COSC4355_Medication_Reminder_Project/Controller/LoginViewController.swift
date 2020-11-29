//
//  LoginViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let profileUD = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func login(_ sender: Any) {
        
        guard emailTextField.text!.count > 0 else {
            
            let missingNameAlert = UIAlertController(title: "Missing Email!", message: "Please enter the email for your account", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        guard passwordTextField.text!.count > 0 else {
            
            let missingNameAlert = UIAlertController(title: "Missing Password!", message: "Please enter the password for your account", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        guard (emailTextField.text == "user@gmail.com" && passwordTextField.text == "password") || (emailTextField.text == profileUD.string(forKey: "email") && passwordTextField.text == profileUD.string(forKey: "password")) else {
            
            let missingNameAlert = UIAlertController(title: "Incorrect Username and Password!", message: "The username and password combination is incorrect.  Please try again.", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
        
        if emailTextField.text!.count > 0,
        passwordTextField.text!.count > 0 {
            
            if emailTextField.text == "user@gmail.com" {
                profileUD.set("user@gmail.com", forKey: "currentUser")
                profileUD.set("User", forKey: "firstNameUser")
                profileUD.set("Name", forKey: "lastNameUser")
                profileUD.set("user@gmail.com", forKey: "emailUser")
                profileUD.set("password", forKey: "passwordUser")
            } else {
                profileUD.set(emailTextField.text, forKey: "currentUser")
            }
            
            self.performSegue(withIdentifier: "showHome", sender: self)
        }
        
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
