//
//  GamePresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//

import Foundation
import UIKit

protocol GameViewProtocol: AnyObject {
    func startTimer()
    func updateTimerLabel(text: String)
    func updateColorViews(colorInfo: [(text: String, backgroundColor: UIColor)])
}

class GamePresenter {
   
}
