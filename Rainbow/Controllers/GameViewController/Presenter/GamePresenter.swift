//
//  GamePresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//


import UIKit

protocol GameViewProtocol: AnyObject {
    func startTimer(with elapsedTime: TimeInterval?)
   
}


protocol GamePresenterProtocol {
    var colorViews: [UIView] { get set }
    var colorNames: [String] { get set }
    var totalTime: TimeInterval { get set }
    var startTime: Date? { get set }
    var elapsedTime: TimeInterval? { get set }
    
    var numberGame: Int { get set }
    var resultStorage: ResultsStorageProtocol { get set }

    func getSettings()
}

class GamePresenter: GamePresenterProtocol {
    
    weak var view: GameViewProtocol?
    
    let settingsManager: SettingManagerProtocol
    private let router: GameRouterProtocol
    
    var startTime: Date?
    var totalTime: TimeInterval = 10.0
    var elapsedTime: TimeInterval?
    
    var numberGame: Int = 0
    var colorViews: [UIView] = []
    var colorNames: [String] = []
    
    var settings: GameSettings?
    var resultStorage: ResultsStorageProtocol
    
    init(router: GameRouterProtocol, settingsManager: SettingManagerProtocol, resultStorage: ResultsStorageProtocol) {
        self.router = router
        self.settingsManager = settingsManager
        self.resultStorage = resultStorage
    }
  
    func getSettings() {
        settingsManager.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
