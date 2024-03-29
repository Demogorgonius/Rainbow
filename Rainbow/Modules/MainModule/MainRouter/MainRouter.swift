
import UIKit

protocol MainRouterProtocol: AnyObject {
  
    func goToNewGame(resumeGame: Bool)
    func goToContinueGame()
    func goToResults()
    func goToSettings()
    func goToInfo()
    init(navigationController: UINavigationController?)
}

class MainRouter: MainRouterProtocol {
    weak var navigationController: UINavigationController?
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func goToNewGame(resumeGame: Bool) {
        guard let navigationController else { return }
        let gameScreen = GameBuilder(navigationController: navigationController).build(resumeGame: resumeGame)
       navigationController.pushViewController(gameScreen, animated: true)
    }
    
    func goToContinueGame() {
        
    }
    
    func goToResults() {
        guard let navigationController else { return }
        let resultsScreen = ResultsBuilder(navigationController: navigationController).build()
        navigationController.pushViewController(resultsScreen, animated: true)
    }
    
    func goToSettings() {
        guard let navigationController else { return }
        let settingsScreen = SettingsBuilder.build()
        navigationController.pushViewController(settingsScreen, animated: true)
    }
    
    func goToInfo() {
        guard let navigationController else { return }
        let rulesScreen = RulesViewController()
        navigationController.pushViewController(rulesScreen, animated: true)
    }
}
