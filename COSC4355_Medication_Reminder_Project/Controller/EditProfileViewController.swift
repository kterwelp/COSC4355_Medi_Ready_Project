//
//  EditProfileViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

protocol UpdateProfile {
    func updateProfile()
}

class EditProfileViewController: UIViewController {
    
    var editPassedInformation = Profile()
    
    var delegateVar: UpdateProfile?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstNameTextField.text = editPassedInformation.firstName
        lastNameTextField.text = editPassedInformation.lastName
        emailTextField.text = editPassedInformation.email
        passwordTextField.text = editPassedInformation.password
        confirmPasswordTextField.text = editPassedInformation.password
    }
    
    @IBAction func cancelEdit(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneEditing(_ sender: Any) {
        
        guard firstNameTextField.text!.count > 0 else {
                let missingNameAlert = UIAlertController(title: "Missing First Name!", message: "Please enter your first name", preferredStyle: .alert)
                
                missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                
                self.present(missingNameAlert, animated: true)
                
                return
            }
            
            guard lastNameTextField.text!.count > 0 else {
                let missingNameAlert = UIAlertController(title: "Missing Last Name!", message: "Please enter your last name", preferredStyle: .alert)
                
                missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                
                self.present(missingNameAlert, animated: true)
                
                return
            }
            
            guard emailTextField.text!.count > 0 else {
                let missingNameAlert = UIAlertController(title: "Missing Email!", message: "Please enter your email", preferredStyle: .alert)
                
                missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                
                self.present(missingNameAlert, animated: true)
                
                return
            }
            
            guard passwordTextField.text!.count > 0 else {
                let missingNameAlert = UIAlertController(title: "Missing Password!", message: "Please enter your password", preferredStyle: .alert)
                
                missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                
                self.present(missingNameAlert, animated: true)
                
                return
            }
            
            guard confirmPasswordTextField.text!.count > 0 else {
                let missingNameAlert = UIAlertController(title: "Missing Password Confirmation!", message: "Please enter your password again for confirmation", preferredStyle: .alert)
                
                missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                
                self.present(missingNameAlert, animated: true)
                
                return
            }
            
            guard confirmPasswordTextField.text! == passwordTextField.text! else {
                let missingNameAlert = UIAlertController(title: "Passwords Do Not Match!", message: "Your passwords do not match. Please try again.", preferredStyle: .alert)
                
                missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                
                self.present(missingNameAlert, animated: true)
                
                return
            }
        
        guard emailTextField.text != "user@gmail.com" else {
            let missingNameAlert = UIAlertController(title: "Cannot Change Default User Information!", message: "Default user information cannot be changed but 1 account can be created, saved and updated", preferredStyle: .alert)
            
            missingNameAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            self.present(missingNameAlert, animated: true)
            
            return
        }
            
            if firstNameTextField.text!.count > 0,
            lastNameTextField.text!.count > 0,
            emailTextField.text!.count > 0,
            passwordTextField.text!.count > 0,
            confirmPasswordTextField.text!.count > 0
            {
                
                let profileUD = UserDefaults.standard
                
                profileUD.set(self.emailTextField.text, forKey: "currentUser")
                profileUD.set(self.firstNameTextField.text, forKey: "firstName")
                profileUD.set(self.lastNameTextField.text, forKey: "lastName")
                profileUD.set(self.emailTextField.text, forKey: "email")
                profileUD.set(self.passwordTextField.text, forKey: "password")
                
                delegateVar?.updateProfile()
            }
        
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
