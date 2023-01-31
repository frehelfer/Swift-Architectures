//
//  UserManager.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 27/01/23.
//

import Foundation

protocol UserManagerProtocol {
    func register(email: String, password: String,
                  successHandler: @escaping(UserModel) -> (),
                  failureHandler: @escaping(Error) -> ())
    
    func login(email: String, password: String,
               successHandler: @escaping(UserModel) -> (),
               failureHandler: @escaping(Error) -> ())
}

class UserManager: UserManagerProtocol {

    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    
    func login(email: String, password: String,
               successHandler: @escaping (UserModel) -> (),
               failureHandler: @escaping (Error) -> ()) {
        
        business.login(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
    func register(email: String, password: String,
                  successHandler: @escaping (UserModel) -> (),
                  failureHandler: @escaping (Error) -> ()) {
        
        business.register(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
}
