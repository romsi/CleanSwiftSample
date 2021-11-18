//
//  FirebaseGateway.swift
//  CleanSwiftSample
//
//  Created by Romain Asnar on 11/12/21.
//

import Firebase

final class FirebaseGateway: AuthenticationGateway {
	static func configure() {
		FirebaseApp.configure()
	}
	
	func signIn(
		email: String,
		password: String,
		completion: @escaping (Result<String, Error>) -> Void
	) {
		Auth.auth().signIn(withEmail: email, password: password) { authData, error in
			guard let authData = authData else {
				return completion(.failure(error!))
			}
			completion(.success(authData.user.displayName!))
		}
	}
}
