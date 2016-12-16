//
//  AddExpenses.swift
//  Depoza
//
//  Created by Tiana Todos on 12.12.16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class AddExpenses : BaseScreen {
    private let enterAmountField = XCUIApplication().tables.textFields["enter_amount"]
    private let clothesCategory = XCUIApplication().tables.staticTexts["Clothes"]
    private let descriptionField = XCUIApplication().tables.textFields["enter_description"]
    private let doneButton = XCUIApplication().navigationBars["Add Expense"].buttons["Done"]
    
   // wrapper around func
  override init(){
        enterAmountField.waitToExist()
    }
    
    func typeAmount(amount : String){
        // enterAmountField.typeText(amount)
        type(string: amount, field: enterAmountField )
    }
    
    func selectClothesCategory(){
        tap(element: clothesCategory)
    }
    
    func typeExpensesDescription(description : String){
        if descriptionField.exists {
            // descriptionField.typeText(description)
            type(string: description, field:descriptionField)
        }
    }
    
    func tapOnDoneButton(){
        tap(element: doneButton)
    }
}
