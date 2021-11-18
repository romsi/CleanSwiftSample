//
//  FirebaseAuthenticationIntegrationTest.swift
//  CleanSwiftSampleIntegrationTests
//
//  Created by Romain Asnar on 11/14/21.
//

import XCTest
import Firebase
@testable import CleanSwiftSample

final class FirebaseAuthenticationIntegrationTest: XCTestCase {
	func testShouldGetAuthDataWhenAuthenticatingWithValidEmailAndPassword() {
		let firebaseGateway = FirebaseGateway()
		
		var name: String?
		let expectation = XCTestExpectation(description: "Authenticating with Firebase")
		firebaseGateway.signIn(email: "unclebob@cleancoders.com", password: "424242") { result in
			name = try! result.get()
			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10.0)
		
		XCTAssertEqual(name, "Uncle Bob")
	}
}
