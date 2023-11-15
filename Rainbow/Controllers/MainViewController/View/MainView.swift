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
    
    private lazy var startNewGameButton = UIButton(textButton: "Новая игра", colorText: .white, backgroundColor: .customRed)
    
    private lazy var continueGameButton = UIButton(textButton: "Продолжить", colorText: .white, backgroundColor: .customLightBlue)
    
    private lazy var statisticGameButton = UIButton(textButton: "Cтатистика", colorText: .white, backgroundColor: .customGreenForButton)
    
    private lazy var buttonsStackView = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 10, subview: [startNewGameButton, continueGameButton, statisticGameButton])
    
    private lazy var settingsGameButton = UIButton(imageName: "settings")
    
    private lazy var infoGameButton = UIButton(imageName: "info")
    
    private lazy var customButtonsStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, spacing: 180, subview: [settingsGameButton, infoGameButton])
    
    
    
    override func setViews() {
        addSubview(rainbowImage)
        addSubviews(nameStackView)
        addSubviews(buttonsStackView)
        addSubviews(customButtonsStackView)
        
        addTargetButton()
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
        }
    }
    
    func addTargetButton() {
        startNewGameButton.addTarget(self, action: #selector(startNewGameButtonTapped), for: .touchUpInside)
        continueGameButton.addTarget(self, action: #selector(continueGameButtonTapped), for: .touchUpInside)
        statisticGameButton.addTarget(self, action: #selector(statisticGameTapped), for: .touchUpInside)
        
        settingsGameButton.addTarget(self, action: #selector(settingsGameButtonTapped), for: .touchUpInside)
        infoGameButton.addTarget(self, action: #selector(infoGameButtonTapped), for: .touchUpInside)
    }
    
    @objc func startNewGameButtonTapped() {
        
    }
    
    @objc func continueGameButtonTapped() {
        
    }
    
    @objc func statisticGameTapped() {
        
    }
    
    @objc func settingsGameButtonTapped() {
       
    }
    
    @objc func infoGameButtonTapped() {
        print("ok5")
    }
}

