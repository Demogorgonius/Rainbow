//
//  GameBuilder.swift
//  Rainbow
//
//  Created by Liz-Mary on 17.11.2023.
//

import UIKit

import UIKit

protocol GameBuilderProtocol: AnyObject {
    func build() -> UIViewController
    init (navigationVC: UINavigationController)
}

class GameBuilder: GameBuilderProtocol {
    
    var navigationVC: UINavigationController?
    
    required init(navigationVC: UINavigationController) {
        self.navigationVC = navigationVC
    }
    
    func build() -> UIViewController {
        
        if let navigationVC = navigationVC {
            
            let router = GameRouter(navigationVC: navigationVC)
            let gameManager = SettingsManager()
            
            let presenter = GamePresenter(router: router, gameManager: gameManager)
            let viewController = GameViewController(presenter: presenter)

            presenter.view = viewController
            router.viewController = viewController
            
            return viewController
        }
        
        return UIViewController()
       
       
    }
}
