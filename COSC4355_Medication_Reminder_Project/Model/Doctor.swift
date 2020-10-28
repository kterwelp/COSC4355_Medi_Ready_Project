//
//  Doctor.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Jared Talbert on 10/6/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import Foundation

class Doctor {
    
    var firstName: String
    var lastName: String
    var specialty: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var phoneNumber: String
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.specialty = ""
        self.streetAddress = ""
        self.city = ""
        self.state = ""
        self.zipCode = ""
        self.phoneNumber = ""
    }
    
}
