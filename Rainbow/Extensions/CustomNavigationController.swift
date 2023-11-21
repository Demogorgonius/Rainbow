//
//  CustomNavigationController.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 16.11.2023.
//

import UIKit

extension UINavigationController {
    func setupNavigationBar() {
        setBackButtonAppearance()
        setTitleTextAppearance()
        configureNavigationBarAppearance()
    }

    private func setBackButtonAppearance() {
        let backButtonImage = UIImage(systemName: "arrow.backward")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 45, weight: .bold))
        let alignInsets = UIEdgeInsets(top: 19, left: -4, bottom: 0, right: 0)
        
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationBar.backIndicatorImage = backButtonImage?.withAlignmentRectInsets(alignInsets)
        navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        navigationBar.tintColor = .white
    }

    private func setTitleTextAppearance() {
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.TextFont.Regular.size(of: 40)
        ]
        navigationBar.titleTextAttributes = titleAttributes
    }

    private func configureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .customPurple
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactScrollEdgeAppearance = appearance
    }
}
