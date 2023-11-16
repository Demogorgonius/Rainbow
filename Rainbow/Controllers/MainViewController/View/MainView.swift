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
<<<<<<< HEAD
        addSubview(labelStack)
=======
        addSubview(gameLabel)
        addSubview(nameGameLabel)
>>>>>>> parent of d12aa23 (fix)
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
            make.top.equalTo(nameGameLabel.snp.bottom)
            
            if UIScreen.main.bounds.height < 568 {
                make.bottom.lessThanOrEqualTo(customButtonsStackView.snp.top).inset(-8)
            } else {
                make.bottom.equalTo(customButtonsStackView.snp.top).offset(-10)
            }
            
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

