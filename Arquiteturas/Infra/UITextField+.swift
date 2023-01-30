//
//  UITextField+.swift
//  Arquiteturas
//
//  Created by Frédéric Helfer on 30/01/23.
//

import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingVIew = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingVIew
        self.leftViewMode = .always
    }
}
