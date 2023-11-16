//
//  SettingsRouter.swift
//  Rainbow
//
//  Created by Igor Guryan on 16.11.2023.
//

import Foundation
import UIKit

protocol SettingsRouterProtocol {
    func goToStartScreen()
}

final class SettingsRouter: SettingsRouterProtocol {
    
    func goToStartScreen() {
        
        weak var viewController: UIViewController?
        
        let view = MainBuilder.build()
        viewController?.navigationController?.pushViewController(view, animated: true)

    }
    
    
}
