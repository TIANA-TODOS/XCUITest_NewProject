//
//  BaseTests.swift
//  Depoza
//
//  Created by Tiana Todos on 13.12.16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class BaseTest : XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["isUITesting"]
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func waitForElementToAppear(format: String, element: AnyObject, time: Double){
        let exists = NSPredicate(format: format)
        expectation(for: exists, evaluatedWith:element, handler: nil)
        waitForExpectations(timeout: time, handler: nil)
    }
    
    func addingNewExpenses() {
        let summary = ExpensesSummary()
        summary.tapOnAddExpensesButton()
        let addExpenses = AddExpenses()
        addExpenses.typeAmount(amount: "199")
        addExpenses.selectClothesCategory()
        addExpenses.typeExpensesDescription(description: "Coat")
        addExpenses.tapOnDoneButton()
        
        summary.visible()
        
        let totalExpenses = summary.totalExpensesAmount()
        
        XCTAssert(totalExpenses == "199", "Toral amount is \(totalExpenses)")
        
    }
    
    func getFutureDate(daysFromToday: Int) -> (day : String, month : String){
        var components = DateComponents()
        components.setValue(daysFromToday, for: .day)
        
        let today = NSDate()
        let futureDate = NSCalendar.current.date(byAdding: components, to: today as Date)
        let futureDay = NSCalendar.current.component(.day, from: futureDate!)
        let futureDayString = String(futureDay)
        let futureMonth = NSCalendar.current.component( .month, from: futureDate!)
        
        let dateFormat = DateFormatter()
        let futureMonthString = dateFormat.shortMonthSymbols[futureMonth as Int - 1]
        
        return(futureDayString, futureMonthString )
    }

}
