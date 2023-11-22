//
//  GameRouter.swift
//  Rainbow
//
//  Created by Liz-Mary on 17.11.2023.
//

import UIKit

protocol GameRouterProtocol: AnyObject {
    func goToStatistics()
    init(navigationVC: UINavigationController)
}

class GameRouter: GameRouterProtocol {
    weak var viewController: UIViewController?
    weak var navigationVC: UINavigationController?
    
    required init(navigationVC: UINavigationController) {
        self.navigationVC = navigationVC
    }
    
    func goToStatistics() {
        guard let navigationVC = navigationVC else { return }
        let resultsViewController = ResultsBuilder(navigationVC: navigationVC).build()
        navigationVC.pushViewController(resultsViewController, animated: true)
        
    }
}
