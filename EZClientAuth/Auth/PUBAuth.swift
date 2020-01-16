//
//  Auth.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

public struct PUBAuth {
    static public func configure(for authProvider: PUBAuthProvider, with dataStore: PUBAuthDataStore? = nil) {
        manager.configure(for: authProvider, with: dataStore)
    }
    
    static public let manager: PUBAuthManager = AuthManager()
    
    static public var session: PUBAuthSession? {
        return manager.authSession
    }
}
