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
    // use an array of Times?
    var timesTakenDaily = [Int]() // store each time the med should be taken in an array
    
    init() {
        self.name = ""
        self.timesTakenDaily = [0]
    }
    
}
