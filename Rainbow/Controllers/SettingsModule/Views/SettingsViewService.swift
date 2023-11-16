//
//  SettingsService.swift
//  Rainbow
//
//  Created by Igor Guryan on 14.11.2023.
//

import UIKit

class SettingsViewService {
    static let shared = SettingsViewService()
    private init() {}
    
    func createSettingTitle(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }
    
    func createButton(color: UIColor) -> UIButton {
        let button = UIButton()
//        button.addTarget(self, action: action, for: .touchUpInside)
        button.backgroundColor = color
        button.translatesAutoresizingMaskIntoConstraints = false
        button.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        return button
    }
    
}

