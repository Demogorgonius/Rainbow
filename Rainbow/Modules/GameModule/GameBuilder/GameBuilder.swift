//
//  GameBuilder.swift
//  Rainbow
//
//  Created by Liz-Mary on 17.11.2023.
//

import UIKit

import UIKit

protocol GameBuilderProtocol: AnyObject {
    static func build() -> UIViewController
}

class GameBuilder: GameBuilderProtocol {
    
    static func build() -> UIViewController {
        let router = GameRouter()
        let gameManager = SettingsManager()
        
        let presenter = GamePresenter(router: router, gameManager: gameManager)
        let viewController = GameViewController(presenter: presenter)

        presenter.view = viewController
        router.viewController = viewController
        
        return viewController
    }
}