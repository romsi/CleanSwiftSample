//
//  CleanSwiftSampleTests.swift
//  CleanSwiftSampleTests
//
//  Created by Romain Asnar on 11/12/21.
//

import XCTest
@testable import CleanSwiftSample

class LoginTests: XCTestCase {
    func testLoginWithValidCredentials() throws {
		let mock = AuthenticatingVerificationMock()
		let authentication = Authentication(authenticationGateway: mock)
		
		var expectedName: String?
		let expectation = XCTestExpectation(description: "Authenticating with credential")
		authentication.login(
			email: "unclebob@cleancoders.com",
			password: "424242"
		) { result in
			switch result {
			case .success(let name):
				expectedName = name
			default: break
			}
			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 1.0)
		
		XCTAssertEqual(expectedName, "Uncle Bob")
		mock.verify()
    }
}
