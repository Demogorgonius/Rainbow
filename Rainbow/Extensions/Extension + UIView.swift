//
//  File.swift
//  Rainbow
//
//  Created by Danila Bolshakov on 13.11.2023.
//

import UIKit.UIView

extension UIView {
    func addAutoLayoutSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func addAutoLayoutSubviews(_ views: UIView...) {
        views.forEach { addAutoLayoutSubview($0) }
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        })
    }
}
