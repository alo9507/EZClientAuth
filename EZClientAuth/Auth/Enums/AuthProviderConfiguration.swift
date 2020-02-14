//
//  AuthProvider.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

public enum AuthProviderConfiguration {
//    case firebase
    case mock
    
    var remoteProvider: RemoteAuthProvider {
        switch self {
//        case .firebase:
//            return FirebaseRemoteAuthProvider()
        case .mock:
            return MockRemoteAuthProvider()
        }
    }
}
