//
//  Extension + CustomButton.swift
//  Rainbow
//
//  Created by Liz-Mary on 13.11.2023.
//

import UIKit

extension UIButton {
    convenience init(imageName: String, target: Any?, action: Selector? ) {
        self.init(frame: .zero)
        setImage(UIImage(named: imageName), for: .normal)

        if let target = target, let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 1.0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
