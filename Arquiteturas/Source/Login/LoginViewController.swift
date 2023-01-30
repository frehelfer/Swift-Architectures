//
//  LoginViewController.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    let presenter: LoginPresenter = LoginPresenter()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.delegate = self
    }
    
    @IBAction func openButtonTap(_ sender: UIButton) {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text
        else { return }
        
        let userModel = UserModel(email: email, password: password)
        presenter.login(userModel: userModel)
    }
    
    @IBAction func registerButtonTap(_ sender: UIButton) {
        let register = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        register.modalPresentationStyle = .fullScreen
        
        self.present(register, animated: true)
    }
}

extension LoginViewController: LoginPresenterDelegate {
    func goHome() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}
