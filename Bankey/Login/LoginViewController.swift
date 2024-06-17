//
//  ViewController.swift
//  Bankey
//
//  Created by Vishwas Sharma on 13/06/24.
//

import UIKit

class LoginViewController: UIViewController {
    //initializing an object of the LoginView inside the view controller to be able to use it
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let titleLabel = UILabel()
    let calloutLabel = UILabel()
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        //title label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey ッ"
        titleLabel.font = .boldSystemFont(ofSize: 54)
        
        // callout label
        calloutLabel.translatesAutoresizingMaskIntoConstraints = false
        calloutLabel.text = "Your premium source for all things banking!"
        calloutLabel.numberOfLines = 0
        calloutLabel.font = .italicSystemFont(ofSize: 19)
    }
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(calloutLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Title Label
        NSLayoutConstraint.activate([
               titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
               titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           ])
        
        //Call out label
        
        NSLayoutConstraint.activate([
            calloutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            calloutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           ])
           
        
        
        
        // Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),           loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            
        ])
        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor )
        ])
        
        // Label
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
       
    }
}

// MARK: Actions

extension LoginViewController {
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
        func login() {
            guard let username = username, let password = password else {
                assertionFailure("Username/password show never be nil")
                return
            }
            
            if username.isEmpty || password.isEmpty{
                configureView(withMessage: "Username / password cannot be blank!")
                return
            }
            
            if username == "Vishwas" && password == "vishwas"{
                signInButton.configuration?.showsActivityIndicator = true
            } else {
                configureView(withMessage: "Incorrect Username / Password")
            }
            
        }
        
        func configureView(withMessage message: String){
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = message
        }
        
    }
}

