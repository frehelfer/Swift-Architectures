//
//  LoginViewController.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Clousers
    var onRegisterTap: (() -> Void)?
    var onLoginSuccess: (() -> Void)?

    // MARK: Properts
    private lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        
        view.onRegisterTap = { [weak self] in
            self?.onRegisterTap?()
        }
        
        view.onOpenTap = { [weak self] email, password in
            self?.openTap(email, password)
        }
        
        return view
    }()
    
    // MARK: Overrides
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    private func openTap(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.getUserFromApi(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.onLoginSuccess?()
            case .failure(let error):
                self?.showMessage("Erro", error.localizedDescription)
            }
        }
    }
    
    func showMessage(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }

}
