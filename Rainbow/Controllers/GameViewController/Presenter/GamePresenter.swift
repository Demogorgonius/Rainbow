//
//  GamePresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//

import Foundation
import UIKit

import UIKit

protocol GameViewProtocol: AnyObject {
    func startTimer(with elapsedTime: TimeInterval?)
    func updateTimerLabel(text: String)
   
}


protocol GamePresenterProtocol {
    
}

class GamePresenter: GamePresenterProtocol {
    weak var view: GameViewProtocol?
    
    private let router: GameRouterProtocol
    
    
    init(router: GameRouterProtocol) {
        self.router = router
    }
  
}
