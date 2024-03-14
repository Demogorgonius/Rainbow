
import UIKit

protocol GameBuilderProtocol: AnyObject {
    func build(resumeGame: Bool) -> UIViewController
    init(navigationController: UINavigationController)
}

class GameBuilder: GameBuilderProtocol {
    
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func build(resumeGame: Bool) -> UIViewController {
        guard let navigationController else {
            fatalError("GameBuilder requires a valid navigationController")
        }

        let router = GameRouter(navigationController: navigationController)
        let gameManager = SettingsManager()
        let gameSettings = GameSettings()
        let gameService = GameService()
        let stateManager = StateManager()
        let rainbowViewManager = RainbowViewManager(settings: gameSettings)
        let presenter = GamePresenter(
            router: router,
            gameManager: gameManager,
            rainbowViewManager: rainbowViewManager,
            stateManager: stateManager,
            resumeGame: resumeGame)
        let viewController = GameViewController()

        viewController.presenter = presenter
        viewController.gameService = gameService
        
        return viewController
    }
}
