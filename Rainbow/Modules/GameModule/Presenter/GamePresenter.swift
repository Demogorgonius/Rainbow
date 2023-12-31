
import UIKit

protocol GameViewProtocol: AnyObject {
    func getSettings()
    func getRainbowView()

}

protocol GamePresenterProtocol {
    
    var gameManager: GameManagerProtocol { get set }
    var colorViews: [RainbowView] { get set }
    var rainbowViewManager: RainbowViewManagerProtocol { get set }
    var startTime: Date? { get set }
    var numberGame: Int { get set }
    var elapsedTime: TimeInterval? { get set }
    
    var countRainbowView: Int { get set }
    var defaultSpeed: Int { get set }
    var speed: Int { get set }
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
    lazy var defaultSpeed = settings?.speedGame ?? 1
    lazy var countRainbowView = defaultSpeed * (settings?.durationGame ?? 10)
    lazy var speed = countRainbowView * defaultSpeed
    
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
