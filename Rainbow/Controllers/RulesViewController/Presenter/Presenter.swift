//
//  Presenter.swift
//  Rainbow
//
//  Created by Danila Bolshakov on 14.11.2023.
//

import Foundation

//MARK: - RulesPresenterProtocol
protocol RulesPresenterProtocol {
    func clearStatisticOverview()
}

final class RulesPresenter: RulesPresenterProtocol {
    
    weak var view: ResultsViewProtocol?
    
    private let router: ResultsRouterProtocol
    
    init(router: ResultsRouterProtocol) {
        self.router = router
    }
    func clearStatisticOverview() { }
}
