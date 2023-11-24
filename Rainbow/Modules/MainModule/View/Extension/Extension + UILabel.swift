//
//  Extension + UILabel.swift
//  Rainbow
//
//  Created by Liz-Mary on 13.11.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = .black
        self.textAlignment = .center
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 1.0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
