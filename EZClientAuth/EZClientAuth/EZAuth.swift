//
//  Auth.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

/// The client's sole entry point into EZClientAuth
/// Holds the singleton AuthManager with the single synchronized AuthSession
/// We prefix with EZ to prevent naming collisions with other libraries
public struct EZAuth {
    /// The singleton AuthManager to be used for all authentication CRUD
    static public let manager: AuthMananger = EZAuthManager()
    
    /// The client calls configure to method inject their choice of RemoteAuthProvider
    /// - Parameter authProvider: an enum holding the RemoteAuthProvider implementation as an associated value
    static public func configure(for authProvider: AuthProviderConfiguration) {
        manager.configure(for: authProvider)
    }
    
    /// Convenience getter for the AuthSession held on the singleton AuthManager
    static public var session: AuthSession? {
        return manager.authSession
    }
}
