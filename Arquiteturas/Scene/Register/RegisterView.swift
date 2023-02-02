//
//  RegisterView.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 02/02/23.
//

import UIKit

class RegisterView: UIView {

    // MARK: - Closures
    var onRegisterTap: ((_ userModel: UserModel) -> Void)?
    
    // MARK: - Properties
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .label
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = .label
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private lazy var passwordConfirmationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Repita a senha"
        label.textColor = .label
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .systemGray6
        textField.textColor = .label
        textField.placeholder = "Endereço de email"
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.setLeftPaddingPoints(13)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .systemGray6
        textField.textColor = .label
        textField.placeholder = "Informe sua senha"
        textField.keyboardType = .default
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.setLeftPaddingPoints(13)
        return textField
    }()
    
    private lazy var passwordConfirmationTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .systemGray6
        textField.textColor = .label
        textField.placeholder = "Informe sua senha novamente"
        textField.keyboardType = .default
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.setLeftPaddingPoints(13)
        return textField
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
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Constraints
    
    private func setVisualElements() {
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(passwordConfirmationLabel)
        addSubview(passwordConfirmationTextField)
        addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordConfirmationLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            passwordConfirmationLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordConfirmationLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            passwordConfirmationTextField.topAnchor.constraint(equalTo: passwordConfirmationLabel.bottomAnchor, constant: 10),
            passwordConfirmationTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordConfirmationTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordConfirmationTextField.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: passwordConfirmationTextField.bottomAnchor, constant: 35),
            registerButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func registerButtonTap() {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let passwordConfirmation = passwordConfirmationTextField.text,
            password == passwordConfirmation
        else { return }
        
        let userModel = UserModel(email: email, password: password)
        self.onRegisterTap?(userModel)
    }
}
