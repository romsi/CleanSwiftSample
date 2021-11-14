//
//  LoginPresentationTests.swift
//  CleanSwiftSampleTests
//
//  Created by Romain Asnar on 11/14/21.
//

import XCTest
@testable import CleanSwiftSample

class LoginPresentationTests: XCTestCase {
	func testLoginPresentationWithSuccessfulLogin() throws {
		let presenter = LoginPresenter()
		
		let alertContent = presenter.getAlertContent(from: .success("Uncle Bob"))
		
		XCTAssertEqual(alertContent.title, "Welcome Uncle Bob")
		XCTAssertEqual(alertContent.description, "Enjoy our great experience!")
	}
	
	func testLoginPresentationWithFailureLogin() throws {
		let presenter = LoginPresenter()
		
		let error = NSError(domain: "None", code: 0, userInfo: nil)
		let alertContent = presenter.getAlertContent(from: .failure(error))
		
		XCTAssertEqual(alertContent.title, "Error")
		XCTAssertEqual(alertContent.description, "Your email or password doesn't match.")
	}
}
