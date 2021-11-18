//
//  CleanSwiftSampleApp.swift
//  CleanSwiftSample
//
//  Created by Romain Asnar on 11/12/21.
//

import SwiftUI
import Firebase

@main
struct CleanSwiftSampleApp: App {
	init() {
		FirebaseGateway.configure()
	}
	
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
