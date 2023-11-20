//
//  ShadowButtonFactory.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 20.11.2023.
//

import UIKit

enum ShadowButtonStyle {
    case standard
    case circular
}

class ShadowButtonFactory {
    static func makeShadowButton(
        backgroundColor: UIColor,
        style: ShadowButtonStyle = .standard,
        title: String?,
        target: Any?,
        action: Selector?
    ) -> UIButton {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = backgroundColor
        
        switch style {
        case .standard:
            button.layer.cornerRadius = 10
        case .circular:
            button.layer.cornerRadius = button.frame.size.height / 2
        }
        
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.9
        button.layer.shadowRadius = 3
        button.layer.shadowColor = UIColor.black.cgColor
        
        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        
        return button
    }
}
