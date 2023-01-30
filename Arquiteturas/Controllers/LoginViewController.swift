//
//  LoginViewController.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func openButtonTap(_ sender: UIButton) {
        let manager = UserManager(business: UserBusiness())
        
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text
        else { return }
        
        manager.login(email: email, password: password) { userModel in
            self.openHomeView()
        } failureHandler: { error in
            self.showMessage(title: "Erro", message: error?.localizedDescription ?? "")
        }

    }
    
    @IBAction func registerButtonTap(_ sender: UIButton) {
        let register = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        register.modalPresentationStyle = .fullScreen
        self.present(register, animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func openHomeView() {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
