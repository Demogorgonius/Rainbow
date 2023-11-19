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
    var startTime: Date? { get set }
    var elapsedTime: TimeInterval? { get set }
    
    var numberGame: Int { get set }
    var resultStorage: ResultsStorageProtocol { get set }
    

    var totalTime: TimeInterval { get set }
    var speedGame: Int { get set }
    var checkTask: Bool { get set }
    var sizeFont: Double { get set }
    var backgroundForText: Bool { get set }
    var backgroundForView: String { get set }
    var screenLocation: Bool { get set }
    
    func getSettings()
}

class GamePresenter: GamePresenterProtocol {
    

    
    weak var view: GameViewProtocol?
    
    let settingsManager: SettingManagerProtocol
    private let router: GameRouterProtocol
    
    var startTime: Date?
    var elapsedTime: TimeInterval?
    
    
        
    var colorViews: [UIView] = []
    var colorNames: [UILabel] = []
    
    var settings: GameSettings?
    var resultStorage: ResultsStorageProtocol
    
    var numberGame: Int = 0
    var totalTime: TimeInterval = 10.0
    var speedGame: Int = 1
    var checkTask: Bool = true
    var sizeFont: Double = 14
    var backgroundForText: Bool = true
    var backgroundForView: String = "customBackground"
    var screenLocation: Bool = true
    
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
                
                self.totalTime = TimeInterval(settings.durationGame)
                self.speedGame = settings.speedGame
                self.checkTask = settings.checkTask
                self.sizeFont = settings.sizeFont
                self.backgroundForText = settings.backgroundForText
                self.backgroundForView = settings.backgroundForView
                self.screenLocation = settings.screenLocation
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
