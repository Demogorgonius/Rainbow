//
//  ResultsRouter.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 14.11.2023.
//

import UIKit

protocol ResultsRouterProtocol {
    func routeToStartScreen()
}

final class ResultsRouter: ResultsRouterProtocol {
    weak var view: UIViewController?
    func routeToStartScreen() {
        let startScreen = MainBuilder.build()
        view?.navigationController?.setViewControllers([startScreen], animated: true)
    }
    
    
}
