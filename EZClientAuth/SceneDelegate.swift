//
//  SceneDelegate.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 1/16/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import UIKit
import SwiftUI
//import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // 🚨🚨🚨 BE SURE TO CALL FirebaseApp.configure() before you attemp to configure EZAuth with .firebase 🚨🚨🚨
        // FirebaseApp.configure()
        
        // 🚨🚨🚨 YOU MUST CONFIGURE THE EZAUTHMANAGER BEFORE CALLING ANY AUTHENTICATION METHODS! 🚨🚨🚨
        // 👻 Using a MockRemoteAuthProvider for the demo app which always returns an AuthSession
        EZAuth.configure(for: .mock)
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let loginViewController = LoginViewController()
            let navigationController = UINavigationController(rootViewController: loginViewController)
            window.rootViewController = navigationController
            self.window = window
            
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
