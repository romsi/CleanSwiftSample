//
//  AuthenticatingVerificationMock.swift
//  CleanSwiftSample
//
//  Created by Romain Asnar on 11/12/21.
//

@testable import CleanSwiftSample
import XCTest

class AuthenticatingVerificationMock: AuthenticationGateway {
	private var signInCalls: [(email: String, password: String)] = []
	
	func signIn(
		email: String,
		password: String,
		completion: @escaping (Result<String, Error>) -> Void
	) {
		signInCalls.append((email, password))
		completion(.success("Uncle Bob"))
	}
	
	func verify() {
		XCTAssertEqual(signInCalls.count, 1)
		XCTAssertEqual(signInCalls[0].email, "unclebob@cleancoders.com")
	}
}
