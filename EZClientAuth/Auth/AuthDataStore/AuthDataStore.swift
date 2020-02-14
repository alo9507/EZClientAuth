//
//  AuthDataStore.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 12/18/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

public protocol AuthDataStore {
    func readAuthSession(_ completion: @escaping AuthResponse)
    func save(authSession: AuthSession, _ completion: @escaping AuthErrorResponse)
    func delete(_ completion: @escaping AuthErrorResponse)
}
