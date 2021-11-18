//
//  Authentication.swift
//  CleanSwiftSample
//
//  Created by Romain Asnar on 11/12/21.
//

final class Authentication {
	private let authenticationGateway: AuthenticationGateway
	
	init(authenticationGateway: AuthenticationGateway) {
		self.authenticationGateway = authenticationGateway
	}
	
	func login(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
		authenticationGateway.signIn(
			email: email,
			password: password,
			completion: completion)
	}
}
