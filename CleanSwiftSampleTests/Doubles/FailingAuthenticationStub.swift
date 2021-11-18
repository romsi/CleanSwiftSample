//
//  FailingAuthenticationStub.swift
//  CleanSwiftSampleTests
//
//  Created by Romain Asnar on 11/18/21.
//

@testable import CleanSwiftSample
import XCTest

class FailingAuthenticationStub: AuthenticationGateway {
	func signIn(
		email: String,
		password: String,
		completion: @escaping (Result<String, Error>) -> Void
	) {
		completion(.failure(NSError(domain: "AuthenticationStub", code: 0, userInfo: nil)))
	}
}
