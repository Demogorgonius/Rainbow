//
//  ResultsRouter.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 14.11.2023.
//

import UIKit

protocol ResultsRouterProtocol {
    
    func routeToStartScreen()
    init(navigationVC: UINavigationController)
    
}

final class ResultsRouter: ResultsRouterProtocol {
    
    weak var navigationVC: UINavigationController?
    
    required init(navigationVC: UINavigationController) {
        self.navigationVC = navigationVC
    }
    
    func routeToStartScreen() {
        
        guard let navigationVC = navigationVC else { return }
        let startScreen = MainBuilder(navigationVC: navigationVC).build()
        navigationVC.setViewControllers([startScreen], animated: true)
        
    }
}
