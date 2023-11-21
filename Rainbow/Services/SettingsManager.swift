//
//  SettingsManager.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 18.11.2023.
//

import UIKit

struct ColorChecker: Codable{
    let color: String
    var isOn: Bool
    
    init(color: String, isOn: Bool) {
        self.color = color
        self.isOn = isOn
    }
}


struct ColorButtons: Codable{
    var colorButtons = [
        ColorChecker(color: "customLightGreen", isOn: true),
        ColorChecker(color: "customDarkGreen", isOn: true),
        ColorChecker(color: "customPink", isOn: true),
        ColorChecker(color: "customLightBlue", isOn: true),
        ColorChecker(color: "customBurgundy", isOn: true),
        ColorChecker(color: "customViolet", isOn: true),
        ColorChecker(color: "customDarkBlue", isOn: true),
        ColorChecker(color: "customOrange", isOn: true),
        ColorChecker(color: "customRed", isOn: true),
        ColorChecker(color: "customYellow", isOn: true),
        ColorChecker(color: "customBlack", isOn: true),
        ColorChecker(color: "customGrayishPurple", isOn: true)]
    
//    func toggleState(for i: Int) {
//        colorButtons = colorButtons[i].isOn
//    }
}

let colorButtons = ColorButtons()
let color = colorButtons.colorButtons


struct GameSettings: Codable {
    var numberGame = 1
    var durationGame = 10
    var speedGame: Int = 1
    var checkTask = true
    var gameColors: [ColorChecker]
    var sizeFont = 12.0
    var backgroundForText = true
    var backgroundForView = "customBackground"
    var screenLocation = true
}

protocol SettingManagerProtocol {
    
    func saveSettings(
        durationGame: Int?,
        speedGame: Int?,
        checkTask: Bool?,
        gameColors: [ColorChecker]?,
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

typealias GameManagerProtocol = SettingManagerProtocol & ResultsStorageProtocol

class SettingsManager: GameManagerProtocol {
    
    
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
        gameColors: [ColorChecker]?,
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
            gameColors: gameColors ?? [],
            sizeFont: sizeFont ?? 15.0,
            backgroundForText: backgroundForText ?? true,
            backgroundForView: backgroundForView ?? "customBackground",
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
    
    
