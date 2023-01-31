//
//  UserViewModel.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 31/01/23.
//

import Foundation


class UserViewModel {
    private let model: UserModel
    
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
    
    var email: String {
        model.email
    }
    
    func getUserFromApi(_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> ()) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: email, password: password) { model in
            completion(.success(UserViewModel(model: model)))
        } failureHandler: { error in
            completion(.failure(error))
        }
    }
    
    func setUserFromApi(_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> ()) {
        let manager = UserManager(business: UserBusiness())
        manager.register(email: email, password: password) { model in
            completion(.success(UserViewModel(model: model)))
        } failureHandler: { error in
            completion(.failure(error))
        }
    }
}
