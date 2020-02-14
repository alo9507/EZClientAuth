//
//  AuthMananger.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

/// Synchronizes and validates the AuthSession between a local data store (e.g. Keychain, in-memory DB, etc.) and RemoteAuthProvider(e.g. Firebase, Okta, etc.)
public protocol AuthMananger {
    /// 
    init(authProviderConfiguration: AuthProviderConfiguration?)
    
    /// Instance of [AuthSession](x-source-tag://AuthSession), which encapsulates the user's basic authetnication information (e.g. JWT token, refresh token, etc.)
    var authSession: AuthSession? { get }
    
    /// Cache for local persistence of the AuthSession, e.g. Keychain, FileSystem, MockDataStore
    var authDataStore: AuthDataStore { get }
    
    /// A remote authentication service capable of accepting credentials, determining their validity, and returning an AuthSession for sign-in
    var remoteAuthProvider: RemoteAuthProvider { get }
    
    /// An enum the client uses to specify which RemoteAuthProvider to use
    var authProviderConfiguration: AuthProviderConfiguration? { get }
    
    /// Used by EZAuth to method inject the client's choice of RemoteAuthProvider
    func configure(for authProviderConfiguration: AuthProviderConfiguration)
    
    /// Clear the AuthSession currently stored in the AuthDataStore
    func clear(_ completion: @escaping AuthErrorResponse)
    
    /// Sign in with the configured RemoteAuthProvider
    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping AuthResponse)
    
    /// Sign out from the configured RemoteAuthProvider
    func signOut(_ completion: @escaping AuthErrorResponse)
    
    /// Register a new user with the configured RemoteAuthProvider
    func signUp(email: String, password: String, _ completion: @escaping AuthResponse)
    
    /// Checks if an AuthSession exists in the local AuthDataStore and is still valid with the RemoteAuthProvider
    func isAuthenticated(_ completion: @escaping AuthResponse)
}
