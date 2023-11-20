//
//  GamePresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//


import UIKit

protocol GameViewProtocol: AnyObject {
    func startTimer(with elapsedTime: TimeInterval?)
    func getSettings()
}


protocol GamePresenterProtocol {
    var colorViews: [UIView] { get set }
    var colorNames: [UILabel] { get set }
    
    var gameManager: GameManagerProtocol { get set }
    
    var startTime: Date? { get set }
    var numberGame: Int { get set }
    var elapsedTime: TimeInterval? { get set }
    
    var settings: GameSettings? { get set }
    func getSettings()
    
    func routeToResultScreen()
}

class GamePresenter: GamePresenterProtocol {
    weak var view: GameViewProtocol?
    
    private let router: GameRouterProtocol
    
    var gameManager: GameManagerProtocol
    var startTime: Date?

    var elapsedTime: TimeInterval?
    
    var numberGame = 1
      
    var colorViews: [UIView] = []
    var colorNames: [UILabel] = []
    
    var settings: GameSettings?
    
    init(router: GameRouterProtocol, gameManager: GameManagerProtocol) {
        self.router = router
        self.gameManager = gameManager
    }
    
    func getSettings() {
        gameManager.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func routeToResultScreen() {
        router.goToStatistics()
    }
}
