
import Foundation

enum Keys: String {
    case statistic
    case gameSettings = "RainbowGameSettings" 
}

enum GameErrors: Error {
    case saveGameRound
    case saveSettingsError
    case getSettingsError
}

extension GameErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .saveGameRound:
            return NSLocalizedString("У Вас нет сохраненной игры!", comment: "Начните игру заново!")
        case .saveSettingsError:
            return NSLocalizedString("Ошибка сохранения настроек игры!", comment: "Попробуйте еще раз!")
        case .getSettingsError:
            return NSLocalizedString("Ошибка чтения настроек игры!", comment: "Попробуйте еще раз!")
       
        }
    }
}


