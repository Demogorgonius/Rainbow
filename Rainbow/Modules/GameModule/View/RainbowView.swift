//
//  RainbowView.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 21.11.2023.
//

import UIKit

final class RainbowView: UIView {
    private let gameManager: GameManagerProtocol = SettingsManager()
    
    let title: String
    let color: UIColor
    let background: Bool
     
    init(title: String, color: UIColor, background: Bool) {
        self.title = title
        self.color = color
        self.background = background
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let labelView = UILabel()
    
    func setupLabel() {
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = title
        labelView.textAlignment = .center
        //labelView.font = .systemFont(ofSize: background ? 14 : CGFloat(gameManager.getInt(forKey: .fontSize) ?? 20), weight: .bold)
        labelView.textColor = background ? .black : color
        labelView.backgroundColor = background ? color : .clear
        labelView.layer.cornerRadius = background ? 50 : 0
        labelView.layer.borderWidth = background ? 1.5 : 0
        labelView.layer.borderColor = UIColor.white.cgColor
        labelView.layer.masksToBounds = true
        
        addSubview(labelView)
        
        labelView.snp.makeConstraints { make in
            make.width.height.equalTo(background ? 100 : 200)
            make.center.equalTo(self)
        }
    }
}
