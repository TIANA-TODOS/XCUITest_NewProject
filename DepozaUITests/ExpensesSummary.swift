//
//  ExpensesSummary.swift
//  Depoza
//
//  Created by Tiana Todos on 12.12.16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class ExpensesSummary: BaseScreen {
    private let addExpensesButton = app.buttons["add_button"]
    private let totalAmount = table.staticTexts["total_expenses_amount"]
    
    static var objectCount:Int = 0
    
    override init() {
        super.init()
        visible()
        ExpensesSummary.objectCount+=1
        print(ExpensesSummary.objectCount)
    }
    
    func visible(){
        print("visit has been called")
        addExpensesButton.waitToExist()
    }
    
    
    func tapOnAddExpensesButton(){
        tap(element: addExpensesButton)
    }
    
    func tapOnExpensesCell(index: Int){
        tap(element: XCUIApplication().tables.cells["cell_\(index)"])
    }
    
    func totalExpensesAmount() -> String {
        return totalAmount.label
    }
    
}
