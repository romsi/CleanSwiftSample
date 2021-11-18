//
//  Authentication.swift
//  CleanSwiftSample
//
//  Created by Romain Asnar on 11/12/21.
//

import Firebase

final class Authentication {
	func login(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
		let firebase = FirebaseGateway()
		firebase.signIn(email: email, password: password, completion: completion)
	}
}
