//
//  KeycloakAuthProvider.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/18/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

class KeycloakAuthProvider: RemoteAuthProvider {
    func signUp(email: String, password: String, completion: @escaping PUBAuthResponse) {
        
    }
    
    func isValidAuthSession(authSession: PUBAuthSession, _ completion: @escaping PUBAuthValidationResponse) {
        return
    }
    
    func decodeUserProfile(from token: String) -> PUBUserProfile {
        return PUBUserProfile(scope: "", emailVerified: true, name: "", groups: [""], preferredUsername: "", givenName: "", familyName: "", email: "")
    }
    
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping PUBAuthResponse) {
        return
    }
    
    func signOut(authSession: PUBAuthSession, _ completion: @escaping PUBErrorResponse) {
        return
    }
    
}
