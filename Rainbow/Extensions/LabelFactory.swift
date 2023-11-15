//
//  LabelFactory.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 14.11.2023.
//

import UIKit
// Протокол для настраиваемого label
protocol LabelConfigurable {
    var textColor: UIColor { get }
    var font: UIFont { get }
}
// Виды настраиваемых лейблов
enum LabelType {
    case gamePink, gameBlack, gameLightGreen
}
// Фабрика для создания настраиваемых лейблов
class LabelFactory {
    
    static func createLabel(type: LabelType, text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text

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
        }
    }
}
// Структуры для конфигураций различных видов лейблов
struct GamePinkLabelConfig: LabelConfigurable {
    let textColor: UIColor = UIColor.RainbowGameColor.customPink
    let font: UIFont = UIFont.TextFont.Regular.size(of: 20)
}

struct GameBlackLabelConfig: LabelConfigurable {
    let textColor: UIColor = UIColor.RainbowGameColor.customBlack
    let font: UIFont = UIFont.TextFont.Regular.size(of: 20)
}

struct GameLightGreenLabelConfig: LabelConfigurable {
    let textColor: UIColor = UIColor.RainbowGameColor.customLightGreen
    let font: UIFont = UIFont.DisplayFont.Heavy.size(of: 20)
}
