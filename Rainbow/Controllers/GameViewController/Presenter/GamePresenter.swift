//
//  GamePresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//

import Foundation
import UIKit

protocol GamePresenterProtocol {
    func pauseButtonPressed()
    func speedButtonPressed()
    func updateTimer()
}

class GamePresenter: GamePresenterProtocol {
    
    weak var view: GameViewProtocol?
    
    var timer = Timer()
    var totalTime: TimeInterval = 15.0
    var startTime: Date?
    var elapsedTime: TimeInterval?
    
    private let router: GameRouterProtocol
    
    
    init(router: GameRouterProtocol) {
        self.router = router
    }
    
    func pauseButtonPressed() {
        if timer.isValid {
            elapsedTime = Data().timeIntervalSince(startTime)
            timer.
        }
    }
    
    func speedButtonPressed() {
        <#code#>
    }
    
    func updateTimer() {
        <#code#>
    }
  
}
