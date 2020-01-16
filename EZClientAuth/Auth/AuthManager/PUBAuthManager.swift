//
//  AuthManangerProtocol.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

public protocol PUBAuthManager {
    var currentUser: PUBUserProfile? { get }
    
    var authProvider: PUBAuthProvider? { get }
    
    var dataStore: PUBAuthDataStore { get }
    
    var authSession: PUBAuthSession? { get }
    
    func clear(_ completion: @escaping PUBErrorResponse)
    
    func configure(for authProvider: PUBAuthProvider, with dataStore: PUBAuthDataStore?)
    
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping PUBAuthResponse)
    
    func signOut(_ completion: @escaping PUBErrorResponse)
    
    func signUp(email: String, password: String, _ completion: @escaping PUBAuthResponse)
    
    func isAuthenticated(_ completion: @escaping PUBAuthResponse)
}

extension PUBAuthManager {
    func configure(for authProvider: PUBAuthProvider, with dataStore: PUBAuthDataStore? = nil) {
        configure(for: authProvider, with: dataStore)
    }
}
