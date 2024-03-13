
import UIKit

protocol GameViewProtocol: AnyObject {
    
    func getSettings()
    func getRainbowView()
    
}

protocol GamePresenterProtocol {

    func getSettings()
    func routeToResultScreen()
    
    init (router: GameRouterProtocol,
          gameManager: GameManagerProtocol,
          rainbowViewManager: RainbowViewManagerProtocol,
          stateManager: StateManagerProtocol,
          resumeGame: Bool)
    
}

class GamePresenter: GamePresenterProtocol {
    weak var view: GameViewProtocol?
    
    var router: GameRouterProtocol?
    var gameManager: GameManagerProtocol?
    var rainbowViewManager: RainbowViewManagerProtocol?
    var stateManager: StateManagerProtocol?
    var resumeGame: Bool?
    
    var startTime: Date?
    var elapsedTime: TimeInterval?
    
    var numberGame = 1
    lazy var defaultSpeed = settings?.speedGame ?? 1
    lazy var countRainbowView = defaultSpeed * (settings?.durationGame ?? 10)
    lazy var speed = countRainbowView * defaultSpeed
    
    var colorViews: [RainbowView] = []
    
    var settings: GameSettings?
    
    required init(router: GameRouterProtocol, 
                  gameManager: GameManagerProtocol, 
                  rainbowViewManager: RainbowViewManagerProtocol,
                  stateManager: StateManagerProtocol,
                  resumeGame: Bool) {
        self.router = router
        self.gameManager = gameManager
        self.rainbowViewManager = rainbowViewManager
        self.stateManager = stateManager
        self.resumeGame = resumeGame
    }
    
    func getSettings() {
        guard let gameManager else { return }
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
        router?.goToStatistics()
    }
    
    
}
