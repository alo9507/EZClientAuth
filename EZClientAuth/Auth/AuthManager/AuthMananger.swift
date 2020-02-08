//
//  AuthMananger.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

public protocol AuthMananger {
    
    var authProvider: AuthProviderConfiguration? { get }
    
    var dataStore: AuthDataStore { get }
    
    var authSession: AuthSession? { get }
    
    func clear(_ completion: @escaping AuthErrorResponse)
    
    func configure(for authProvider: AuthProviderConfiguration, with dataStore: AuthDataStore?)
    
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping AuthResponse)
    
    func signOut(_ completion: @escaping AuthErrorResponse)
    
    func signUp(email: String, password: String, _ completion: @escaping AuthResponse)
    
    func isAuthenticated(_ completion: @escaping AuthResponse)
}

extension AuthMananger {
    func configure(for authProvider: AuthProviderConfiguration, with dataStore: AuthDataStore? = nil) {
        configure(for: authProvider, with: dataStore)
    }
}
