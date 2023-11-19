//
//  SettingsPresenter.swift
//  Rainbow
//
//  Created by Igor Guryan on 15.11.2023.
//

import Foundation

protocol SettingsPresenterProtocol: SettingsViewProtocol {

    init(view: SettingsViewProtocol, router: SettingsRouterProtocol, settingsManager: SettingManagerProtocol)
    func backButtonTapped()
    func gameDuration(duration: Int)
    func speedGame(speed: Int)
    func checkTask(isOn: Bool)
    func colorButtons(colorCheckers: [ColorChecker])
    func sizeFont(size: Double)
    func backgroundForText(isOn: Bool)
    func backgroundForView(color: String)
    func randomScreenLocation(isOn: Bool)
    func getSettings()
    func printHello()
    func saveGameSettings(durationGame: Int, speedGame: Int, checkTask: Bool, gameColors: [ColorChecker], sizeFont: Double, backgroundForText: Bool, backgroundForView: String, screenLocation: Bool)
    var settings: GameSettings? {get set}
}
    

protocol SettingsViewProtocol: AnyObject  {
    
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    weak var view: SettingsViewProtocol?
    private let router: SettingsRouterProtocol!
    var settingsManager: SettingManagerProtocol?
    var settings: GameSettings?
    
    
    required init(view: SettingsViewProtocol, router: SettingsRouterProtocol, settingsManager: SettingManagerProtocol) {
        self.view = view
        self.router = router
        self.settingsManager = settingsManager
    }
    
    func printHello() {
        print("Hello from presenter")
    }
    
    
    func getSettings() {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func gameDuration(duration: Int) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        settings?.durationGame = duration
        settingsManager?.saveSettings(durationGame: duration, speedGame: nil, checkTask: nil, gameColors: nil, sizeFont: nil, backgroundForText: nil, backgroundForView: nil, screenLocation: nil, completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
    }
    
   
    
    func speedGame(speed: Int) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        settings?.speedGame = speed
        settingsManager?.saveSettings(durationGame: nil, speedGame: speed, checkTask: nil, gameColors: nil, sizeFont: nil, backgroundForText: nil, backgroundForView: nil, screenLocation: nil, completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func checkTask(isOn: Bool) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        settings?.checkTask = isOn
        settingsManager?.saveSettings(durationGame: nil, speedGame: nil, checkTask: isOn, gameColors: nil, sizeFont: nil, backgroundForText: nil, backgroundForView: nil, screenLocation: nil, completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func sizeFont(size: Double) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        settings?.sizeFont = size
        settingsManager?.saveSettings(durationGame: nil, speedGame: nil, checkTask: nil, gameColors: nil, sizeFont: size, backgroundForText: nil, backgroundForView: nil, screenLocation: nil, completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func backgroundForText(isOn: Bool) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        settings?.backgroundForText = isOn
        settingsManager?.saveSettings(durationGame: nil, speedGame: nil, checkTask: nil, gameColors: nil, sizeFont: nil, backgroundForText: isOn, backgroundForView: nil, screenLocation: nil, completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func randomScreenLocation(isOn: Bool) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        settings?.screenLocation = isOn
        settingsManager?.saveSettings(durationGame: nil, speedGame: nil, checkTask: nil, gameColors: nil, sizeFont: nil, backgroundForText: nil, backgroundForView: nil, screenLocation: isOn, completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func backgroundForView(color: String) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        settings?.backgroundForView = color
        settingsManager?.saveSettings(durationGame: nil, speedGame: nil, checkTask: nil, gameColors: nil, sizeFont: nil, backgroundForText: nil, backgroundForView: color, screenLocation: nil, completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    
    func colorButtons(colorCheckers: [ColorChecker]) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
                print("загрузил ")
            case .failure(let error):
                print(error.localizedDescription)
                print("Не загрузил ")
            }
        })
        
        settings?.gameColors = colorCheckers
        settingsManager?.saveSettings(durationGame: nil, speedGame: nil, checkTask: nil, gameColors: colorCheckers, sizeFont: nil, backgroundForText: nil, backgroundForView: nil, screenLocation: nil, completion: { result in
            switch result {
            case .success(let settings):
                print("Сохранил")
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
                print("Сохранил")
            }
        })
    }
    
    func saveGameSettings(durationGame: Int, speedGame: Int, checkTask: Bool, gameColors: [ColorChecker], sizeFont: Double, backgroundForText: Bool, backgroundForView: String, screenLocation: Bool) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        settings?.durationGame = durationGame
        settings?.speedGame = speedGame
        settings?.checkTask = checkTask
        settings?.gameColors = gameColors
        settings?.sizeFont = sizeFont
        settings?.backgroundForText = backgroundForText
        settings?.backgroundForView = backgroundForView
        settings?.screenLocation = screenLocation
        settingsManager?.saveSettings(durationGame: durationGame, speedGame: speedGame, checkTask: checkTask, gameColors: gameColors, sizeFont: sizeFont, backgroundForText: backgroundForText, backgroundForView: backgroundForView, screenLocation: screenLocation, completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func backButtonTapped() {
        router.goToStartScreen()
    }
    
    
    
}
