//
//  SettingsBuilder.swift
//  Rainbow
//
//  Created by Igor Guryan on 16.11.2023.
//

import UIKit

final class SettingsBuilder {
    static func build() -> UIViewController {
        let router = SettingsRouter()
        let presenter = SettingsPresenter(router: router)
        let viewController = SettingsViewController()
        
        presenter.view = viewController
//        router.viewController = viewController
        
        return viewController
    }
}
