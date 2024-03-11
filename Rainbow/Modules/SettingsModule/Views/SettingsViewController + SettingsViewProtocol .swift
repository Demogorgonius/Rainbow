//
//  SettingsViewController + SettingsViewProtocol .swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 08.03.2024.
//

import Foundation

// MARK: - Extension for SettingsViewProtocol - Methods to update View From Settings
extension SettingsViewController: SettingsViewProtocol {
    
    func getDuration() -> Float {
        guard let settings = presenter.settings else { return 0.3 }
        return Float(settings.durationGame)
    }
    
    func getSpeed() -> Float {
        guard let settings = presenter.settings else { return 0.3 }
        return Float(settings.speedGame)
    }
    
    func getButtonColors() -> [ColorChecker] {
        guard let settings = presenter.settings else { return [] }
        return settings.gameColors
    }
    
    func isViewForText() -> Bool {
        guard let settings = presenter.settings else { return true }
        return settings.isViewForText
    }
    
    func getFontSize() -> Double {
        guard let settings = presenter.settings else { return 15.0 }
        return settings.sizeFont
    }
    
    func getGameBackground() -> String {
        guard let settings = presenter.settings else { return "" }
        return settings.themeForApp
    }
    
    func isRandomLocation() -> Bool {
        guard let settings = presenter.settings else { return true }
        return settings.isCenterOnScreen
    }
}
