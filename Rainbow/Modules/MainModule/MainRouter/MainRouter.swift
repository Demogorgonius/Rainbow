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
}

class MainRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func goToNewGame() {
        let gameScreen = GameBuilder.build()
        self.viewController?.navigationController?.pushViewController(gameScreen, animated: true)
    }
    
    func goToContinueGame() {
        
    }
    
    func goToResults() {
        let resultsScreen = ResultsBuilder.build()
        viewController?.navigationController?.pushViewController(resultsScreen, animated: true)
    }
    
    func goToSettings() {
        let settingsScreen = SettingsBuilder.build()
        viewController?.navigationController?.pushViewController(settingsScreen, animated: true)
    }
    
    func goToInfo() {
        let rulesScreen = RulesViewController()
        viewController?.navigationController?.pushViewController(rulesScreen, animated: true)
    }
}
