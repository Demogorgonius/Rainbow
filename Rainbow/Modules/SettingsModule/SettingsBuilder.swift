
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
