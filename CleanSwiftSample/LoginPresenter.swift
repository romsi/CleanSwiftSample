//
//  LoginPresenter.swift
//  CleanSwiftSample
//
//  Created by Romain Asnar on 11/14/21.
//

import Foundation

final class LoginPresenter {
	func getAlertContent(from result: Result<String, Error>) -> AlertContent {
		switch result {
		case .success(let name):
			return AlertContent(
				id: UUID().uuidString,
				   title: "Welcome \(name)",
				   description: "Enjoy our great experience!"
			   )
		default:
			return AlertContent(
				id: UUID().uuidString,
				   title: "Error",
				   description: "Your email or password doesn't match."
			   )
		}
	}
}
