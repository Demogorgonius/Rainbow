//
//  Router.swift
//  Rainbow
//
//  Created by Danila Bolshakov on 14.11.2023.
//

//MARK: - RulesRouterProtocol (Go to screens)
protocol RulesRouterProtocol {
    func routeToStartScreen()
    func routeToStaticScreen()
    func routeToMainScreen()
}

//MARK: - Implementation of transitions
class RulesRouter: RulesRouterProtocol {
    
    weak var viewController: RulesViewController?
    
    func routeToStartScreen() { }
    func routeToStaticScreen() { }
    func routeToMainScreen() { }
}
