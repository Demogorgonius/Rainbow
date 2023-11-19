//
//  Extension + UIColor.swift
//  RainbowGame
//
//  Created by Danila Bolshakov on 13.11.2023.
//

import UIKit.UIColor

extension UIColor {
    enum RainbowGameColor {
        static let customBackground = UIColor(named: "customBackground") ?? UIColor()
        static let customLightGreen = UIColor(named: "customLightGreen") ?? UIColor()
        static let customGreenForButton = UIColor(named: "customGreenForButton") ?? UIColor()
        static let customDarkGreen = UIColor(named: "customDarkGreen") ?? UIColor()
        static let customPink = UIColor(named: "customPink") ?? UIColor()
        static let customLightBlue = UIColor(named: "customLightBlue") ?? UIColor()
        static let customBurgundy = UIColor(named: "customBurgundy") ?? UIColor()
        static let customViolet = UIColor(named: "customViolet") ?? UIColor()
        static let customDarkBlue = UIColor(named: "customDarkBlue") ?? UIColor()
        static let customOrange = UIColor(named: "customOrange") ?? UIColor()
        static let customRed = UIColor(named: "customRed") ?? UIColor()
        static let customYellow = UIColor(named: "customYellow") ?? UIColor()
        static let customBlack = UIColor(named: "customBlack") ?? UIColor()
        static let customGrayishPurple = UIColor(named: "customGrayishPurple") ?? UIColor()
    }
    
    static func getColor(for gameColor: GameColor) -> UIColor {
        switch gameColor {
        case .customLightGreen: return RainbowGameColor.customLightGreen
        case .customDarkGreen: return RainbowGameColor.customDarkGreen
        case .customPink: return RainbowGameColor.customPink
        case .customLightBlue: return RainbowGameColor.customLightBlue
        case .customBurgundy: return RainbowGameColor.customBurgundy
        case .customViolet: return RainbowGameColor.customViolet
        case .customDarkBlue: return RainbowGameColor.customDarkBlue
        case .customOrange: return RainbowGameColor.customOrange
        case .customRed: return RainbowGameColor.customRed
        case .customYellow: return RainbowGameColor.customYellow
        case .customBlack: return RainbowGameColor.customBlack
        case .customGrayishPurple: return RainbowGameColor.customGrayishPurple
        }
    }
}
