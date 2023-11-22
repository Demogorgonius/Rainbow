//
//  MainBuilder.swift
//  Rainbow
//
//  Created by Liz-Mary on 15.11.2023.
//

import Foundation
import UIKit

protocol MainBuilderProtocol: AnyObject {
    func build() -> UIViewController
    init(navigationVC: UINavigationController)
}

class MainBuilder: MainBuilderProtocol {
   
    var navigationVC: UINavigationController?
    
    required init(navigationVC: UINavigationController) {
        self.navigationVC = navigationVC
    }
    
    func build() -> UIViewController {
        
        let router = MainRouter(navigationVC: navigationVC)
        let presenter = MainPresenter(router: router)
    
        let viewController = MainViewController(presenter: presenter)
        
        
        presenter.view = viewController
        router.viewController = viewController
        
        return viewController
    }
}
