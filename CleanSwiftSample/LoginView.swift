//
//  ContentView.swift
//  CleanSwiftSample
//
//  Created by Romain Asnar on 11/12/21.
//

import SwiftUI
import Firebase

struct AlertContent: Identifiable {
	var id: String
	var title: String
	var description: String
}

struct LoginView: View {
	@State private var email: String = ""
	@State private var password: String = ""
	@State private var alertContent: AlertContent?
	
    var body: some View {
		VStack(alignment: .leading) {
			TextField("Email", text: $email)
			SecureField("Password", text: $password)
			Button("Login") { login(email: email, password: password) }
		}
		.alert(item: $alertContent) { content in
			Alert(
				title: Text(content.title),
				message: Text(content.description),
				dismissButton: .cancel(Text("OK"), action: {
					alertContent = nil
				})
			)
		}
    }
	
	private func login(email: String, password: String) {
		Auth.auth().signIn(withEmail: email, password: password) { authData, error in
			guard let authData = authData else {
				return
			}
			let name = authData.user.displayName!
			alertContent = AlertContent(
				id: UUID().uuidString,
				title: "Welcome \(name)",
				description: "Enjoy our great experience!"
			)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
