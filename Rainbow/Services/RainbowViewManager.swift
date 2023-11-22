//
//  GameViewManager.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 22.11.2023.
//

import UIKit

protocol RainbowViewManagerProtocol {
    func getColorTextShuffle() -> [String]
    func getRandomRainbowView() -> RainbowView
}
//#warning реализовать вариант когда нет подложки и сомплишн для нажатия
final class RainbowViewManager: RainbowViewManagerProtocol {
    private var settings: GameSettings?
    private let settingManager: SettingManagerProtocol = SettingsManager()
    
    private let colorNames = [
        "Красный",
        "Синий",
        "Зеленый",
        "Голубой",
        "Желтый",
        "Оранжевый",
        "Фиолетовый",
        "Коричневый",
        "Розовый"
    ]
    
    func getRandomGameModel() -> GameModel {
        let shuffledColors = getColorTextShuffle()
        let text = shuffledColors.randomElement() ?? ""
        let textColor = settings?.gameColors.randomElement() ?? colorButtons.colorButtons[0]
        let fontSize = CGFloat(settings?.sizeFont ?? 18)
        let rainbowViewColor = settings?.gameColors.randomElement() ?? colorButtons.colorButtons[0]
        
        return GameModel(
            text: text,
            textColor: textColor,
            fontSize: fontSize,
            rainbowViewColor: rainbowViewColor,
            didSelectHandler: nil
        )
    }
    
    func getRandomRainbowView() -> RainbowView {
        let gameModel = getRandomGameModel()
        let rainbowView = RainbowView()
        rainbowView.update(gameModel)
        return rainbowView
    }
    
    func getColorTextShuffle() -> [String] {
        var colorNamesShuffle: [String] = []
        colorNamesShuffle.append(contentsOf: colorNames.shuffled())
        return colorNamesShuffle
    }
    
    func getSettings() {
        settingManager.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
