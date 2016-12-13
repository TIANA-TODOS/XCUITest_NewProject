//
//  DepozaUITests.swift
//  DepozaUITests
//
//  Created by Tiana Todos on 12/11/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class DepozaUITests: XCTestCase {
    let app = XCUIApplication()
    let tablesQuery = XCUIApplication().tables
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["isUITesting"]
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddingExpences() {
        
      
        app.buttons["add_button"].tap()
        
            tablesQuery.textFields["enter_amount"].typeText("199")
            tablesQuery.staticTexts["Clothes"].tap()
        
        let typeDescription = tablesQuery.textFields["enter_description"]
            typeDescription.tap()
            typeDescription.typeText("coat")
        
        app.navigationBars["Add Expense"].buttons["Done"].tap()
        
        let total_expenses_amount = tablesQuery.staticTexts["total_expenses_amount"].label
        XCTAssert(total_expenses_amount == "199", "actual expenses \(total_expenses_amount)")
    }
    
    func testDeletingExpenses(){
        testAddingExpences()
        
        let descriptionCell = app.tables.staticTexts["coat"]
        waitForElementToAppear(format: "isHittable == true", element: descriptionCell, time: 3.0)
        descriptionCell.tap()
        
        let trashButton = app.navigationBars["Expense"].buttons["Trash"]
        trashButton.tap()
        
        let allertMessage = app.alerts["Delete transaction?"].buttons["Delete"]
        allertMessage.tap()
        
        let actual = tablesQuery["0"].staticTexts["total_expenses_amount"].label
        XCTAssert(actual == "0", "Total amount is \(actual)")
        
        waitForElementToAppear(format: "self.count = 1", element: tablesQuery, time: 3.0)
        XCTAssertEqual(tablesQuery.cells.count, 0, "found instead: \(tablesQuery.cells.debugDescription)")
    }
    
    // create a new method waitForElementToAppear
    
    func waitForElementToAppear(format: String, element: AnyObject, time: Double){
        let exists = NSPredicate(format: format)
        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: time, handler: nil)
    }
    
    
}
