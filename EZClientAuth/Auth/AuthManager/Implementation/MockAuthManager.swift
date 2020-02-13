//
//  MockAuthManager.swift
//  Contact
//
//  Created by Andrew O'Brien on 1/2/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class MockAuthManager: AuthMananger {
    var authSession: AuthSession?
    
    var dataStore: AuthDataStore = KeychainDataStore()
    
    var remoteAuthProvider: RemoteAuthProvider = MockRemoteAuthProvider()
    
    var authProviderConfiguration: AuthProviderConfiguration?
    
    required init(authProviderConfiguration: AuthProviderConfiguration? = nil) {
        self.authProviderConfiguration = authProviderConfiguration
    }
    
    func clear(_ completion: @escaping AuthErrorResponse) {}
    
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping AuthResponse) {}
    
    func signOut(_ completion: @escaping AuthErrorResponse) {}
    
    func signUp(email: String, password: String, _ completion: @escaping AuthResponse) {}
    
    func isAuthenticated(_ completion: @escaping AuthResponse) {}
    
}
