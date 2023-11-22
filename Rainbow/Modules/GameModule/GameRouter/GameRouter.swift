//
//  GameRouter.swift
//  Rainbow
//
//  Created by Liz-Mary on 17.11.2023.
//

import UIKit

protocol GameRouterProtocol: AnyObject {
    func goToStatistics()
}

class GameRouter: GameRouterProtocol {
    
    weak var viewController: GameViewProtocol?
    
    init(viewController: GameViewProtocol) {
        self.viewController = viewController
    }
    
    
    func goToStatistics() {
        
//        let resultsViewController = ResultsBuilder.build()
//        navigationController?.pushViewController(resultsViewController, animated: true)
    }
}
