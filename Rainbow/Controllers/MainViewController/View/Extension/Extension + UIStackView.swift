//
//  Extension + UIStackView.swift
//  Rainbow
//
//  Created by Liz-Mary on 13.11.2023.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: Int, subview: [UIView]) {
        self.init(arrangedSubviews: subview)
        self.axis = axis
        self.distribution = distribution
        self.spacing = CGFloat(spacing)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
