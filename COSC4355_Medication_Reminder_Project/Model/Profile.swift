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
    var onceDaily: String
    var twiceDaily: [String]
    var threeTimesDaily: [String]
    var fourTimesDaily: [String]
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.password = ""
        self.onceDaily = "8:00 AM"
        self.twiceDaily = ["8:00 AM", "8:00 PM"]
        self.threeTimesDaily = ["8:00 AM", "2:00 PM", "8:00 PM"]
        self.fourTimesDaily = ["8:00 AM", "12:00 PM", "4:00PM", "8:00 PM"]
    }
}
