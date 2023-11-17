//
//  MainRouter.swift
//  Rainbow
//
//  Created by Liz-Mary on 15.11.2023.
//

import Foundation
import UIKit

protocol MainRouterProtocol: AnyObject {
    func goToNewGame()
    func goToContinueGame()
    func goToStatistics()
    func goToSettings()
    func goToInfo()
}

// MARK: - MainRouter
class MainRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func goToNewGame() {
        let view = GameBuilder.build()
        self.viewController?.navigationController?.pushViewController(view, animated: true)
    }
    
    func goToContinueGame() {
        
    }
    
    func goToStatistics() {
        let settingsViewController = ResultsBuilder.build()
        viewController?.navigationController?.pushViewController(settingsViewController, animated: true)
        
    }
    
    
    func goToSettings() {
        let view = SettingsBuilder.build()
        self.viewController?.navigationController?.pushViewController(view, animated: true)
    }
    
    func goToInfo() {
        let settingsViewController = RulesBuilder.build()
        viewController?.navigationController?.pushViewController(settingsViewController, animated: true)
    }
}
