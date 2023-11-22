//
//  MainRouter.swift
//  Rainbow
//
//  Created by Liz-Mary on 15.11.2023.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    func goToNewGame()
    func goToContinueGame()
    func goToResults()
    func goToSettings()
    func goToInfo()
    init(navigationController: UINavigationController)
}

class MainRouter: MainRouterProtocol {
    
    private weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func goToNewGame() {
        print("GameRouter - Going to New Game")
        
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: false)
        
        let gameBuilder = GameBuilder(navigationController: navigationController)
        let gameScreen = gameBuilder.build()
        
        navigationController.pushViewController(gameScreen, animated: true)
    }

    
    func goToContinueGame() {
//        let alert = AlertFactory.createAlert(for: .warning)
//        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func goToResults() {
//        let resultsScreen = ResultsBuilder.build()
//        viewController?.navigationController?.pushViewController(resultsScreen, animated: true)
    }
    
    func goToSettings() {
//        let settingsScreen = SettingsBuilder.build()
//        viewController?.navigationController?.pushViewController(settingsScreen, animated: true)
    }
    
    func goToInfo() {
//        let rulesScreen = RulesViewController()
//        viewController?.navigationController?.pushViewController(rulesScreen, animated: true)
    }
}
