//
//  ResultsBuilder.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 14.11.2023.
//

import UIKit


protocol ResultsBuilderProtocol: AnyObject {
    func build() -> UIViewController
    init(navigationController: UINavigationController)
}

final class ResultsBuilder: ResultsBuilderProtocol {
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func build() -> UIViewController {
        guard let navigationController else {
            fatalError("ResultsBuilder requires a valid navigationController")
        }
        let viewController = ResultsTableViewController()
        let router = ResultsRouter(navigationController: navigationController)
        let resultStorage = SettingsManager()
        let presenter = ResultsPresenter(router: router, resultStorage: resultStorage)
        
        viewController.presenter = presenter
        return viewController
    }
}
