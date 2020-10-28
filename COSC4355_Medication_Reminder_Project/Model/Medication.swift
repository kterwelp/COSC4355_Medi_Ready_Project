//
//  Medication.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Jared Talbert on 10/6/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import Foundation

class Medication {
    
    var name: String
    var numOfTabsPerDose: Int
    var timesTakenDaily: Int
    //Store as "2020-11-30" - Will help determine what date to remind about refill
    var dateFilled: String
    //Number of tabs patient has on hand - Will help determine when to remind about refill
    var numOfTabsAvailable: Int
    //Reason patient is taking the medication (diagnosis)
    var reason: String
    //Name of doctor who prescribed medication
    var doctorFirstName: String
    var doctorLastName: String
    var hasBeenTaken: Bool
    
    init() {
        self.name = ""
        self.numOfTabsPerDose = 0
        self.timesTakenDaily = 0
        self.dateFilled = ""
        self.numOfTabsAvailable = 0
        self.reason = ""
        self.doctorFirstName = ""
        self.doctorLastName = ""
        self.hasBeenTaken = false
    }
    
//    Include code below after deciding which fields are required
//    init(name: String, timesTakenDaily: Int, hasBeenTaken: Bool) {
//        self.name = name
//        self.timesTakenDaily = timesTakenDaily
//        self.hasBeenTaken = hasBeenTaken
//    }
    
}
