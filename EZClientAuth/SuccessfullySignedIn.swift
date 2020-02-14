//
//  SuccessfullySignedIn.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 1/17/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import UIKit

class SuccessfullySignedIn: UIViewController {
    lazy var authSessionToken: UILabel = {
        let authSessionToken = UILabel()
        
        // Access the AuthSession from anywhere in the app after you configure and signIn
        guard let token = EZAuth.manager.authSession?.token else { fatalError() }
        
        authSessionToken.text = token
        return authSessionToken
    }()
    
    lazy var signOutButton: UIButton = {
        let signOutButton = UIButton()
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.backgroundColor = .systemBlue
        signOutButton.layer.cornerRadius = 15
        return signOutButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        render()
    }
    
    func render() {
        constructHierarchy()
        activateConstraints()
        addEventHandlers()
    }
    
    func constructHierarchy() {
        view.addSubview(authSessionToken)
        view.addSubview(signOutButton)
    }
    
    func activateConstraints() {
        authSessionToken.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        authSessionToken.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        authSessionToken.leadingAnchor.constraint(equalTo: authSessionToken.superview!.leadingAnchor, constant: 50.0).isActive = true
        authSessionToken.trailingAnchor.constraint(equalTo: authSessionToken.superview!.trailingAnchor, constant: 50.0).isActive = true
        authSessionToken.centerYAnchor.constraint(equalTo: (authSessionToken.superview!.centerYAnchor)).isActive = true
        authSessionToken.centerXAnchor.constraint(equalTo: (authSessionToken.superview!.centerXAnchor)).isActive = true
        
        signOutButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        signOutButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        signOutButton.topAnchor.constraint(equalTo: (authSessionToken.bottomAnchor)).isActive = true
        signOutButton.centerXAnchor.constraint(equalTo: (signOutButton.superview!.centerXAnchor)).isActive = true
    }
    
    func addEventHandlers() {
        signOutButton.addTarget(self, action: #selector(signOut(_:)), for: .touchUpInside)
    }
    
    @objc
    func signOut(_ sender: UIButton) {
        EZAuth.manager.signOut { (error) in
            if error != nil { return print(error!.localizedDescription) }
            self.navigationController?.popViewController(animated: true)
        }
    }
}

