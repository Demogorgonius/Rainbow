//
//  MainBuilder.swift
//  Rainbow
//
//  Created by Liz-Mary on 15.11.2023.
//

import Foundation
import UIKit

protocol MainBuilderProtocol: AnyObject {
    static func build() -> UIViewController
}

class MainBuilder: MainBuilderProtocol {
    
    static func build() -> UIViewController {
        let router = MainRouter()
        let presenter = MainPresenter(router: router)
        let mainView = MainView()
        let viewController = MainViewController()
        
        viewController.presenter = presenter
        presenter.view = mainView
        router.viewController = viewController
        
        return viewController
    }
}
