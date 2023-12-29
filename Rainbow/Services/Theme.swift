//
//  Theme.swift
//  Rainbow
//
//  Created by Sergey on 29.12.2023.
//

import Foundation
import UIKit

enum Theme: String {
    case light, dark, system

   
    var uiInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return .unspecified
        }
    }
}
