//
//  Extension + UIButton.swift
//  Rainbow
//
//  Created by Liz-Mary on 13.11.2023.
//

import UIKit
import SnapKit

extension UIButton {
    convenience init(textButton: String, colorText: UIColor, backgroundColor: UIColor) {
        self.init(type: .system)
        self.tintColor = colorText
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10
        self.titleLabel?.font = .systemFont(ofSize: 20)
        self.setTitle(textButton, for: .normal)
        //self.addTarget(target, action: action, for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.snp.makeConstraints { make in
            make.width.equalTo(274)
            make.height.equalTo(83)
        }
    }
}

