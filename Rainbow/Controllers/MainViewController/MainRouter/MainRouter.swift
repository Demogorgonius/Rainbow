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

class MainRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func goToNewGame() {
        let view = GameViewController()
        self.viewController?.navigationController?.pushViewController(view, animated: true)
    }
    
    func goToContinueGame() {
        
    }
    
    func goToStatistics() {
        let settingsViewController = ResultsBuilder.build()
        viewController?.navigationController?.pushViewController(settingsViewController, animated: true)
        
    }
    
    
    func goToSettings() {
        let view = SettingsViewController()
        self.viewController?.navigationController?.pushViewController(view, animated: true)
    }
    
    func goToInfo() {
        
    }
}
