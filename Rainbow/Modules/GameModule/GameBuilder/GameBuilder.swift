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
        print("Building GameViewController")
        let gameViewController = GameViewController(presenter: GamePresenterProtocol.self as! GamePresenterProtocol)
        let router = GameRouter(viewController: gameViewController)
        let gameManager = SettingsManager()
        let presenter = GamePresenter(router: router, gameManager: gameManager)
        presenter.view = gameViewController
        
        router.viewController = gameViewController
        
        return gameViewController
    }
}
