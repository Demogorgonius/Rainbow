//
//  CustomNavigationController.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 16.11.2023.
//

import UIKit

extension UINavigationController {
    // стрелка назад и настройки для тайтла
    func setupNavigationBar() {
        
        navigationBar.barTintColor = .RainbowGameColor.customBackground
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let backButtonImage = UIImage(systemName: "arrow.backward")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 50, weight: .bold))
        let alignInsets = UIEdgeInsets(top: 19, left: -4, bottom: 0, right: 0)
        navigationBar.backIndicatorImage = backButtonImage?.withAlignmentRectInsets(alignInsets)
        navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        navigationBar.tintColor = .RainbowGameColor.customBlack
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.TextFont.Regular.size(of: 30)
        ]
        navigationBar.titleTextAttributes = titleAttributes
    }
}
