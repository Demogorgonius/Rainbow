//
//  GameBuilder.swift
//  Rainbow
//
//  Created by Liz-Mary on 17.11.2023.
//



import UIKit

protocol GameBuilderProtocol: AnyObject {
    static func build() -> UIViewController
}

class GameBuilder: GameBuilderProtocol {
    
    static func build() -> UIViewController {
        let router = GameRouter()
        let settingsManager = SettingsManager()
        let gameEngine = GameEngine() 
        
        let presenter = GamePresenter(router: router, settingsManager: settingsManager, gameEngine: gameEngine, resultStorage: settingsManager)
        let viewController = GameViewController(presenter: presenter)

        presenter.view = viewController
        router.viewController = viewController
        
        return viewController
    }
}
