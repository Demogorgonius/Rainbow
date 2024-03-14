
import UIKit

enum SuccessType {
    case saveOk
    case deleteOk
    case defaultLoad
    case settingView
}

protocol GameViewProtocol: AnyObject {
    
    func setSettings(totalTime: Int)
    func success(successType: SuccessType)
    func failure(error: Error)
    
}

protocol GamePresenterProtocol {
    var settings: GameSettings? {get set}
    var viewModel: ViewModel? {get set}
    var resumeGame: Bool? {get set}
    func getSettings()
    func routeToResultScreen()
    func setView()
    func deleteState()
    
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
    var stateManager: StateManagerProtocol!
    var viewModel: ViewModel?
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
        getSettings()
    }
    
    func getSettings() {
        guard let gameManager else { return }
        gameManager.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
                self.view?.setSettings(totalTime: settings.durationGame)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    
    func routeToResultScreen() {
        router?.goToStatistics()
    }
    
    func saveState(vPosition: CGRect,
                   tPosition: CGRect,
                   bColor: String,
                   fColor: String,
                   restTime: Int,
                   duration: TimeInterval,
                   remainingDuration: TimeInterval,
                   alpha: CGFloat) {
        
        stateManager.saveState(vPosition: vPosition,
                               tPosition: tPosition,
                               bColor: bColor,
                               fColor: fColor,
                               restTime: restTime,
                               duration: duration,
                               remainingDuration: remainingDuration,
                               alpha: alpha) { [weak self] result in
                               
            guard let self = self else { return }
            switch result {
            case .success(let viewModel):
                self.viewModel = viewModel
                self.view?.success(successType: .saveOk)
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
        
    }
    
    func deleteState() {
        if stateManager.checkState() {
            stateManager.deleteState { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let result):
                    if result {
                        self.view?.success(successType: .deleteOk)
                    }
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func loadView() {
        stateManager.resumeState { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let viewModel):
                self.viewModel = viewModel
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
    
    func setView() {
        
        if stateManager.checkState() {
            loadView()
            if viewModel != nil {
                view?.success(successType: .settingView)
            }
        } else {
            view?.success(successType: .defaultLoad)
        }
        
    }
    
    
}
