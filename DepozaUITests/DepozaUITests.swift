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
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["isUITesting"]
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
      
        app.buttons["add_button"].tap()
        
        let tablesQuery = app.tables
            tablesQuery.textFields["enter_amount"].typeText("199")
            tablesQuery.staticTexts["Clothes"].tap()
        
        let typeDescription = tablesQuery.textFields["enter_description"]
            typeDescription.tap()
            typeDescription.typeText("coat")
        
        app.navigationBars["Add Expense"].buttons["Done"].tap()
        
        let total_expenses_amount = tablesQuery.staticTexts["total_expenses_amount"].label
        XCTAssert(total_expenses_amount == "199", "actual expenses \(total_expenses_amount)")
    }
    
}
