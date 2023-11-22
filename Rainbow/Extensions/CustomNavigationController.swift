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


    private func configureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .customPurple
        appearance.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 30),
            .foregroundColor: UIColor.white]
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactScrollEdgeAppearance = appearance
    }
    
}
