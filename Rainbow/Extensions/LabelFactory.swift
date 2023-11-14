//
//  LabelFactory.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 14.11.2023.
//

import UIKit

import UIKit

enum LabelType {
    case gamePink, gameBlack, gameLightGreen
}

class LabelFactory {
    
    static func createLabel(type: LabelType) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.TextFont.Regular.size(of: 20)
        
        switch type {
        case .gamePink:
            label.text = "игра №1"
            label.textColor = UIColor.RainbowGameColor.customPink
        case .gameBlack:
            label.text = "время: 11.0"
            label.textColor = UIColor.RainbowGameColor.customBlack
        case .gameLightGreen:
            label.text = "угадано 1/1"
            label.textColor = UIColor.RainbowGameColor.customLightGreen
            label.font = UIFont.DisplayFont.Heavy.size(of: 20)
        }

        return label
    }
}
