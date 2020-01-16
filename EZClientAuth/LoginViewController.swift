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
        let emailTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 60.0, height: 30.0))
        emailTextField.placeholder = "email"
        return emailTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        render()
    }
    
    func render() {
        constructHierarchy()
        activateConstraints()
    }
    
    func constructHierarchy() {
        view.addSubview(emailTextField)
    }
    
    func activateConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
