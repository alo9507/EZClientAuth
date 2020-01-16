//
//  AuthManager.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

class AuthManager: PUBAuthManager {
    var authProvider: PUBAuthProvider?
    
    var dataStore: PUBAuthDataStore
    
    var authSession: PUBAuthSession?
    
    lazy var remoteAuthProvider: RemoteAuthProvider = {
        guard let authProviderChoice = authProvider else {
            fatalError("""
            
            You must call Auth.configure(for: AuthProvider) before calling any methods on AuthFramework.
                You can initialize with the following AuthProviders: Firebase
                
                For testing, you can configure with .mock(mockRemoteAuthProvider: RemoteAuthProvider)
            """
            )
        }
        return authProviderChoice.remoteProvider
    }()
    
    var currentUser: PUBUserProfile? {
        guard let token =  authSession?.token else { return nil }
        return remoteAuthProvider.decodeUserProfile(from: token)
    }
    
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
    
}

extension AuthManager {
    func signIn(email: String? = nil, password: String? = nil, phoneNumber: String? = nil, _ completion: @escaping PUBAuthResponse) {
        remoteAuthProvider.signIn(email: email, password: password, phoneNumber: phoneNumber) { [weak self] (authSession, error) in
            guard error == nil else {
                return completion(nil, PUBAuthError.failedToSignInWithRemote("email: \(email), password: \(password) \(error!.localizedDescription)"))
            }
            
            guard let authSession = authSession else {
                return completion(nil, PUBAuthError.failedToRetrieveAuthSession("No AuthSession, but also no errors?"))
            }
            
            self?.dataStore.save(authSession: authSession, { (error) in
                guard error == nil else {
                    return completion(nil, PUBAuthError.failedToPersistUserSessionData(error!.localizedDescription))
                }
                self!.authSession = authSession
                completion(authSession, nil)
            })
        }
    }
    
    func configure(for authProvider: PUBAuthProvider, with dataStore: PUBAuthDataStore? = nil) {
        self.authProvider = authProvider
        guard let dataStore = dataStore else { return }
        self.dataStore = dataStore
    }
    
    func clear(_ completion: @escaping PUBErrorResponse) {
        self.dataStore.delete { (error) in
            guard error == nil else {
                return completion(PUBAuthError.failedToRemoveUserSessionData("Could not clear cached session: \(error!.localizedDescription)"))
            }
            completion(nil)
        }
    }
    
    func signUp(email: String, password: String,  _ completion: @escaping PUBAuthResponse) {
        remoteAuthProvider.signUp(email: email, password: password) { (authSession, error) in
            if error != nil { return print(error!.localizedDescription) }
            guard let authSession = authSession else { return completion(nil, PUBAuthError.failedToSignUpNewUser("No Auth session returned")) }
            
            self.dataStore.save(authSession: authSession) { (error) in
                if error != nil { return completion(nil, PUBAuthError.failedToPersistUserSessionData(error!.localizedDescription)) }
                completion(authSession, nil)
            }
        }
    }
    
    func signOut(_ completion: @escaping PUBErrorResponse) {
        guard let authSession = authSession else {
            return completion(PUBAuthError.cannotSignOutIfNotSignedIn)
        }
        
        self.dataStore.delete { (error) in
            guard error == nil else {
                return completion(PUBAuthError.failedToRemoveUserSessionData(error!.localizedDescription))
            }
            completion(nil)
        }
    }
    
    func isAuthenticated(_ completion: @escaping PUBAuthResponse) {
        dataStore.readAuthSession { (authSession, error) in
            guard error == nil else {
                return completion(nil, PUBAuthError.failedToReadLocalAuthSession(error!.localizedDescription))
            }
            
            guard let authSession = authSession else {
                return completion(nil, nil)
            }
            
            self.remoteAuthProvider.isValidAuthSession(authSession: authSession) { (isValidAuthSession, error) in
                guard error == nil else {
                    return completion(nil, PUBAuthError.failedToValidateAuthSession(error!.localizedDescription))
                }
                
                guard let isValidAuthSession = isValidAuthSession else {
                    return completion(nil, PUBAuthError.failedToValidateAuthSession("❌ Remote returned neither errors nor an auth session? ❌"))
                }
                
                if isValidAuthSession {
                    self.authSession = authSession
                    completion(authSession, nil)
                } else {
                    self.dataStore.delete { (error) in
                        guard error == nil else {
                            let msg = """
                            Cached auth session is no longer valid with your remote AuthProvider. \
                            Encountered error while attempting to flush cache: \(error!.localizedDescription)
                            """
                            return completion(nil, PUBAuthError.failedToRemoveUserSessionData(msg))
                        }
                        completion(nil, nil)
                    }
                }
            }
        }
    }
}
