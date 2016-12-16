//
//  ExpensesDetails.swift
//  Depoza
//
//  Created by Tiana Todos on 12/16/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class ExpenseDetails: BaseScreen {
    
    private let trashButton = app.navigationBars["Expense"].buttons["Trash"]
    private let editButton = app.navigationBars["Expense"].buttons["Edit"]
    private let doneButton = app.navigationBars["Expense"].buttons["Done"]
    private let deleteButton = app.alerts["Delete transaction?"].buttons["Delete"]
    private let expenseAmount = table.cells.element(boundBy: 0)
    private let dateCell = table.cells.element(boundBy: 1)
    private let pickerWheelDate = XCUIApplication().tables.pickerWheels.element(boundBy: 0)
    
    
    override init() {
        trashButton.waitToExist()
    }
    
    
    func tapOnTrashButton(){
        tap(element: trashButton)
    }
    
    func tapOnDeleteButton(){
        tap(element: deleteButton)
    }
    
    func tapOnEditButton(){
        tap(element: editButton)
    }
    
    
    func tapOnDoneButton() {
        tap(element: doneButton)
    }
    
    func tapOnDateCell(){
        tap(element: dateCell)
    }
    
    func typeNewAmount(amount: String) {
        typeAfterSelectAll(string: amount, field: expenseAmount)
    }
    
    func selectDate(month: String, day: String) {
        pickerWheelDate.adjust(toPickerWheelValue: "\(month) \(day)")
    }
    
    func getDateFromCell() -> String {
        return dateCell.staticTexts.element(boundBy: 1).label
    }
    
}
