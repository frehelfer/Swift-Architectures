//
//  LoginPresenter.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import Foundation

protocol LoginPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
}

class LoginPresenter {
    var delegate: LoginPresenterDelegate?
    let manager = UserManager(business: UserBusiness())
    
    func login(userModel: UserModel) {
        manager.login(email: userModel.email, password: userModel.password) { [weak self] model in
            self?.delegate?.goHome()
        } failureHandler: { [weak self] error in
            self?.delegate?.showMessage(title: "Erro", message: error?.localizedDescription ?? "")
        }
    }
}
