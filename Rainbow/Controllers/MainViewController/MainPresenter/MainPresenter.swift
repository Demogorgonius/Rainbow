//
//  MainPresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 15.11.2023.
//

import Foundation

protocol MainPresenterDelegate: AnyObject {
    
}

protocol MainPresenterProtocol: AnyObject {
    
    var delegate: MainPresenterDelegate? { get set }
    var view: MainView? { get set }
    func startNewGameButtonTapped()
    func continueGameButtonTapped()
    func statisticGameTapped()
    func settingsGameButtonTapped()
    func infoGameButtonTapped()
}

class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainView?
    var delegate: MainPresenterDelegate?
    var router: MainRouterProtocol
    
    init(router: MainRouterProtocol) {
        self.router = router
    }
    
    func startNewGameButtonTapped() {
        router.goToNewGame()
    }
    
    func continueGameButtonTapped() {
        router.goToContinueGame()
    }
    
    func statisticGameTapped() {
        router.goToStatistics()
    }
    
    func settingsGameButtonTapped() {
        router.goToSettings()
    }
    
    func infoGameButtonTapped() {
        router.goToInfo()
    }
}
