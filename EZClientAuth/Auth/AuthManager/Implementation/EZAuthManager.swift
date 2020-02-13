//
//  EZAuthManager.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

class EZAuthManager: AuthMananger {
    var authSession: AuthSession?
    
    var dataStore: AuthDataStore = KeychainDataStore()
    
    var authProviderConfiguration: AuthProviderConfiguration?
    
    lazy var remoteAuthProvider: RemoteAuthProvider = {
        guard let authProviderChoice = authProviderConfiguration else {
            fatalError("""
            
            You must call Auth.configure(for: AuthProvider) before calling any methods on AuthFramework.
                You can initialize with the following AuthProviders: Firebase
                
                For testing, you can configure with .mock
            """
            )
        }
        return authProviderChoice.remoteProvider
    }()
    
    required init(authProviderConfiguration: AuthProviderConfiguration? = nil) {
        self.authProviderConfiguration = authProviderConfiguration
    }
    
}

extension EZAuthManager {
    func signIn(email: String? = nil, password: String? = nil, phoneNumber: String? = nil, _ completion: @escaping AuthResponse) {
        remoteAuthProvider.signIn(email: email, password: password, phoneNumber: phoneNumber) { [weak self] (authSession, error) in
            guard error == nil else {
                return completion(nil, AuthError.failedToSignInWithRemote("email: \(email ?? "no email"), password: \(password ?? "no password") \(error!.localizedDescription)"))
            }
            
            guard let authSession = authSession else {
                return completion(nil, AuthError.failedToRetrieveAuthSession("No AuthSession, but also no errors?"))
            }
            
            self?.dataStore.save(authSession: authSession, { (error) in
                guard error == nil else {
                    return completion(nil, AuthError.failedToPersistUserSessionData(error!.localizedDescription))
                }
                self!.authSession = authSession
                completion(authSession, nil)
            })
        }
    }
    
    func configure(for authProviderConfiguration: AuthProviderConfiguration) {
        self.authProviderConfiguration = authProviderConfiguration
    }
    
    func clear(_ completion: @escaping AuthErrorResponse) {
        self.dataStore.delete { (error) in
            guard error == nil else {
                return completion(AuthError.failedToRemoveUserSessionData("Could not clear cached session: \(error!.localizedDescription)"))
            }
            completion(nil)
        }
    }
    
    func signUp(email: String, password: String,  _ completion: @escaping AuthResponse) {
        remoteAuthProvider.signUp(email: email, password: password) { (authSession, error) in
            if error != nil { return print(error!.localizedDescription) }
            guard let authSession = authSession else { return completion(nil, AuthError.failedToSignUpNewUser("No Auth session returned")) }
            
            self.dataStore.save(authSession: authSession) { (error) in
                if error != nil { return completion(nil, AuthError.failedToPersistUserSessionData(error!.localizedDescription)) }
                completion(authSession, nil)
            }
        }
    }
    
    func signOut(_ completion: @escaping AuthErrorResponse) {
        guard let _ = authSession else {
            return completion(AuthError.cannotSignOutIfNotSignedIn)
        }
        
        self.dataStore.delete { (error) in
            guard error == nil else {
                return completion(AuthError.failedToRemoveUserSessionData(error!.localizedDescription))
            }
            completion(nil)
        }
    }
    
    func isAuthenticated(_ completion: @escaping AuthResponse) {
        dataStore.readAuthSession { (authSession, error) in
            guard error == nil else {
                return completion(nil, AuthError.failedToReadLocalAuthSession(error!.localizedDescription))
            }
            
            guard let authSession = authSession else {
                return completion(nil, nil)
            }
            
            self.remoteAuthProvider.isValidAuthSession(authSession: authSession) { (isValidAuthSession, error) in
                guard error == nil else {
                    return completion(nil, AuthError.failedToValidateAuthSession(error!.localizedDescription))
                }
                
                guard let isValidAuthSession = isValidAuthSession else {
                    return completion(nil, AuthError.failedToValidateAuthSession("❌ Remote returned neither errors nor an auth session? ❌"))
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
                            return completion(nil, AuthError.failedToRemoveUserSessionData(msg))
                        }
                        completion(nil, nil)
                    }
                }
            }
        }
    }
}
