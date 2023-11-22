//
//  GameViewManager.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 22.11.2023.
//

import Foundation

protocol RainbowViewManagerProtocol {
    func getColorTextShuffle() -> [String]
    func getRandomRainbowView() -> RainbowView
}

final class RainbowViewManager: RainbowViewManagerProtocol {

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
    
    func getColorTextShuffle() -> [String] {
        var colorNamesShuffle: [String] = []
        colorNamesShuffle.append(contentsOf: colorNames.shuffled())
        return colorNamesShuffle
    }
    
    func getRandomRainbowView() -> RainbowView {
        var rainbowView: RainbowView!
        //
        return rainbowView
    }
}
