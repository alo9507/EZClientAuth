//
//  AuthValidationResponse.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 2/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

/// True if the AuthSession is valid. False if the AuthSession is invalid.
public typealias AuthValidationResponse = (Bool?, AuthError?) -> Void
