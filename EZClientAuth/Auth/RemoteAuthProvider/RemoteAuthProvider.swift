//
//  RemoteAuthProvider.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/18/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

public typealias AuthValidationResponse = (Bool?, AuthError?) -> Void
public typealias AuthResponse = (AuthSession?, AuthError?) -> Void
public typealias AuthErrorResponse = (AuthError?) -> Void

public protocol RemoteAuthProvider {
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping AuthResponse)
    func signOut(authSession: AuthSession, _ completion: @escaping AuthErrorResponse)
    func signUp(email: String, password: String, completion: @escaping AuthResponse)
    func isValidAuthSession(authSession: AuthSession, _ completion: @escaping AuthValidationResponse)
}
