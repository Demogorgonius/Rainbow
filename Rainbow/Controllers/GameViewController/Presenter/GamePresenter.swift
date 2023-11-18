//
//  GamePresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//


<<<<<<< HEAD
protocol GamePresenterProtocol {
    func pauseButtonPressed()
    func speedButtonPressed()
    func updateTimer()
=======
import UIKit

protocol GameViewProtocol: AnyObject {
    func startTimer(with elapsedTime: TimeInterval?)
   
}


protocol GamePresenterProtocol {
    var colorViews: [UIView] { get set }
    var colorNames: [String] { get set }
    var totalTime: TimeInterval { get set }
    var startTime: Date? { get set }
    var elapsedTime: TimeInterval? { get set }
>>>>>>> Develop
}

class GamePresenter: GamePresenterProtocol {
    
<<<<<<< HEAD
=======
    
>>>>>>> Develop
    weak var view: GameViewProtocol?
    
    var timer = Timer()
    var totalTime: TimeInterval = 15.0
    var startTime: Date?
    var elapsedTime: TimeInterval?
    
    private let router: GameRouterProtocol
    
    var startTime: Date?
    var totalTime: TimeInterval = 10.0
    var elapsedTime: TimeInterval?
    
    var colorViews: [UIView] = []
    var colorNames: [String] = []
    
    
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
