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
    
    weak var presenter: MainPresenterProtocol?
    
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
    
    private lazy var labelStack = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 0, subview: [gameLabel, nameGameLabel])
    
    private lazy var startNewGameButton = UIButton(textButton: "Новая игра", colorText: .white, backgroundColor: .RainbowGameColor.customRed)
    
    private lazy var continueGameButton = UIButton(textButton: "Продолжить", colorText: .white, backgroundColor: .RainbowGameColor.customLightBlue)
    
    private lazy var statisticGameButton = UIButton(textButton: "Cтатистика", colorText: .white, backgroundColor: .RainbowGameColor.customGreenForButton)
    
    private lazy var buttonsStackView = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 10, subview: [startNewGameButton, continueGameButton, statisticGameButton])
    
    private lazy var settingsGameButton = UIButton(imageName: "settings")
    
    private lazy var infoGameButton = UIButton(imageName: "info")
    
    private lazy var customButtonsStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, spacing: 180, subview: [settingsGameButton, infoGameButton])
    
    
    
    override func setViews() {
        backgroundColor = .RainbowGameColor.customBackground
        
        addSubview(rainbowImage)
        addSubview(labelStack)
        addSubviews(buttonsStackView)
        addSubviews(customButtonsStackView)
        
        addTargetButton()
    }
    
    override func layoutViews() {
        rainbowImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(45)
            make.size.equalTo(CGSize(width: 270, height: 120))
        }

        labelStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rainbowImage.snp.bottom).inset(10)
            make.height.equalTo(155)
        }

        buttonsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leadingMargin.equalToSuperview()
            make.bottom.equalTo(customButtonsStackView.snp.top).inset(15)
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
    
    @objc private func startNewGameButtonTapped() {
        
        presenter?.startNewGameButtonTapped()
    }
    
    @objc private func continueGameButtonTapped() {
        
        presenter?.continueGameButtonTapped()
    }
    
    @objc private func statisticGameTapped() {
        print("Settings button tapped")
        print("Presenter: \(presenter)")
        presenter?.statisticGameTapped()
    }
    
    @objc private func settingsGameButtonTapped() {
        print("Settings button tapped")
        presenter?.settingsGameButtonTapped()
    }
    
    @objc private func infoGameButtonTapped() {
        
        presenter?.infoGameButtonTapped()
    }
}

