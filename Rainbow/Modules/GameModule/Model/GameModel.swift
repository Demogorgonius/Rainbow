//
//  GameModel.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//

import UIKit

struct Model {
    let text: String
    let textColor: UIColor
    let fontSize: CGFloat
    let frameColor: UIColor?
    let didSelectHandler: (() -> Void)?
}
