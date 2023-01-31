//
//  RegisterViewController.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Clouser
    var onOpenTap: (() -> Void)?
    var onRegisterSuccess: (() -> Void)?
    
    // MARK: - Properts
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        
        view.onOpenTap = { [weak self] in
            self?.onOpenTap?()
        }
        
        view.onRegisterTap = { [weak self] email, password in
            self?.registerTap(email, password)
        }
        
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Registro"
    }
    
    // MARK: - Actions
    private func registerTap(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.setUserFromApi(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.onRegisterSuccess?()
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
