//
//  MainPresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 15.11.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    
    func startNewGameButtonTapped()
    func continueGameButtonTapped()
    func statisticGameTapped()
    func settingsGameButtonTapped()
    func infoGameButtonTapped()
}

class MainPresenter: MainPresenterProtocol {
    
    var router: MainRouterProtocol!
    
    init(router: MainRouterProtocol!) {
        self.router = router
    }
    
    func startNewGameButtonTapped() {
        
    }
    
    func continueGameButtonTapped() {
        
    }
    
    func statisticGameTapped() {
        
    }
    
    func settingsGameButtonTapped() {
        
    }
    
    func infoGameButtonTapped() {
        
    }
    
}
