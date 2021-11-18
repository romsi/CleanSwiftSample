//
//  MainContext.swift
//  CleanSwiftSample
//
//  Created by Romain Asnar on 11/12/21.
//

struct MainContext {
	static var authenticationGateway: AuthenticationGateway!
}

class MainContextInjector {
	class func inject() {
		MainContext.authenticationGateway = FirebaseGateway()
		FirebaseGateway.configure()
	}
}
