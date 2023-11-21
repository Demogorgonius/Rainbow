//
//  SettingsPresenter.swift
//  Rainbow
//
//  Created by Igor Guryan on 15.11.2023.
//

import Foundation

protocol SettingsPresenterProtocol {
    var settings: GameSettings? { get set }
    
    func getSettings()
    func colorButtons(colorCheckers: [ColorChecker]) 
    func saveGameSettings(
        durationGame: Int,
        speedGame: Int,
        checkTask: Bool,
        gameColors: [ColorChecker],
        sizeFont: Double,
        backgroundForText: Bool,
        backgroundForView: String,
        screenLocation: Bool
    )
    
}
    
protocol SettingsViewProtocol: AnyObject  {
    
}

class SettingsPresenter: SettingsPresenterProtocol {

    weak var view: SettingsViewProtocol?

    var settingsManager: SettingManagerProtocol?
    var settings: GameSettings?
    
    
    required init(view: SettingsViewProtocol, settingsManager: SettingManagerProtocol) {
        self.view = view
        self.settingsManager = settingsManager
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

    func saveGameSettings(durationGame: Int, speedGame: Int, checkTask: Bool, gameColors: [ColorChecker], sizeFont: Double, backgroundForText: Bool, backgroundForView: String, screenLocation: Bool) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })

        settingsManager?.saveSettings(
            durationGame: settings?.durationGame,
            speedGame: settings?.speedGame,
            checkTask: settings?.checkTask,
            gameColors: settings?.gameColors,
            sizeFont: settings?.sizeFont,
            backgroundForText: settings?.backgroundForText,
            backgroundForView: settings?.backgroundForView,
            screenLocation: settings?.screenLocation,
            completion:
                {  [weak self]  result in
            switch result {
            case .success(let settings):
                self?.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
