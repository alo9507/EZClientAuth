//
//  Auth.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

public struct Auth {
    static func configure(for authProvider: AuthProviderConfiguration, with dataStore: AuthDataStore? = nil) {
        manager.configure(for: authProvider, with: dataStore)
    }
    
    static let manager: AuthManager = AuthManager()
    
    static var session: AuthSession? {
        return manager.authSession
    }
}
