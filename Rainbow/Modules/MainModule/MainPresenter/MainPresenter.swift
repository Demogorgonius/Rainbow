

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
    
    weak var view: MainViewProtocol?
   
    var router: MainRouterProtocol
    
    init(router: MainRouterProtocol) {
        self.router = router
    }
    
    func startNewGameButtonTapped() {
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
