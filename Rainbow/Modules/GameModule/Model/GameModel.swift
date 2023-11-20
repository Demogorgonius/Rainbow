//
//  GameModel.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//

import Foundation

struct GameModel {
    let numberGame: Int
    let durationGame: Double
    let speedGame: Int
    let resultGame: String
}

struct GameView {
    var sizeFont: Double
    var colorForText: String
    var backgroundForText: Bool
    var backgroundForView: String
    
    static func getGameView() -> [GameView] {
        var gameView: [GameView] = []
        
        var sizeFont: Double
        var backgroundForText: Bool
        var backgroundForView: String
        var screenLocation: Bool
        
        return gameView
        
    }
}
