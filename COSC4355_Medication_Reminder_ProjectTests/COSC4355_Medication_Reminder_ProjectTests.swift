//
//  COSC4355_Medication_Reminder_ProjectTests.swift
//  COSC4355_Medication_Reminder_ProjectTests
//
//  Created by Kevin Terwelp on 9/29/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import XCTest
@testable import COSC4355_Medication_Reminder_Project

class COSC4355_Medication_Reminder_ProjectTests: XCTestCase {
    
    var sutMedList: MedicationListViewController!
    var sutMed: Medication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sutMedList = MedicationListViewController()
        sutMed = Medication()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sutMedList = nil
        sutMed = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MedicationListView Controller - formatDate function
    func testFormatDate() {
        
        // 1. Given
        let dateStr = "11-1-2020"
        var date: Date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let dateConfirm = dateFormatter.date(from: "11-01-2020")

        // 2. When
        date = sutMedList.formatDate(date: dateStr)
        
        // 3. Then
        XCTAssertEqual(date, dateConfirm, "Date format returned is incorrect")
    }
    
    // MedicationListView Controller - formatDateString function
    func testFormatDateString() {
        
        // 1. Given
        var dateStr: String
        let dateStrConfirm = "11-01-2020"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: "11-1-2020")
        
        // 2. When
        dateStr = sutMedList.formatDateString(date: date!)
        
        //3. Then
        XCTAssertEqual(dateStr, dateStrConfirm, "String date format returned is incorrect")
    }
    
    // MedicationListView Controller - calculateRefillDate - Medication taken 1 time daily
    func testCalculateRefillDate1TimeDaily() {
        
        // 1.Given
        sutMed.numOfTabsAvailable = 10
        sutMed.numOfTabsPerDose = 1
        sutMed.timesTakenDaily = 1
        sutMed.dateFilled = "11-1-2020"
        
        var refillDate: Date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let refillDateConfirm = dateFormatter.date(from: "11-6-2020")
        
        // 2. When
        refillDate = sutMedList.calculateRefillDate(med: sutMed)
        
        // 3. Then
        XCTAssertEqual(refillDate, refillDateConfirm, "Refill date calculated is incorrect")
    }
    
    // MedicationListView Controller - calculateRefillDate - Medication taken 2 times daily
    func testCalculateRefillDate2TimesDaily() {
        
        // 1.Given
        sutMed.numOfTabsAvailable = 20
        sutMed.numOfTabsPerDose = 1
        sutMed.timesTakenDaily = 2
        sutMed.dateFilled = "11-1-2020"
        
        var refillDate: Date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let refillDateConfirm = dateFormatter.date(from: "11-6-2020")
        
        // 2. When
        refillDate = sutMedList.calculateRefillDate(med: sutMed)
        
        // 3. Then
        XCTAssertEqual(refillDate, refillDateConfirm, "Refill date calculated is incorrect")
    }
    
    // MedicationListView Controller - calculateRefillDate - Medication taken 3 times daily
    func testCalculateRefillDate3TimesDaily() {
        
        // 1.Given
        sutMed.numOfTabsAvailable = 30
        sutMed.numOfTabsPerDose = 1
        sutMed.timesTakenDaily = 3
        sutMed.dateFilled = "11-1-2020"
        
        var refillDate: Date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let refillDateConfirm = dateFormatter.date(from: "11-6-2020")
        
        // 2. When
        refillDate = sutMedList.calculateRefillDate(med: sutMed)
        
        // 3. Then
        XCTAssertEqual(refillDate, refillDateConfirm, "Refill date calculated is incorrect")
    }
    
    // MedicationListView Controller - calculateRefillDate - Medication taken 4 times daily
    func testCalculateRefillDate4TimesDaily() {
        
        // 1.Given
        sutMed.numOfTabsAvailable = 40
        sutMed.numOfTabsPerDose = 1
        sutMed.timesTakenDaily = 4
        sutMed.dateFilled = "11-1-2020"
        
        var refillDate: Date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let refillDateConfirm = dateFormatter.date(from: "11-6-2020")
        
        // 2. When
        refillDate = sutMedList.calculateRefillDate(med: sutMed)
        
        // 3. Then
        XCTAssertEqual(refillDate, refillDateConfirm, "Refill date calculated is incorrect")
    }
    

}
