//
//  EditExpenses.swift
//  Depoza
//
//  Created by Tiana Todos on 12/16/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest


class EditExpense: BaseTest {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEditExpenseAmount(){
        addingNewExpenses()
        
        let summary = ExpensesSummary()
        summary.tapOnExpensesCell(index: 0)
        let expenseDetails = ExpenseDetails()
        expenseDetails.tapOnEditButton()
        expenseDetails.typeNewAmount(amount: "215")
        expenseDetails.tapOnDoneButton()
        
        summary.visible()
        
        let totalExpenses = summary.totalExpensesAmount()
        XCTAssert(totalExpenses == "215", "actual total amount \(totalExpenses)")
        
    }
    
}
