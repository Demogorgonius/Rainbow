//
//  AnimateViewModel.swift
//  Rainbow
//
//  Created by Sergey on 06.03.2024.
//

import Foundation
import UIKit

struct ViewModel: Codable {
    var viewPosition: CGRect
    var textPosition: CGRect
    var backgroundColor: String
    var textColor: String
    var duration: TimeInterval
    var remainingDuration: TimeInterval
    var theRestOfTheCountdown: Int
    var alpha: CGFloat
}

