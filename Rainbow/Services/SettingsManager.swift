////
////  SettingsManager.swift
////  Rainbow
////
////  Created by Келлер Дмитрий on 18.11.2023.
////
//
//import UIKit
//
//
//struct GameSettings: Codable {
//    var durationGame: Int = 10
//    var speedGame: Int = 10
//    var checkTask: Bool = true
//    var textColor: String = UIColor.RainbowGameColor.customBlack
//    var sizeFont: Int = 12
//    var backgroundForText: Bool = true
//    var backgroundForView: String = UIColor.RainbowGameColor.customDarkBlue
//    var screenLocation: Bool
//}
//
//protocol SettingManagerProtocol {
//    func saveSettings(
//        durationGame: Double,
//        speedGame: Int,
//        checkTask: Bool,
//        textColor: UIColor.RainbowGameColor,
//        sizeFont: Int,
//        backgroundForText: Bool,
//        backgroundForView: UIColor.RainbowGameColor,
//        screenLocation: Bool
//    )
//}
//
//class SettingsManager: SettingManagerProtocol {
//    
//    let defaults = UserDefaults.standard
//    
//    func saveSettings(durationGame: Double, speedGame: Int, checkTask: Bool, textColor: UIColor.RainbowGameColor, sizeFont: Int, backgroundForText: Bool, backgroundForView: UIColor.RainbowGameColor, screenLocation: Bool) {
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(settings) {
//            
//            defaults.set(encoded, forKey: "gameSettings")
//        }
//        
//        if let settings = defaults.object(forKey: "gameSettings") as? Data {
//            let decoder = JSONDecoder()
//                if let loadedSettings = try? decoder.decode(GameSettings.self, from: settings) {
//                    completion(.success(loadedSettings))
//                }
//            
//        } else {
//            completion(.failure(QuestionsErrors.saveSettingsError))
//        }
//    }
//    
//    func getSettings(completion: @escaping (Result<GameSettings, Error>) -> Void) {
//        if let settings = defaults.object(forKey: "gameSettings") as? Data {
//            let decoder = JSONDecoder()
//                if let loadedSettings = try? decoder.decode(GameSettings.self, from: settings) {
//                    completion(.success(loadedSettings))
//                }
//            
//        } else {
//            completion(.failure(QuestionsErrors.saveSettingsError))
//        }
//    }
//    
//    func savingGame() -> Bool {
//        
//        if ((defaults.object(forKey: "savedQuestions") as? [String]) != nil) {
//            return true
//        } else {
//            return false
//        }
//    }
//    
//}
//    
//    
//
//    
//    
//
