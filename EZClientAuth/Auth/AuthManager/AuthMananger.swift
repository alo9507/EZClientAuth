//
//  AuthMananger.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

public protocol AuthMananger {
    init(authProviderConfiguration: AuthProviderConfiguration?)
    
    var authSession: AuthSession? { get }
    
    var dataStore: AuthDataStore { get }
    
    var remoteAuthProvider: RemoteAuthProvider { get }
    
    var authProviderConfiguration: AuthProviderConfiguration? { get }
    
    func clear(_ completion: @escaping AuthErrorResponse)
    
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping AuthResponse)
    
    func signOut(_ completion: @escaping AuthErrorResponse)
    
    func signUp(email: String, password: String, _ completion: @escaping AuthResponse)
    
    func isAuthenticated(_ completion: @escaping AuthResponse)
    
    func configure(for authProviderConfiguration: AuthProviderConfiguration)
}
