//
//  GamePresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//


import UIKit

protocol GameViewProtocol: AnyObject {
    func startTimer(with elapsedTime: TimeInterval?)
   
}


protocol GamePresenterProtocol {
    var totalTime: TimeInterval { get set }
    var startTime: Date? { get set }
    var elapsedTime: TimeInterval? { get set }
}

class GamePresenter: GamePresenterProtocol {
    
    weak var view: GameViewProtocol?
    
    private let router: GameRouterProtocol
    
    var startTime: Date?
    var totalTime: TimeInterval = 3.0
    var elapsedTime: TimeInterval?
    
    init(router: GameRouterProtocol) {
        self.router = router
    }
  
}
