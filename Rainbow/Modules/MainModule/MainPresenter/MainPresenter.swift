//
//  MainPresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 15.11.2023.
//

import Foundation
protocol MainViewProtocol: AnyObject {
    
    func startNewGameButtonTapped()
    func continueGameButtonTapped()
    func statisticGameTapped()
    func settingsGameButtonTapped()
    func infoGameButtonTapped()
}

protocol MainPresenterProtocol {
    
    func startNewGameButtonTapped()
    func continueGameButtonTapped()
    func statisticGameTapped()
    func settingsGameButtonTapped()
    func infoGameButtonTapped()
}

final class MainPresenter: MainPresenterProtocol {
    
   
    var router: MainRouterProtocol
    
    init(router: MainRouterProtocol) {
        self.router = router
    }
    
    func startNewGameButtonTapped() {
        print("Start New Game button tapped")
        router.goToNewGame()
    }
    
    func continueGameButtonTapped() {
        router.goToContinueGame()
    }
    
    func statisticGameTapped() {
        router.goToResults()
    }
    
    func settingsGameButtonTapped() {
        router.goToSettings()
    }
    
    func infoGameButtonTapped() {
        router.goToInfo()
    }
}
