//
//  AddAllergyViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit

class AddAllergyViewController: UIViewController {
    
    @IBOutlet weak var reactionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reactionTextView.layer.borderWidth = 1
        reactionTextView.layer.borderColor = UIColor.lightGray.cgColor
        reactionTextView.layer.cornerRadius = 6
    }
    
    @IBAction func addAllergy(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAddAllergy(_ sender: Any) {
        
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
