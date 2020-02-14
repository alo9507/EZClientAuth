//
//  AuthResponse.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 2/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

/// Completion closure for authentication operations that either return an AuthSession or fail
public typealias AuthResponse = (AuthSession?, AuthError?) -> Void
