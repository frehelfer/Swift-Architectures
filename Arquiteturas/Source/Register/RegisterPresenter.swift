//
//  RegisterPresenter.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import Foundation

protocol RegisterPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
}

class RegisterPresenter {
    var delegate: RegisterPresenterDelegate?
    var manager = UserManager(business: UserBusiness())
    
    func register(userModel: UserModel) {
        manager.register(email: userModel.email, password: userModel.password) { [weak self] model in
            self?.delegate?.goHome()
        } failureHandler: { [weak self] error in
            self?.delegate?.showMessage(title: "Erro", message: error?.localizedDescription ?? "")
        }

    }
}
