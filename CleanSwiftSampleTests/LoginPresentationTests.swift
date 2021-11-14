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
		
		let alertContent = presenter.getAlertContent(from: .success("Uncle Bob"))!
		
		XCTAssertEqual(alertContent.title, "Welcome Uncle Bob")
		XCTAssertEqual(alertContent.description, "Enjoy our great experience!")
	}
}
