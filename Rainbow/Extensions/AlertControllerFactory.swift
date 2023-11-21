//
//  AlertControllerFactory.swift
//  Rainbow
//
//  Created by Liz-Mary on 21.11.2023.
//

import UIKit

protocol AlertConfiguration {
    var title: String? { get }
    var message: String? { get }
    var alertAction: [AlertAction] { get }
    var handler: (() -> Void)? { get }
}

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
}

enum AlertType {
    case warning, delete
}

class AlertFactory {
    static func createAlert(for type: AlertType) -> UIAlertController {
        guard let config = alertConfigurations(for: type) else {
            return UIAlertController()
        }
        
        let alert = UIAlertController(title: config.title, message: config.message, preferredStyle: .alert)
        
        for actionConfig in config.alertAction {
            let alertAction = UIAlertAction(title: actionConfig.title, style: actionConfig.style) { _ in
                config.handler?()
            }
            alert.addAction(alertAction)
        }
        
        return alert
    }

    static func alertConfigurations(for type: AlertType) -> AlertConfiguration? {
        switch type {
        case .warning:
            return WarningAlertConfig()
        case .delete:
            return DeleteAlertConfig()
        }
    }
}

struct WarningAlertConfig: AlertConfiguration {
   
    var title: String? = "Отсутствуют сохраненные игры"
    var message: String? = "\nИгра возобновится, когда вы решите возобновить прерванный игровой раунд"
    var alertAction: [AlertAction] = [
        AlertAction(title: "OK", style: .cancel)
    ]
    var handler: (() -> Void)?
}

struct DeleteAlertConfig: AlertConfiguration {
    var title: String? = "Вы точно хотите удалить историю игр?"
    var message: String? = "После нажатия на кнопку Delete история исчезнет"
    var alertAction: [AlertAction] = [
        AlertAction(title: "Delete", style: .default),
        AlertAction(title: "Cancel", style: .cancel)
    ]
    var handler: (() -> Void)? {
        return {
            
        }
    }
    
}
