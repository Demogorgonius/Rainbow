//
//  GameBuilder.swift
//  Rainbow
//
//  Created by Liz-Mary on 17.11.2023.
//

import UIKit

protocol GameBuilderProtocol: AnyObject {
    func build() -> UIViewController
   init(navigationController: UINavigationController?)
}

class GameBuilder: GameBuilderProtocol {
    
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func build() -> UIViewController {
        if let navigationController = navigationController {
            
            let router = GameRouter(navigationController: navigationController)
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
