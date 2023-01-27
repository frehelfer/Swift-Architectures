//
//  UserProvider.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 27/01/23.
//

import Foundation
import FirebaseAuth

protocol UserProviderProtocol {
    func register(parameters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> ())
    func login(parameters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> ())
}

class UserProvider: UserProviderProtocol {
    lazy var auth = Auth.auth()
    
    func login(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> ()) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        
        self.auth.signIn(withEmail: userModel.email, password: userModel.password) { result, error in
            if let error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel))
            }
        }
    }
    
    func register(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> ()) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        
        self.auth.createUser(withEmail: userModel.email, password: userModel.password) { result, error in
            if let error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel))
            }
        }
    }
    
}
