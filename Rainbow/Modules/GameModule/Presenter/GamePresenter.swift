//
//  GamePresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//


import UIKit

protocol GameViewProtocol: AnyObject {
    func getSettings()
    func getRainbowView()
    func settingSpeed(_ xSpeed: Speed, _ duration: CGFloat)
    func startTimer(with elapsedTime: TimeInterval?)
}

protocol GamePresenterProtocol {
    
    var gameManager: GameManagerProtocol { get set }
    var colorViews: [RainbowView] { get set }
    var startTime: Date? { get set }
    var numberGame: Int { get set }
    var elapsedTime: TimeInterval? { get set }
    
    var countColors: Double { get set }
    var defaultSpeed: String { get set }
    var speed: Double { get set }
    var settings: GameSettings? { get set }
    func getSettings()
    
    func getRainbowView(count: Int)
    func routeToResultScreen()
}

class GamePresenter: GamePresenterProtocol {
    
    weak var view: GameViewProtocol?
    
    private let router: GameRouterProtocol
    
    var gameManager: GameManagerProtocol
    var rainbowViewManager: RainbowViewManagerProtocol
    
    var startTime: Date?
    var elapsedTime: TimeInterval?
    
    var numberGame = 1
    lazy var countColors = 150 * Double(settings?.durationGame ?? 2)
    lazy var speed = countColors * 4
    var defaultSpeed = Speed.x1.rawValue
    
    var colorViews: [RainbowView] = []
    
    var settings: GameSettings?
    
    init(
        router: GameRouterProtocol,
        gameManager: GameManagerProtocol,
        rainbowViewManager: RainbowViewManagerProtocol
    )
    {
        self.router = router
        self.gameManager = gameManager
        self.rainbowViewManager = rainbowViewManager
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
    
    func getRainbowView(count: Int) {
        for _ in 0..<count {
            let rainbowView = rainbowViewManager.getRandomRainbowView()
            colorViews.append(rainbowView)
        }
    }
    
    func routeToResultScreen() {
        router.goToStatistics()
    }
}
