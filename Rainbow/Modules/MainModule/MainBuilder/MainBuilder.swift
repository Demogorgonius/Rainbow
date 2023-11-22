//
//  MainBuilder.swift
//  Rainbow
//
//  Created by Liz-Mary on 15.11.2023.
//

import UIKit

protocol MainBuilderProtocol: AnyObject {
    func build() -> UIViewController
    init(navigationController: UINavigationController)
}

class MainBuilder: MainBuilderProtocol {
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func build() -> UIViewController {
        guard let navigationController else {
            fatalError("MainBuilder requires a valid navigationController")
        }
        let viewController = MainViewController()
        let router = MainRouter(navigationController: navigationController)
        let presenter = MainPresenter(router: router)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
