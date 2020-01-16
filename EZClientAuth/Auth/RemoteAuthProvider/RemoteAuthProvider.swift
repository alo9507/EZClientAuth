//
//  RemoteAuthProvider.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/18/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

public typealias PUBAuthValidationResponse = (Bool?, PUBAuthError?) -> Void
public typealias PUBAuthResponse = (PUBAuthSession?, PUBAuthError?) -> Void
public typealias PUBErrorResponse = (PUBAuthError?) -> Void

public protocol RemoteAuthProvider {
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping PUBAuthResponse)
    func signOut(authSession: PUBAuthSession, _ completion: @escaping PUBErrorResponse)
    func signUp(email: String, password: String, completion: @escaping PUBAuthResponse)
    func isValidAuthSession(authSession: PUBAuthSession, _ completion: @escaping PUBAuthValidationResponse)
    func decodeUserProfile(from token: String) -> PUBUserProfile
}
