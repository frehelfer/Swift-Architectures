//
//  RegisterView.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 31/01/23.
//

import UIKit

class RegisterView: UIView {
    
    // MARK: - Clouser
    var onOpenTap: (() -> Void)?
    var onRegisterTap: ((_ email: String, _ password: String) -> Void)?
    
    // MARK: - Properts
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    private lazy var passwordConfirmationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirme sua Senha"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = UIColor.systemGray5
        textField.textColor = .label.withAlphaComponent(0.8)
        textField.placeholder = "Insira seu email"
        textField.text = "test@test.com"
        textField.keyboardType = .emailAddress
        textField.setLeftPaddingPoints(12)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = UIColor.systemGray5
        textField.textColor = .label.withAlphaComponent(0.8)
        textField.placeholder = "Insira sua senha"
        textField.text = "a12345"
        textField.keyboardType = .default
        textField.setLeftPaddingPoints(12)
        return textField
    }()
    
    private lazy var passwordConfirmationTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = UIColor.systemGray5
        textField.textColor = .label.withAlphaComponent(0.8)
        textField.placeholder = "Confirme sua senha"
        textField.text = "a12345"
        textField.keyboardType = .default
        textField.setLeftPaddingPoints(12)
        return textField
    }()
    
    private lazy var openButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(openButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .viewBackgroundColor
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set COnstraints
    private func setConstraints() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(passwordConfirmationLabel)
        self.addSubview(passwordConfirmationTextField)
        self.addSubview(registerButton)
        self.addSubview(openButton)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            passwordLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordConfirmationLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            passwordConfirmationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            passwordConfirmationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            passwordConfirmationTextField.topAnchor.constraint(equalTo: passwordConfirmationLabel.bottomAnchor, constant: 8),
            passwordConfirmationTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordConfirmationTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordConfirmationTextField.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: passwordConfirmationTextField.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            openButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 16),
            openButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            openButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            openButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: - Actions
    
    @objc
    func openButtonTap() {
        self.onOpenTap?()
    }
    
    @objc
    func registerButtonTap() {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        self.onRegisterTap?(email, password)
    }
}
