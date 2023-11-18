//
//  GameEngine.swift
//  Rainbow
//
//  Created by Liz-Mary on 19.11.2023.
//

import UIKit

protocol GameEngineProtocol {
    func generateRandomColor(with settings: GameSettings) -> UIColor
    func generateRandomColorName() -> String
}

class GameEngine: GameEngineProtocol {
    
    
    func generateRandomColor(with settings: GameSettings) -> UIColor {
        guard let colorString = settings.backgroundForView,
              let color = GameColor(rawValue: colorString) else {
            return .black
        }
        return color.createColorView()
    }

    
    func generateRandomColorName() -> String {
        let colorNames = ["Красный", "Зеленый", "Голубой", "Желтый", "Оранжевый", "Фиолетовый", "Коричневый", "Розовый"]
        return colorNames.randomElement() ?? "Unknown"
    }
    
}
