//
//  LoginViewController.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/28/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    private var loginVM = LoginViewModel()
    
    lazy var usernameTextField: UITextField = {
        let usernameTextField = BindingTextField()
        usernameTextField.placeholder = "Enter username"
        usernameTextField.backgroundColor = .lightGray
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.bind { [weak self] text in
            print(text)
            self?.loginVM.username.value = text
        }
        return usernameTextField
    }()
    
    lazy var passwordTextField: UITextField = {
        
        let passwordTextField = BindingTextField()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Enter password"
        passwordTextField.backgroundColor = .lightGray
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.bind { [weak self] text in
            self?.loginVM.password.value = text
        }
        return passwordTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginVM.username.bind { [weak self] text in
            self?.usernameTextField.text = text
        }
        
        loginVM.password.bind { [weak self] text in
            self?.passwordTextField.text = text
        }
        
        setupUI()
    }
    
    @objc func login() {
        print(loginVM.username.value)
        print(loginVM.password.value)
    }
    
    @objc func fetchLoginInfo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.loginVM.username.value = "marydoe"
            self?.loginVM.password.value = "password"
        }
    }
    
    private func setupUI() {
        
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .gray
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let fetchLoginInfoButton = UIButton()
        fetchLoginInfoButton.setTitle("Fetch Login Info", for: .normal)
        fetchLoginInfoButton.backgroundColor = .blue
        fetchLoginInfoButton.addTarget(self, action: #selector(fetchLoginInfo), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField, loginButton, fetchLoginInfoButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}
