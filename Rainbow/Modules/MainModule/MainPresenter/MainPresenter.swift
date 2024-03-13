

import Foundation

protocol MainViewProtocol: AnyObject {
    func changeButtonState(resumeGame: Bool)
}

protocol MainPresenterProtocol {
    
    init(router: MainRouterProtocol, stateManager: StateManagerProtocol)
    func startNewGameButtonTapped()
    func continueGameButtonTapped()
    func statisticGameTapped()
    func settingsGameButtonTapped()
    func infoGameButtonTapped()
    func checkForResume()
}

final class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol?
    var router: MainRouterProtocol
    var stateManager: StateManagerProtocol?
    
    required init(router: MainRouterProtocol, stateManager: StateManagerProtocol) {
        self.router = router
        self.stateManager = stateManager
    }
    
    func startNewGameButtonTapped() {
        router.goToNewGame(resumeGame: false)
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
    
    func checkForResume() {
        
        guard let stateManager else { return }
        if stateManager.checkState() {
            view?.changeButtonState(resumeGame: true)
        } else {
            view?.changeButtonState(resumeGame: false)
        }
        
    }
    
}
