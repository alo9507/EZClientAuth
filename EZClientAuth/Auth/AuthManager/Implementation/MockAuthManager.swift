//
//  MockAuthManager.swift
//  Contact
//
//  Created by Andrew O'Brien on 1/2/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class MockAuthManager: PUBAuthManager {
    var currentUser: PUBUserProfile?
    
    var authProvider: PUBAuthProvider?
    
    var dataStore: PUBAuthDataStore
    
    var authSession: PUBAuthSession?
    
    init(
        authProvider: PUBAuthProvider?,
        dataStore: PUBAuthDataStore
    ) {
        self.authProvider = authProvider
        self.dataStore = dataStore
    }
    
    convenience init() {
        self.init(authProvider: nil,
                  dataStore: KeychainDataStore()
                  )
    }
    
    func clear(_ completion: @escaping PUBErrorResponse) {
        
    }
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping PUBAuthResponse) {
        
    }
    
    func signOut(_ completion: @escaping PUBErrorResponse) {
        
    }
    
    func signUp(email: String, password: String, _ completion: @escaping PUBAuthResponse) {
        
    }
    
    func isAuthenticated(_ completion: @escaping PUBAuthResponse) {
        
    }
    
}
