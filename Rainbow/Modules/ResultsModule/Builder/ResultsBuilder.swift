//
//  ResultsBuilder.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 14.11.2023.
//

import UIKit

protocol ResultsBuilderProtocol: AnyObject {
    
    func build() -> UIViewController
    init(navigationVC: UINavigationController)
    
}

final class ResultsBuilder: ResultsBuilderProtocol {
    
    var navigationVC: UINavigationController
    
    required init(navigationVC: UINavigationController) {
        
        self.navigationVC = navigationVC
        
    }
    
    func build() -> UIViewController {
        
        
        let router = ResultsRouter(navigationVC:  navigationVC)
        let resultStorage = SettingsManager()
        let presenter = ResultsPresenter(router: router, resultStorage: resultStorage)
        let view = ResultsTableViewController(presenter: presenter)
        
        presenter.view = view
//        router.view = view
        
        return view
    }
}
