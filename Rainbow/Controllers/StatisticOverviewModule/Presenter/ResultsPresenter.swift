//
//  ResultsPresenter.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 14.11.2023.
//

import Foundation

protocol ResultsPresenterProtocol {
    func clearStatisticOverview()
}

final class ResultsPresenter: ResultsPresenterProtocol {
    
    weak var view: ResultsViewProtocol?
    
    private let router: ResultsRouterProtocol
    
    
    init(router: ResultsRouterProtocol) {
        self.router = router
    }
    
    func clearStatisticOverview() {
        //
    }
    
    
}
