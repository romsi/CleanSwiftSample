//
//  AuthenticationGateway.swift
//  CleanSwiftSample
//
//  Created by Romain Asnar on 11/12/21.
//

import Foundation

protocol AuthenticationGateway {
	func signIn(
		email: String,
		password: String,
		completion: @escaping (Result<String, Error>) -> Void
	)
}
