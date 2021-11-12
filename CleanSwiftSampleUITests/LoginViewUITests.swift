//
//  CleanSwiftSampleUITests.swift
//  CleanSwiftSampleUITests
//
//  Created by Romain Asnar on 11/12/21.
//

import XCTest

class LoginViewUITests: XCTestCase {
    func testLoginWithValidCredentials() throws {
        let app = XCUIApplication()
        app.launch()
		let emailTextField = app.textFields["Email"]
		emailTextField.tap()
		emailTextField.typeText("unclebob@cleancoders.com")
		let passwordSecureTextField = app.secureTextFields["Password"]
		passwordSecureTextField.tap()
		passwordSecureTextField.typeText("424242")
		app.buttons["Login"].tap()
		app.alerts["Welcome Uncle Bob"].scrollViews.otherElements.buttons["OK"].tap()
    }
	
	func testLoginWithInvalidCredentials() throws {
		let app = XCUIApplication()
		app.launch()
		let emailTextField = app.textFields["Email"]
		emailTextField.tap()
		emailTextField.typeText("romain@cleancoders.com")
		let passwordSecureTextField = app.secureTextFields["Password"]
		passwordSecureTextField.tap()
		passwordSecureTextField.typeText("424242")
		app.buttons["Login"].tap()
		app.alerts["Error"].scrollViews.otherElements.buttons["OK"].tap()
	}
}
