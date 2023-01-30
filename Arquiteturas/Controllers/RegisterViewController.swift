//
//  RegisterViewController.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    @IBAction func registerButtonTap(_ sender: UIButton) {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let confirmPassword = confirmPasswordTextField.text
        else { return }
        
        guard password == confirmPassword else {
            showMessage(title: "Erro", message: "Senhas não confere", preferredStyle: .alert)
            return
        }
        
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: email, password: password) { userModel in
            self.openHomeView()
        } failureHandler: { error in
            self.showMessage(title: "Erro", message: error?.localizedDescription ?? "", preferredStyle: .alert)
        }
    }
    
    @IBAction func openButtonTap(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func openHomeView() {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
