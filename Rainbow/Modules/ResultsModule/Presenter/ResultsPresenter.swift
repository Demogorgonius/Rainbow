//
//  ResultsPresenter.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 14.11.2023.
//

import Foundation

protocol ResultsPresenterProtocol {
    var resultStorage: ResultsStorageProtocol { get }
    
    func getStatistic()
    func clearStatisticOverview()
    func exitButtonPressed()
    init(router: ResultsRouterProtocol, resultStorage: ResultsStorageProtocol)
    
}

final class ResultsPresenter: ResultsPresenterProtocol {
    
    weak var view: ResultsViewProtocol?
    internal let resultStorage: ResultsStorageProtocol
    private let router: ResultsRouterProtocol
    
    required init(router: ResultsRouterProtocol, resultStorage: ResultsStorageProtocol) {
        self.router = router
        self.resultStorage = resultStorage
    }
    
    func exitButtonPressed() {
        router.routeToStartScreen()
    }
    
    func getStatistic() {
        //
    }
    
    func clearStatisticOverview() {
        resultStorage.clearStatistic()
       
    }
}
