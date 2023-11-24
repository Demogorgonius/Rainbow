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
    
    func saveGameSettings(
        durationGame: Int?,
        speedGame: Int?,
        isChecksTask: Bool?,
        gameColors: [ColorChecker]?,
        sizeFont: Double?,
        isViewForText: Bool?,
        themeForApp: String?,
        isCenterOnScreen: Bool?
    )
}

protocol SettingsViewProtocol: AnyObject  {
    func getDuration() -> Float
    func getSpeed() -> Float
    func isCheck() -> Bool
    func getButtonColors() -> [ColorChecker]
    func getFontSize() -> Double
    func isBackground() -> Bool
    func getGameBackground() -> String
    func isRandomLocation() -> Bool
}

class SettingsPresenter: SettingsPresenterProtocol {
    weak var view: SettingsViewProtocol?
    
    var settingsManager: SettingManagerProtocol?
    var settings: GameSettings?
    
    init(view: SettingsViewProtocol, settingsManager: SettingManagerProtocol) {
        self.view = view
        self.settingsManager = settingsManager
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
    
    func saveGameSettings(
        durationGame: Int?,
        speedGame: Int?,
        isChecksTask: Bool?,
        gameColors: [ColorChecker]?,
        sizeFont: Double?,
        isViewForText: Bool?,
        themeForApp: String?,
        isCenterOnScreen: Bool?
    ) {
        settingsManager?.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        settingsManager?.saveSettings(
            durationGame: durationGame ?? settings?.durationGame,
            speedGame: speedGame ?? settings?.speedGame,
            isChecksTask: isChecksTask ?? settings?.isChecksTask ?? false,
            gameColors: gameColors ?? settings?.gameColors,
            sizeFont: sizeFont ?? settings?.sizeFont,
            isViewForText: isViewForText ?? settings?.isViewForText ?? false,
            themeForApp: themeForApp ?? settings?.themeForApp ?? "",
            isCenterOnScreen: isCenterOnScreen ?? settings?.isCenterOnScreen ?? false,
            completion: { [weak self] result in
                switch result {
                case .success(let settings):
                    self?.settings = settings
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        )
    }
}
