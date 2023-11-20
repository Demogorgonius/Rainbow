//
//  SettingsBuilder.swift
//  Rainbow
//
//  Created by Igor Guryan on 16.11.2023.
//

import UIKit

final class SettingsBuilder {
    static func build() -> UIViewController {
        
        let settingManager = SettingsManager()
        let viewController = SettingsViewController()
        let presenter = SettingsPresenter(view: viewController, settingsManager: settingManager)
        
        viewController.presenter = presenter
        presenter.view = viewController

        
        return viewController
    }
}
