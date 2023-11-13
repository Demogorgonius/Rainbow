//
//  CustomView.swift
//  Rainbow
//
//  Created by Sergey on 12.11.2023.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        layoutViews()
    }
    
    func setViews() {
        backgroundColor = .white
    }
    
    func layoutViews() {
        
    }
}
