//
//  LoginViewController.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/28/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
        let usernameTextField = UITextField()
        usernameTextField.placeholder = "Enter username"
        usernameTextField.backgroundColor = .lightGray
        usernameTextField.borderStyle = .roundedRect
        
        let passwordTextField = UITextField()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Enter password"
        passwordTextField.backgroundColor = .lightGray
        passwordTextField.borderStyle = .roundedRect
        
        
    }
    
}
