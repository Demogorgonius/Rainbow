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
        let settingManager = SettingsManager()
        let viewController = SettingsViewController()
        let presenter = SettingsPresenter(view: viewController,  router: router, settingsManager: settingManager)
        
        viewController.presenter = presenter
        presenter.view = viewController
        router.viewController = viewController
        
        return viewController
    }
}
