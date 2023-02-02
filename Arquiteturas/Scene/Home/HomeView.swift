//
//  HomeView.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 31/01/23.
//

import UIKit

class HomeView: UIView {
    // MARK: - Closures
    
    // MARK: - Properties
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem Vindo a HomeView VIP"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGreen
        setupVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Constraints
    private func setupVisualElements() {
        addSubview(welcomeLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            welcomeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: - Actions

}
