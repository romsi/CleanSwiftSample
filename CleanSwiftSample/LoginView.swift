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
		let authentication = Authentication()
		let presenter = LoginPresenter()
		authentication.login(email: email, password: password) { result in
			alertContent = presenter.getAlertContent(from: result)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
