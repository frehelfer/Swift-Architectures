//
//  HomeView.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 31/01/23.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - Properties
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Seja bem vindo a HomeView!"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        return label
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set COnstraints
    private func setConstraints() {
        self.addSubview(helloLabel)
        backgroundColor = .systemGreen
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
