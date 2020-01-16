//
//  PUBAuthDataStore.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/18/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation

public protocol PUBAuthDataStore {
    func readAuthSession(_ completion: @escaping PUBAuthResponse)
    func save(authSession: PUBAuthSession, _ completion: @escaping PUBErrorResponse)
    func delete(_ completion: @escaping PUBErrorResponse)
}
