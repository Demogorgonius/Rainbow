//
//  SettingsPresenter.swift
//  Rainbow
//
//  Created by Igor Guryan on 15.11.2023.
//

import Foundation
import UIKit

protocol SettingsViewProtocol: AnyObject {
   
}

protocol SettingsPresenterProtocol: SettingsViewProtocol {
    func getSettings()
}
