//
//  MockAuthManager.swift
//  Contact
//
//  Created by Andrew O'Brien on 1/2/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class MockAuthManager: AuthMananger {
    
    var authProvider: AuthProviderConfiguration?
    
    var dataStore: AuthDataStore
    
    var authSession: AuthSession?
    
    init(
        authProvider: AuthProviderConfiguration?,
        dataStore: AuthDataStore
    ) {
        self.authProvider = authProvider
        self.dataStore = dataStore
    }
    
    convenience init() {
        self.init(authProvider: nil,
                  dataStore: KeychainDataStore()
                  )
    }
    
    func clear(_ completion: @escaping AuthErrorResponse) {
        
    }
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping AuthResponse) {
        
    }
    
    func signOut(_ completion: @escaping AuthErrorResponse) {
        
    }
    
    func signUp(email: String, password: String, _ completion: @escaping AuthResponse) {
        
    }
    
    func isAuthenticated(_ completion: @escaping AuthResponse) {
        
    }
    
}
