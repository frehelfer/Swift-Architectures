//
//  HomeViewController.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 31/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = {
        let view = HomeView(frame: .zero)
        return view
    }()
    
    // MARK: - Initializers
    override func loadView() {
        super.loadView()
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
