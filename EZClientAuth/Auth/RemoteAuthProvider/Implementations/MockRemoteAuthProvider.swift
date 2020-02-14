//
//  MockRemoteAuthProvider.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 2/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

class MockRemoteAuthProvider: RemoteAuthProvider {
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping AuthResponse) {
        let mockAuthSession = AuthSession(token: "FAKE AUTH TOKEN FROM REMOTE", refreshToken: "")
        completion(mockAuthSession, nil)
    }
    
    func signOut(authSession: AuthSession, _ completion: @escaping AuthErrorResponse) {
        completion(nil)
    }
    
    func signUp(email: String, password: String, completion: @escaping AuthResponse) {
        let mockAuthSession = AuthSession(token: "FAKE AUTH TOKEN FROM REMOTE", refreshToken: "")
        completion(mockAuthSession, nil)
    }
    
    func isValidAuthSession(authSession: AuthSession, _ completion: @escaping AuthValidationResponse) {
        completion(true, nil)
    }
}
