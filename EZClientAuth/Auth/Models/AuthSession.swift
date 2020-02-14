//
//  AuthSession.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

/// - Tag: AuthSession
public class AuthSession: Codable {
    public let token: String
    public let refreshToken: String
    public var uid: String = ""
    
    public init(token: String, refreshToken: String, uid: String = "") {
        self.token = token
        self.refreshToken = refreshToken
        self.uid = uid
    }
}
