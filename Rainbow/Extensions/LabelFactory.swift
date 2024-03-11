
import UIKit
// Протокол для настраиваемого label
protocol LabelConfigurable {
    var textColor: UIColor { get }
    var font: UIFont { get }
}
// Виды настраиваемых лейблов
enum LabelType {
    case gamePink, gameBlack, gameLightGreen, gameWhite
}
// Фабрика для создания настраиваемых лейблов
class LabelFactory {
    
    static func createLabel(type: LabelType, text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.adjustsFontSizeToFitWidth = true 
        label.minimumScaleFactor = 0.5
        label.font = label.font.withSize(12)
       

        if let config = labelConfiguration(for: type) {
            label.textColor = config.textColor
            label.font = config.font
        }
        
        return label
    }
    // Возвращает конфигурацию для заданного типа лейбла
    private static func labelConfiguration(for type: LabelType) -> LabelConfigurable? {
        switch type {
        case .gamePink:
            return GamePinkLabelConfig()
        case .gameBlack:
            return GameBlackLabelConfig()
        case .gameLightGreen:
            return GameLightGreenLabelConfig()
        case .gameWhite:
            return GameWhiteLabelConfig()
        }
    }
}
// Структуры для конфигураций различных видов лейблов
struct GamePinkLabelConfig: LabelConfigurable {
    let textColor: UIColor = .customPink
    let font: UIFont = UIFont.TextFont.Regular.size(of: 18)
}

struct GameBlackLabelConfig: LabelConfigurable {
    let textColor: UIColor = .customBlack
    let font: UIFont = UIFont.TextFont.Regular.size(of: 18)
}

struct GameLightGreenLabelConfig: LabelConfigurable {
    let textColor: UIColor = .customLightGreen
    let font: UIFont = UIFont.DisplayFont.Heavy.size(of: 18)
}

struct GameWhiteLabelConfig: LabelConfigurable {
    let textColor: UIColor = .white
    let font: UIFont = UIFont.DisplayFont.Heavy.size(of: 18)
}
