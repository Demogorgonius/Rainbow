//
//  GameModel.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//

import UIKit

struct GameModel {
    let text: String
    let textColor: ColorChecker
    let fontSize: CGFloat
    let rainbowViewColor: ColorChecker
    let didSelectHandler: (() -> Void)?
}
