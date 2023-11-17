//
//  ResultsPresenter.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 14.11.2023.
//

import Foundation

protocol ResultsPresenterProtocol {
    func clearStatisticOverview()
    func exitButtonPressed()
}

final class ResultsPresenter: ResultsPresenterProtocol {
    
    
    weak var view: ResultsViewProtocol?
    
    private let router: ResultsRouterProtocol
    
    
    init(router: ResultsRouterProtocol) {
        self.router = router
    }
    
    func exitButtonPressed() {
        router.routeToStartScreen()
    }
    
    func clearStatisticOverview() {
        //
    }
    
    
}
