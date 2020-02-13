//
//  Auth.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

// We prefix the public classes of EZClientAuth with EZ to prevent naming collisions with other libraries
public struct EZAuth {
    static func configure(for authProvider: AuthProviderConfiguration) {
        manager.configure(for: authProvider)
    }
    
    static let manager: EZAuthManager = EZAuthManager()
    
    static var session: AuthSession? {
        return manager.authSession
    }
}
