//
//  Profile.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/28/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import Foundation

class Profile {
    
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var medications: [Medication]
    var doctors: [Doctor]
    var allergies: [Allergy]
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.password = ""
        self.medications = []
        self.doctors = []
        self.allergies = []
    }
}
