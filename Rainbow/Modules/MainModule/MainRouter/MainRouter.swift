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
    init(navigationVC: UINavigationController?)
}

class MainRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController?
    var navigationVC: UINavigationController?
    
    required init(navigationVC: UINavigationController?) {
        self.navigationVC = navigationVC
    }
    
    func goToNewGame() {
        
//        let gameScreen = GameBuilder.build()
//        self.viewController?.navigationController?.pushViewController(gameScreen, animated: true)
        
        guard let navigationVC = navigationVC else { return }
        let gameScreen = GameBuilder(navigationVC: navigationVC).build()
        navigationVC.pushViewController(gameScreen, animated: true)
        
    }
    
    func goToContinueGame() {
        let alert = AlertFactory.createAlert(for: .warning)
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func goToResults() {
        guard let navigationVC = navigationVC else { return }
        let resultsScreen = ResultsBuilder(navigationVC: navigationVC).build()
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
