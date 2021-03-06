//
//  FirebaseRemoteAuthProvider.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 1/2/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//
//
//
//// After uncommenting this, you'll have to follow these instructions: https://firebase.google.com/docs/auth/ios/start
//// To setup your Firebase account and install to this project
//
//import Foundation
//import FirebaseAuth
//import Firebase
//
//class FirebaseRemoteAuthProvider: RemoteAuthProvider {
//    func signIn(email: String?, password: String?, phoneNumber: String?, _ completion: @escaping AuthResponse) {
//        guard let email = email, let password = password else {
//            fatalError()
//        }
//
//        Auth.auth().signIn(withEmail: email, password: password) { (firestoreAuthResult, error) in
//            guard error == nil else {
//                var authError: AuthError
//                let nsError = error! as NSError
//                switch nsError.userInfo["FIRAuthErrorUserInfoNameKey"] as? String {
//                case "ERROR_WRONG_PASSWORD":
//                    authError = AuthError.wrongPassword(nsError.localizedDescription)
//                case "ERROR_INVALID_EMAIL":
//                    authError = AuthError.wrongEmail(nsError.localizedDescription)
//                case "ERROR_USER_NOT_FOUND":
//                    authError = AuthError.userDoesNotExist(nsError.localizedDescription)
//                default:
//                    authError = AuthError.unknownError("\(nsError.localizedDescription)")
//                }
//
//                completion(nil, authError)
//                return
//            }
//            
//            guard let firestoreAuthResult = firestoreAuthResult else { return completion(nil, AuthError.unknownError("Firebase successfully authenticated but gave no result?")) }
//            let authSession = AuthSession(token: "User Id: \(firestoreAuthResult.user.uid)", refreshToken: "FAKE_REFRESH_TOKEN", uid: firestoreAuthResult.user.uid)
//            completion(authSession, nil)
//        }
//    }
//
//    func signOut(authSession: AuthSession, _ completion: @escaping AuthErrorResponse) {
//        do {
//            try Auth.auth().signOut()
//            completion(nil)
//        } catch (let error) {
//            completion(AuthError.failedToSignOutWithRemote(error.localizedDescription))
//        }
//    }
//
//    func isValidAuthSession(authSession: AuthSession, _ completion: @escaping AuthValidationResponse) {
//        // no implementation yet for Firebase. Not even sure if FirebaseAuth requires a refresh token.
//        completion(true, nil)
//    }
//
//    func signUp(email: String, password: String, completion: @escaping AuthResponse) {
//        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
//            if error != nil {
//                return completion(nil, AuthError.failedToSignUpNewUser("Failed to create user: \(error!.localizedDescription)"))
//            }
//            guard let authResult = authResult else { return completion(nil, AuthError.failedToSignUpNewUser("No AuthResult Returned, but also no errors")) }
//            
//            let authSession = AuthSession(token: "User Id: \(authResult.user.uid)", refreshToken: "FAKE_REFRESH_TOKEN", uid: authResult.user.uid)
//            
//            completion(authSession, nil)
//        }
//    }
//}
