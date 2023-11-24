//
//  GameRouter.swift
//  Rainbow
//
//  Created by Liz-Mary on 17.11.2023.
//

import UIKit

protocol GameRouterProtocol: AnyObject {
    func goToStatistics()
    init(navigationController: UINavigationController?)
}

class GameRouter: GameRouterProtocol {
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func goToStatistics() {
        guard let navigationController else { return }
        let resultsViewController = ResultsBuilder(navigationController: navigationController).build()
        navigationController.pushViewController(resultsViewController, animated: true)
    }
}
