//
//  AuthProvider.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//
public enum PUBAuthProvider {
    case firebase
    case keycloak(role: UserRole)
    case mock(mockRemoteAuthProvider: RemoteAuthProvider)
    
    var remoteProvider: RemoteAuthProvider {
        switch self {
        case .firebase:
            return FirebaseRemoteAuthProvider()
        case .keycloak(let role):
            return KeycloakAuthProvider()
        case .mock(let mockRemoteAuthProvider):
            return mockRemoteAuthProvider
        }
    }
}
