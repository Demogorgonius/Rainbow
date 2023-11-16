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
        addSubview(gameLabel)
        addSubview(nameGameLabel)
        addSubviews(buttonsStackView)
        addSubviews(customButtonsStackView)
        
        addTargetButton()
    }
    
    override func layoutViews() {
        
        rainbowImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
            make.size.equalTo(CGSize(width: 302, height: 150))
        }
        
        gameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rainbowImage.snp.bottom)
            make.height.greaterThanOrEqualTo(40)
        }

        nameGameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gameLabel.snp.bottom)
            make.height.greaterThanOrEqualTo(80)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualTo(customButtonsStackView.snp.top)
            make.leadingMargin.equalToSuperview()
        }

        customButtonsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leadingMargin.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
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

