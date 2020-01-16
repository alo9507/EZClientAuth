//
//  PUBUserProfile.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/18/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

public struct PUBUserProfile: Codable, Equatable {
    public let scope: String
    public let emailVerified: Bool
    public let name: String
    public let groups: [String]
    public let preferredUsername: String
    public let givenName: String
    public let familyName: String
    public let email: String
    
    // to snakecase method
    enum CodingKeys: String, CodingKey {
        case scope, name, groups, email
        case emailVerified = "email_verified"
        case preferredUsername = "preferred_username"
        case givenName = "given_name"
        case familyName = "family_name"
    }
    
    public init(
        scope: String,
        emailVerified: Bool,
        name: String,
        groups: [String],
        preferredUsername: String,
        givenName: String,
        familyName: String,
        email: String
    ) {
        self.scope = scope
        self.emailVerified = emailVerified
        self.name = name
        self.groups = groups
        self.preferredUsername = preferredUsername
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
    }
}
