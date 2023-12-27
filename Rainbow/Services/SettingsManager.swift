
import UIKit

struct ColorChecker: Codable{
    let color: String
    var isOn: Bool
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
}

let colorButtons = ColorButtons()
let color = colorButtons.colorButtons


struct GameSettings: Codable {
    var durationGame = 10
    var speedGame = 1
    var gameColors: [ColorChecker] = color
    var sizeFont = 18.0
    var isViewForText = false
    var themeForApp = "customBackground"
    var isCenterOnScreen = true
}

protocol SettingManagerProtocol {
    
    func saveSettings(
        durationGame: Int?,
        speedGame: Int?,
        gameColors: [ColorChecker]?,
        sizeFont: Double?,
        isViewForText: Bool?,
        themeForApp: String?,
        isCenterOnScreen: Bool?,
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
        guard let data = defaults.data(forKey: Keys.statistic.rawValue),
              let results = try? JSONDecoder().decode([GameResultModel].self, from: data) else {
            return []
        }
        return results
    }
    
    func addStatistic(_ result: GameResultModel) {
        let results = [result] + self.results
        if let encoded = try? JSONEncoder().encode(results) {
            defaults.setValue(encoded, forKey: Keys.statistic.rawValue)
        }
    }
    
    func clearStatistic() {
        defaults.removeObject(forKey: Keys.statistic.rawValue)
    }
    
    func saveSettings(
        durationGame: Int?,
        speedGame: Int?,
        gameColors: [ColorChecker]?,
        sizeFont: Double?,
        isViewForText: Bool?,
        themeForApp: String?,
        isCenterOnScreen: Bool?,
        completion: @escaping (Result<GameSettings, Error>) -> Void
    ) {
        
        let settings = GameSettings(
            durationGame: durationGame ?? 10,
            speedGame: speedGame ?? 1,
            gameColors: gameColors ?? [],
            sizeFont: sizeFont ?? 15.0,
            isViewForText: isViewForText ?? true,
            themeForApp: themeForApp ?? "customBackground",
            isCenterOnScreen: isCenterOnScreen ?? true
        )
        
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(settings) {
            
            defaults.set(encoded, forKey: Keys.gameSettings.rawValue)
        }
        
        if let settings = defaults.object(forKey: Keys.gameSettings.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let loadedSettings = try? decoder.decode(GameSettings.self, from: settings) {
                completion(.success(loadedSettings))
            }
            
        } else {
            completion(.failure(GameErrors.saveSettingsError))
        }
    }
    
    func getSettings(completion: @escaping (Result<GameSettings, Error>) -> Void) {
        if let settings = defaults.object(forKey: Keys.gameSettings.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let loadedSettings = try? decoder.decode(GameSettings.self, from: settings) {
                print("Settings loaded")
                completion(.success(loadedSettings))
            }
            
        } else {
            
            if createStartSettings() {
                
                if let settings = defaults.object(forKey: Keys.gameSettings.rawValue) as? Data {
                    let decoder = JSONDecoder()
                    if let loadedSettings = try? decoder.decode(GameSettings.self, from: settings) {
                        print("Settings loaded")
                        completion(.success(loadedSettings))
                    }
                }
                
            } else {
                
                completion(.failure(GameErrors.saveSettingsError))
                print("Settings didn't loaded")
                
            }
            
            
            
//            completion(.failure(GameErrors.saveSettingsError))
//            print("Settings didn't loaded")
        }
    }
    
    func createStartSettings() -> Bool {
        
        
        let colorButtons = ColorButtons()
        
        
        
        let settings = GameSettings(
            durationGame:  10,
            speedGame:  1,
            gameColors:  colorButtons.colorButtons,
            sizeFont: 15.0,
            isViewForText: true,
            themeForApp: "customBackground",
            isCenterOnScreen:  true
        )
        
        
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(settings) {
            
            defaults.set(encoded, forKey: Keys.gameSettings.rawValue)
            
            return true
        }
        
        return false
        
    }
    
}
    
    
