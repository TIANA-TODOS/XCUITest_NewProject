//
//  XCUIElementExtention.swift
//  Depoza
//
//  Created by Tiana Todos on 12/16/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

private let defaultTimeoutInSeconds = 60.0

extension XCUIElement {
    func waitToExist() -> XCUIElement {
        let doesElementExist: () -> Bool = {
            return self.exists
        }
        waitFor(doesElementExist, failureMessage: "Timed out waiting for element to exist.")
        return self
    }
    
    private func waitFor(_ expression: () -> Bool, failureMessage: String) {
        let startTime = NSDate.timeIntervalSinceReferenceDate
        
        while !expression() {
            if NSDate.timeIntervalSinceReferenceDate - startTime > defaultTimeoutInSeconds {
                NSException(name: NSExceptionName(rawValue: "Timeout"), reason: failureMessage, userInfo: nil).raise()
            }
            CFRunLoopRunInMode(CFRunLoopMode.defaultMode, 0.1, true)
        }
    }
}
