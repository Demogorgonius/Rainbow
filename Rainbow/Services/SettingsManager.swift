//
//  SettingsManager.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 18.11.2023.
//

import UIKit

enum GameColor: String {
   case customLightGreen = "customLightGreen"
   case customDarkGreen = "customDarkGreen"
   case customPink = "customPink"
   case customLightBlue = "customLightBlue"
   case customBurgundy = "customBurgundy"
   case customViolet = "customViolet"
   case customDarkBlue = "customDarkBlue"
   case customOrange = "customOrange"
   case customRed = "customRed"
   case customYellow = "customYellow"
   case customBlack = "customBlack"
   case customGrayishPurple = "customGrayishPurple"
}

struct GameSettings: Codable {
    var durationGame: Int = 10
    var speedGame: Int = 1
    var checkTask: Bool = true
    var sizeFont: Double = 12
    var backgroundForText: Bool = true
    var backgroundForView: String = GameColor.customOrange.rawValue
    var screenLocation: Bool = true
}

protocol SettingManagerProtocol {
    func saveSettings(
        durationGame: Int?,
        speedGame: Int?,
        checkTask: Bool?,
        sizeFont: Double?,
        backgroundForText: Bool?,
        backgroundForView: String?,
        screenLocation: Bool?,
        completion: @escaping(Result<GameSettings, Error>)->Void
    )
    func getSettings(completion: @escaping(Result<GameSettings,Error>)->Void)
}

protocol ResultsStorageProtocol {
    var results: [GameResultModel] { get }
    
    func addStatistic(_ result: GameResultModel)
    func clearStatistic()
}

class SettingsManager: SettingManagerProtocol, ResultsStorageProtocol {
    
    let defaults = UserDefaults.standard
    
    var results: [GameResultModel] {
        guard let data = defaults.data(forKey: "addStatistic"),
              let results = try? JSONDecoder().decode([GameResultModel].self, from: data) else {
            return []
        }
        return results
    }
    
    func addStatistic(_ result: GameResultModel) {
        let results = [result] + self.results
        if let encoded = try? JSONEncoder().encode(results) {
            defaults.setValue(encoded, forKey: "addStatistic")
        }
    }
    
    func clearStatistic() {
        defaults.setValue([], forKey: "addStatistic")
    }
    



    func saveSettings(
        durationGame: Int?,
        speedGame: Int?,
        checkTask: Bool?,
        sizeFont: Double?,
        backgroundForText: Bool?,
        backgroundForView: String?,
        screenLocation: Bool?,
        completion: @escaping (Result<GameSettings, Error>) -> Void
    ) {

        let settings = GameSettings(
            durationGame: durationGame ?? 10,
            speedGame: speedGame ?? 1,
            checkTask: checkTask ?? true,
            sizeFont: sizeFont ?? 15.0,
            backgroundForText: backgroundForText ?? true,
            backgroundForView: backgroundForView ?? GameColor.customOrange.rawValue,
            screenLocation: screenLocation ?? true
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
                    print("Settings loaded")
                    completion(.success(loadedSettings))
                }
            
        } else {
            completion(.failure(GameErrors.saveSettingsError))
            print("Settings didn't loaded")
        }
    }
}
    
    
