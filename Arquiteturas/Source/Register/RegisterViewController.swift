//
//  RegisterViewController.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import UIKit

class RegisterViewController: UIViewController {
    let presenter: RegisterPresenter = RegisterPresenter()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.delegate = self
    }
    
    @IBAction func registerButtonTap(_ sender: UIButton) {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            password == confirmationPasswordTextField.text else {
            showMessage(title: "Error", message: "Senhas não confere")
            return
        }
        
        let userModel = UserModel(email: email, password: password)
        presenter.register(userModel: userModel)
    }
    
    @IBAction func openButtonTap(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
extension RegisterViewController: RegisterPresenterDelegate {
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
    func goHome() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
    
    
}
