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
        self.onceDaily = ""
        self.twiceDaily = []
        self.threeTimesDaily = []
        self.fourTimesDaily = []
    }
}
