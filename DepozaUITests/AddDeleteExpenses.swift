//
//  AddDeleteExpenses.swift
//  Depoza
//
//  Created by Tiana Todos on 12/16/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class AddDeleteExpenses: BaseTest {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testDeleteExpenses(){
        addingNewExpenses()
        
        let summary = ExpensesSummary()
        summary.tapOnExpensesCell(index: 0)
        let expensesDetails = ExpenseDetails()
        expensesDetails.tapOnTrashButton()
        expensesDetails.tapOnDeleteButton()
        summary.visible()
        let totalExpenses = summary.totalExpensesAmount()
        
        XCTAssert(totalExpenses == "0", "Total amount is \(totalExpenses)")
        
        let expensesSummaryTable = summary.tablesQuery()
        waitForElementToAppear(format: "self.count = 1", element: expensesSummaryTable, time: 3.0)
        
        XCTAssertEqual(expensesSummaryTable.cells.count, 0 , "found instead: \(expensesSummaryTable.cells.debugDescription)")
        
    }
    
}
