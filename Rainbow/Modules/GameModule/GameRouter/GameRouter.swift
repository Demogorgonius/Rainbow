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
    weak var viewController: UIViewController?
    
    func goToStatistics() {
        let resultsViewController = ResultsBuilder.build()
        viewController?.navigationController?.pushViewController(resultsViewController, animated: true)
    }
}
