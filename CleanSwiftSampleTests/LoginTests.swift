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
		MainContext.authenticationGateway = mock
		
		let result = login(email: "unclebob@cleancoders.com", password: "424242")
		let expectedName = try? result?.get()
		
		XCTAssertEqual(expectedName, "Uncle Bob")
		mock.verify()
    }
	
	func testLoginWithInvalidCredentials() throws {
		MainContext.authenticationGateway = FailingAuthenticationStub()
		
		let result = login(email: "romain@cleancoders.com", password: "424242")
		let didFail = (try? result?.get()) == nil
		
		XCTAssertTrue(didFail)
	}
	
	private func login(email: String, password: String) -> (Result<String, Error>)? {
		var result: (Result<String, Error>)? = nil
		let expectation = XCTestExpectation(description: "Authenticating with credential")
		let authentication = Authentication()
		authentication.login(
			email: email,
			password: password
		) { authenticationResult in
			result = authenticationResult
			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 1.0)
		return result
	}
}
