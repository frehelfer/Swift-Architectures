//
//  RegisterCoordinator.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import UIKit

class RegisterCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let viewController = RegisterViewController()
        
        viewController.onOpenTap = {
            self.navigationController.popViewController(animated: true)
        }
        
        viewController.onRegisterSuccess = {
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
