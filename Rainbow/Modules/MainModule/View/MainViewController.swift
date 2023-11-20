//
//  MainViewController.swift
//  Rainbow
//
//  Created by Sergey on 12.11.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private let presenter: MainPresenterProtocol
    
    // MARK: - UI
    private lazy var rainbowImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Image")
        element.contentMode = .scaleToFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var gameLabel = UILabel(text: "HЛП игра", font: UIFont.systemFont(ofSize: 36))
    
    private lazy var nameGameLabel = UILabel(text: "Радуга", font: UIFont.CormorantFont.RegularItalic.size(of: 64))
    
    private lazy var startNewGameButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .RainbowGameColor.customRed,
            title: "Новая игра",
            target: self,
            action: #selector(startNewGameButtonTapped))
        return button
    }()
    
    private lazy var continueGameButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .RainbowGameColor.customLightBlue,
            title: "Продолжить",
            target: self,
            action: #selector(continueGameButtonTapped))
        return button
    }()
    
    private lazy var statisticGameButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .RainbowGameColor.customGreenForButton,
            title: "Cтатистика",
            target: self,
            action: #selector(statisticGameTapped))
        return button
    }()
    
    private lazy var buttonsStackView = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 16, subview: [startNewGameButton, continueGameButton, statisticGameButton])
    
    private lazy var settingsGameButton = UIButton(imageName: "settings")
    
    private lazy var infoGameButton = UIButton(imageName: "info")
    
    private lazy var customButtonsStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, spacing: 180, subview: [settingsGameButton, infoGameButton])
    
    //MARK: Init
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        layoutViews()
        addTargetButton()
    }
    
    // MARK: - Setup UI
    private func setViews() {
        view.backgroundColor = .RainbowGameColor.customBackground
        
        view.addSubview(rainbowImage)
        view.addSubview(gameLabel)
        view.addSubview(nameGameLabel)
        view.addSubviews(buttonsStackView)
        view.addSubviews(customButtonsStackView)
        
    }
    
    private func layoutViews() {
        rainbowImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(77)
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(38)
        }
        
        gameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rainbowImage.snp.bottom).offset(16)
            make.height.greaterThanOrEqualTo(40)
        }
        
        nameGameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gameLabel.snp.bottom).offset(30)
            make.height.greaterThanOrEqualTo(80)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(nameGameLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.leadingMargin.equalToSuperview()
            make.bottom.equalTo(customButtonsStackView.snp.top).offset(-10)
            
        }
        
        customButtonsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leadingMargin.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.height.equalTo(64)
        }
    }
}

extension MainViewController: MainViewProtocol {
    
    func addTargetButton() {
        settingsGameButton.addTarget(self, action: #selector(settingsGameButtonTapped), for: .touchUpInside)
        infoGameButton.addTarget(self, action: #selector(infoGameButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc func startNewGameButtonTapped() {
        presenter.startNewGameButtonTapped()
    }
    
    @objc func continueGameButtonTapped() {
        presenter.continueGameButtonTapped()
    }
    
    @objc func statisticGameTapped() {
        presenter.statisticGameTapped()
    }
    
    @objc func settingsGameButtonTapped() {
        presenter.settingsGameButtonTapped()
    }
    
    @objc func infoGameButtonTapped() {
        presenter.infoGameButtonTapped()
    }
}
