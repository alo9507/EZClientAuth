//
//  LoginViewController.swift
//  EZClientAuth
//
//  Created by Andrew O'Brien on 1/16/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "email"
        return emailTextField
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "password"
        passwordTextField.layer.cornerRadius = 15
        return passwordTextField
    }()
    
    lazy var signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = .systemBlue
        signInButton.layer.cornerRadius = 15
        return signInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        render()
    }
    
    func render() {
        constructHierarchy()
        activateConstraints()
        addEventHandlers()
    }
    
    func constructHierarchy() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
    }
    
    func activateConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailTextField.leadingAnchor.constraint(equalTo: emailTextField.superview!.leadingAnchor, constant: 50.0).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: emailTextField.superview!.trailingAnchor, constant: 50.0).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: (emailTextField.superview!.centerYAnchor)).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: (emailTextField.superview!.centerXAnchor)).isActive = true
        
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordTextField.leadingAnchor.constraint(equalTo: passwordTextField.superview!.leadingAnchor, constant: 50.0).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: passwordTextField.superview!.trailingAnchor, constant: 50.0).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: (emailTextField.bottomAnchor)).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: (passwordTextField.superview!.centerXAnchor)).isActive = true
        
        signInButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        signInButton.topAnchor.constraint(equalTo: (passwordTextField.bottomAnchor)).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: (signInButton.superview!.centerXAnchor)).isActive = true
    }
    
    func addEventHandlers() {
        signInButton.addTarget(self, action: #selector(signIn(_:)), for: .touchUpInside)
    }
    
    @objc
    func signIn(_ sender: UIButton) {
        EZAuth.manager.signIn(email: emailTextField.text, password: passwordTextField.text, phoneNumber: nil) { (authSession, error) in
            self.navigationController?.pushViewController(SuccessfullySignedIn(), animated: true)
        }
    }
}
