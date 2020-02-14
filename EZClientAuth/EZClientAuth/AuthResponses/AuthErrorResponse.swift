//
//  AuthErrorResponse.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 2/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

/// Completion closure for authentication operations that indicate success with a nil error but do not return an AuthSession
public typealias AuthErrorResponse = (AuthError?) -> Void
