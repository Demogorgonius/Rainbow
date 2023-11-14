//
//  MainView.swift
//  Rainbow
//
//  Created by Sergey on 12.11.2023.
//

import Foundation
import UIKit
import SnapKit

class MainView: CustomView {
    
    // MARK: - UI
    lazy var rainbowImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Image")
        element.contentMode = .scaleToFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var nameStackView = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 0, subview: [gameLabel, nameGameLabel])
    
    private lazy var gameLabel = UILabel(text: "HЛП игра", font: UIFont.systemFont(ofSize: 36))
    
    private lazy var nameGameLabel = UILabel(text: "Радуга", font: UIFont.CormorantFont.RegularItalic.size(of: 64))
    
    private lazy var startNewGameButton = UIButton(textButton: "Новая игра", colorText: .white, backgroundColor: .customRed, target: self, action: #selector(startNewGameButtonTapped))
    
    private lazy var continueGameButton = UIButton(textButton: "Продолжить", colorText: .white, backgroundColor: .customLightBlue, target: self, action: #selector(continueGameButtonTapped))
    
    private lazy var statisticGameButton = UIButton(textButton: "Cтатистика", colorText: .white, backgroundColor: .customGreenForButton, target: self, action: #selector(statisticGameTapped))
    
    private lazy var buttonsStackView = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 10, subview: [startNewGameButton, continueGameButton, statisticGameButton])
    
    private lazy var settingsGameButton = UIButton(imageName: "settings", target: self, action: #selector(settingsGameButtonTapped))
    
    private lazy var infoGameButton = UIButton(imageName: "info", target: self, action: #selector(infoGameButtonTapped))
    
    private lazy var customButtonsStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, spacing: 180, subview: [settingsGameButton, infoGameButton])
    
    
    
    override func setViews() {
        addSubview(rainbowImage)
        addSubviews(nameStackView)
        addSubviews(buttonsStackView)
        addSubviews(customButtonsStackView)
    }
    
    override func layoutViews() {
        
        rainbowImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(82)
            make.size.equalTo(CGSize(width: 302, height: 150))
        }
        
        nameStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(261)
            make.leadingMargin.equalToSuperview().offset(81)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameStackView.snp.bottom).offset(100)
            make.leadingMargin.equalToSuperview().offset(81)
        }
        
        customButtonsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(buttonsStackView.snp.bottom).offset(30)
            make.leadingMargin.equalToSuperview()
            //make.height.equalTo(100)
        }
    }
    
    @objc func startNewGameButtonTapped() {
        print("ok")
    }
    
    @objc func continueGameButtonTapped() {
        print("ok1")
    }
    
    @objc func statisticGameTapped() {
        print("ok3")
    }
    
    @objc func settingsGameButtonTapped() {
        print("settings")
    }
    
    @objc func infoGameButtonTapped() {
        print("info")
    }
}

