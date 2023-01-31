//
//  HomeCoordinator.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let viewController = HomeViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(viewController, animated: true)
//        pushViewController(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
