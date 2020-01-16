//
//  KeychainDataStore.swift
//  AuthFramework
//
//  Created by Andrew O'Brien on 12/11/19.
//  Copyright © 2019 Andrew O'Brien. All rights reserved.
//

import Foundation
import Security

class KeychainDataStore: PUBAuthDataStore {
    let keychainKey = "auth_session"
    
    func readAuthSession(_ completion: @escaping PUBAuthResponse) {
        let query: [String: Any] = [
            String(kSecClass): kSecClassGenericPassword,
            String(kSecAttrAccount): keychainKey,
            String(kSecReturnData): kCFBooleanTrue as CFBoolean,
            String(kSecMatchLimit): kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        switch status {
        case errSecSuccess:
            guard let rawData = dataTypeRef as? Data else {
                return completion(nil, PUBAuthError.failedToReadLocalAuthSession("Typecast to Data failed"))
            }
            
            let decoder = JSONDecoder()
            do {
                let authSession = try decoder.decode(PUBAuthSession.self, from: rawData)
                completion(authSession, nil)
            } catch let error {
                completion(nil, PUBAuthError.failedToReadLocalAuthSession(error.localizedDescription))
            }
        case errSecItemNotFound:
            completion(nil, nil)
        default:
            completion(nil, PUBAuthError.failedToReadLocalAuthSession(getHumanReadableErrorMessage(resultCode: status)))
        }
    }
    
    func save(authSession: PUBAuthSession, _ completion: @escaping PUBErrorResponse) {
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(authSession)
            let query: [String: Any] = [
                String(kSecClass): String(kSecClassGenericPassword),
                String(kSecAttrAccount): keychainKey,
                String(kSecValueData): data
            ]
            
            let attributes: [String: Any] = [kSecValueData as String: data]
            
            let updateStatus = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
            
            guard updateStatus == errSecItemNotFound || updateStatus == errSecSuccess else {
                return completion(PUBAuthError.failedToPersistUserSessionData(getHumanReadableErrorMessage(resultCode: updateStatus)))
            }
            
            if updateStatus == errSecItemNotFound {
                let addStatus = SecItemAdd(query as CFDictionary, nil)
                
                guard addStatus == errSecSuccess else {
                    return completion(PUBAuthError.failedToPersistUserSessionData(getHumanReadableErrorMessage(resultCode: addStatus)))
                }
            }
            completion(nil)
        } catch let error {
            completion(PUBAuthError.failedToPersistUserSessionData(error.localizedDescription))
        }
    }
    
    func delete(_ completion: @escaping PUBErrorResponse) {
        let query: [String: Any] = [
            String(kSecClass): String(kSecClassGenericPassword),
            String(kSecAttrAccount): keychainKey
        ]
        
        let resultCode = SecItemDelete(query as CFDictionary)
        
        if resultCode == errSecSuccess {
            completion(nil)
        } else {
            completion(PUBAuthError.failedToRemoveUserSessionData(getHumanReadableErrorMessage(resultCode: resultCode)))
        }
    }
}

extension KeychainDataStore {
    func getHumanReadableErrorMessage(resultCode: OSStatus) -> String {
        if #available(iOS 11.3, *) {
            return SecCopyErrorMessageString(resultCode, nil)! as String
        }
        return ""
    }
}
