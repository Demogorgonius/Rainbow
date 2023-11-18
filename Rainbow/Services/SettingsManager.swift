//
//  SettingsManager.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 18.11.2023.
//

import UIKit



enum GameColor: String {
   case white
   case customLightGreen
   case customDarkGreen
   case customPink
   case customLightBlue
   case customBurgundy
   case customViolet
   case customDarkBlue
   case customOrange
   case customRed
   case customYellow
   case customBlack
   case customGrayishPurple
}

struct GameSettings: Codable {
    var durationGame: Int = 10
    var speedGame: Int = 10
    var checkTask: Bool = true
    var textColor: String = GameColor.white.rawValue
    var sizeFont: Int = 12
    var backgroundForText: Bool = true
    var backgroundForView: String = GameColor.customOrange.rawValue
    var screenLocation: Bool
}

protocol SettingManagerProtocol {
    func saveSettings(
        durationGame: Int,
        speedGame: Int,
        checkTask: Bool,
        textColor: String,
        sizeFont: Int,
        backgroundForText: Bool,
        backgroundForView: String,
        screenLocation: Bool,
        completion: @escaping(Result<GameSettings, Error>)->Void
    )
}

class SettingsManager: SettingManagerProtocol {
    
    let defaults = UserDefaults.standard
    
    func saveSettings(
        durationGame: Int,
        speedGame: Int,
        checkTask: Bool,
        textColor: String,
        sizeFont: Int,
        backgroundForText: Bool,
        backgroundForView: String,
        screenLocation: Bool,
        completion: @escaping (Result<GameSettings, Error>) -> Void
    ) {
        
        let settings = GameSettings(
            durationGame: durationGame,
            speedGame: speedGame,
            checkTask: checkTask,
            textColor: textColor,
            sizeFont: sizeFont,
            backgroundForText: backgroundForText,
            backgroundForView: backgroundForView,
            screenLocation: screenLocation
        
        )
        
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(settings) {
            
            defaults.set(encoded, forKey: "gameSettings")
        }
        
        if let settings = defaults.object(forKey: "gameSettings") as? Data {
            let decoder = JSONDecoder()
                if let loadedSettings = try? decoder.decode(GameSettings.self, from: settings) {
                    completion(.success(loadedSettings))
                }
            
        } else {
            completion(.failure(GameErrors.saveSettingsError))
        }
    }
    
    func getSettings(completion: @escaping (Result<GameSettings, Error>) -> Void) {
        if let settings = defaults.object(forKey: "gameSettings") as? Data {
            let decoder = JSONDecoder()
                if let loadedSettings = try? decoder.decode(GameSettings.self, from: settings) {
                    completion(.success(loadedSettings))
                }
            
        } else {
            completion(.failure(GameErrors.saveSettingsError))
        }
    }
}
    
    
