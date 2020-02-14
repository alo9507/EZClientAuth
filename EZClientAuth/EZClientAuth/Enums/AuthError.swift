//
//  AuthError.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 12/18/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

public enum AuthError: Error, Equatable {
    case failedToReadLocalAuthSession(_ error: String)
    case failedToPersistAuthSessionData(_ error: String)
    case failedToSignInWithRemote(_ error: String)
    case failedToSignOutWithRemote(_ error: String)
    case failedToRemoveAuthSessionData(_ error: String)
    case failedToRetrieveAuthSession(_ error: String)
    case wrongEmail(_ error: String)
    case wrongPassword(_ error: String)
    case failedToRetrieveRefreshToken(_ error: String)
    case failedToValidateAuthSession(_ error: String)
    case invalidAccessToken(_ error: String)
    case cannotSignOutIfNotSignedIn
    case userDoesNotExist(_ error: String)
    case invalidGroup(_ error: String)
    case failedToSignUpNewUser(_ error: String)
    case unknownError(_ error: String)
}

extension AuthError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failedToReadLocalAuthSession(let error):
            return "Failed to read locally persisted AuthSession: \(error)"
        case .failedToPersistAuthSessionData(let error):
            return "Failed to save AuthSession to the cache: \(error)"
        case .failedToSignInWithRemote(let error):
            return "Failed to sign in with Remote Auth Provider: \(error)"
        case .failedToSignOutWithRemote(let error):
            return "Failed to sign out from remote auth provider: \(error)"
        case .failedToRemoveAuthSessionData(let error):
            return "Failed to remove AuthSession from the cahe: \(error)"
        case .wrongEmail(let error):
            return "The email is not recognized by the remote auth provider: \(error)"
        case .wrongPassword(let error):
            return "The password is not recognized by the remote auth provider: \(error)"
        case .failedToRetrieveRefreshToken(let error):
            return "Failed to retrieve refresh token: \(error)"
        case .failedToValidateAuthSession(let error):
            return "Failed to validate AuthSession: \(error)"
        case .invalidAccessToken(let error):
            return "Your access token is invalid: \(error)"
        case .cannotSignOutIfNotSignedIn:
            return "You are not signed in, so there is no AuthSession to sign out"
        case .invalidGroup(let error):
            return "Your group access is invalid on remote auth provider: \(error)"
        case .failedToSignUpNewUser(let error):
            return "Failed to register new user: \(error)"
        case .failedToRetrieveAuthSession(let error):
            return "Failed to retrieve AuthSession from remote auth provider: \(error)"
        case .userDoesNotExist(let error):
            return "The credentials you entered do not correspond to any user known to the remote auth provider: \(error)"
        case .unknownError(let error):
            return "An unknown error occurred: \(error)"
        }
    }
}
