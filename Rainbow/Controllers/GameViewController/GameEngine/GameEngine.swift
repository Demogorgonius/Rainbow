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
    private var settings: GameSettings?

    
    func generateRandomColor(with settings: GameSettings) -> UIColor {
        self.settings = settings
        guard let colorString = settings.backgroundForView,
              let gameColor = GameColor(rawValue: colorString) else {
            return .black
        }
        print(gameColor)
        return UIColor.getColor(for: gameColor)
    }

    
    func generateRandomColorName() -> String {
        let colorNames = ["Красный", "Зеленый", "Голубой", "Желтый", "Оранжевый", "Фиолетовый", "Коричневый", "Розовый"]
        return colorNames.randomElement() ?? "Unknown"
    }
    
}
