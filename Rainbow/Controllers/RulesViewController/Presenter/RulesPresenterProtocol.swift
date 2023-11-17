//
//  Presenter.swift
//  Rainbow
//
//  Created by Danila Bolshakov on 14.11.2023.
//

import Foundation

//MARK: - RulesViewProtocol Update View
protocol RulesViewProtocol: AnyObject  {
    func successfully()
    func unsuccessful()
}

//MARK: - RulesPresenterProtocol Action Presenter
protocol RulesPresenterProtocol {
    func clearStatisticOverview()
    func tappedPauseGame()
    func playGame()
}

final class RulesPresenter: RulesPresenterProtocol {
    
    //MARK: - Weak Link View
    weak var view: RulesViewProtocol?
    private let router: RulesRouterProtocol
    
    init(router: RulesRouterProtocol) {
        self.router = router
    }
    
    //MARK: - Methods Action Presenter
    func clearStatisticOverview() {
        router.routeToMainScreen()
    }
    
    func tappedPauseGame() {
        router.routeToStartScreen()
    }
    
    func playGame() {
        router.routeToStaticScreen()
    }
}
