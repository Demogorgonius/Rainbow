//
//  SettingsPresenter.swift
//  Rainbow
//
//  Created by Igor Guryan on 15.11.2023.
//

import Foundation
import UIKit

protocol SettingsPresenterProtocol: AnyObject {
    var view: SettingsViewController? { get set }
}

protocol SettingsViewProtocol: AnyObject  {
    
}

final class SettingsPresenter: SettingsPresenterProtocol {
    var view: SettingsViewController?
    
    
    private let router: SettingsRouterProtocol
    
    
    init(router: SettingsRouterProtocol) {
        self.router = router
    }
    
}
