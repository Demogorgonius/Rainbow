//
//  Extension + CustomButton.swift
//  Rainbow
//
//  Created by Liz-Mary on 13.11.2023.
//

import UIKit
import SnapKit

extension UIButton {
    convenience init(imageName: String) {
        self.init(type: .custom)
        self.setImage(UIImage(named: imageName), for: .normal)
       // self.addTarget(target, action: action, for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false

        
        self.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
}
