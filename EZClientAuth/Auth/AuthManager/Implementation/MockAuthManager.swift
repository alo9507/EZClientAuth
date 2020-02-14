//
//  MockAuthManager.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 1/2/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

/// Use this MockAuthManager in your application to manipulate authentication state and see how your app responds
class MockAuthManager: AuthMananger {
    var signInWasCalled: Int = 0
    var signOutWasCalled: Int = 0
    var isAuthenticatedCalled: Int = 0
    var signUpCalled: Int = 0
    
    var shouldError: Bool = false
    var isAuthenticated: Bool = true
    
    var mockAuthSession: AuthSession = AuthSession(token: "FAKE_TOKEN", refreshToken: "FAKE_REFRESH_TOKEN")
    
    var authSession: AuthSession? {
        return mockAuthSession
    }
    
    var authDataStore: AuthDataStore = KeychainAuthDataStore()
    
    var remoteAuthProvider: RemoteAuthProvider = MockRemoteAuthProvider()
    
    var authProviderConfiguration: AuthProviderConfiguration?
    
    required init(authProviderConfiguration: AuthProviderConfiguration? = nil) {
        self.authProviderConfiguration = authProviderConfiguration
    }
    
    func clear(_ completion: @escaping AuthErrorResponse) {}
    
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping AuthResponse) {
        signInWasCalled += 1
        
        if shouldError {
            completion(nil, AuthError.failedToSignInWithRemote("Some error"))
        } else {
            completion(mockAuthSession, nil)
        }
    }
    
    func signOut(_ completion: @escaping AuthErrorResponse) {
        signOutWasCalled += 1
        
        if shouldError {
            completion(AuthError.failedToSignInWithRemote("Some error"))
        } else {
            completion(nil)
        }
    }
    
    func isAuthenticated(_ completion: @escaping AuthResponse) {
        isAuthenticatedCalled += 1
        
        if shouldError {
            completion(nil, AuthError.failedToValidateAuthSession("some error"))
        } else {
            if isAuthenticated {
                completion(mockAuthSession, nil)
            } else {
                completion(nil, nil)
            }
        }
    }
    
    func signUp(email: String, password: String, _ completion: @escaping AuthResponse) {
        signUpCalled += 1
        
        if shouldError {
            completion(nil, AuthError.failedToSignUpNewUser("some error"))
        } else {
            completion(mockAuthSession, nil)
        }
    }
    
    func configure(for authProvider: AuthProviderConfiguration) {}
}

extension MockAuthManager: TestResetable {
    func resetAllValues() {
        signInWasCalled = 0
        signOutWasCalled = 0
        isAuthenticatedCalled = 0
        shouldError = false
        isAuthenticated = true
    }
}

protocol TestResetable {
    func resetAllValues()
}
