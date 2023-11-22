//
//  GameRouter.swift
//  Rainbow
//
//  Created by Liz-Mary on 17.11.2023.
//

import UIKit

import UIKit

protocol GameRouterProtocol: AnyObject {
    func goToStatistics()
    init(navigationController: UINavigationController)
}

class GameRouter: GameRouterProtocol {
    weak var viewController: UIViewController?
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToStatistics() {
        guard let navigationController = navigationController else { return }
        let resultsViewController = ResultsBuilder.build()
        navigationController.pushViewController(resultsViewController, animated: true)
        
    }
}
