

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    var presenter: MainPresenterProtocol!
    
    // MARK: - UI
    private lazy var rainbowImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "icon")
        element.contentMode = .scaleToFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var gameLabel = UILabel(text: NSLocalizedString("gameLabel", comment: ""), font: UIFont.systemFont(ofSize: 36))

    
    private lazy var startNewGameButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customRed,
            title: NSLocalizedString("startNewGameButton", comment: ""),
            target: self,
            action: #selector(startNewGameButtonTapped))
        return button
    }()
    
    private lazy var continueGameButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customLightBlue,
            title: NSLocalizedString("continueGameButton", comment: ""),
            target: self,
            action: #selector(continueGameButtonTapped))
        return button
    }()
    
    private lazy var statisticGameButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customGreenForButton,
            title: NSLocalizedString("statisticGameButton", comment: ""),
            target: self,
            action: #selector(statisticGameTapped))
        return button
    }()
    
    private lazy var buttonsStackView = UIStackView(
        axis: .vertical,
        distribution: .fillEqually,
        spacing: 16,
        subview: [startNewGameButton,
                  continueGameButton,
                  statisticGameButton
                 ]
    )
    
    private lazy var settingsGameButton = UIButton(
        imageName: "settings",
        target: self,
        action: #selector(settingsGameButtonTapped)
    )
    
    private lazy var infoGameButton = UIButton(
        imageName: "info",
        target: self,
        action: #selector(infoGameButtonTapped)
    )

    private lazy var customButtonsStackView = UIStackView(
        axis: .horizontal,
        distribution: .fillEqually,
        spacing: 140,
        subview: [settingsGameButton, infoGameButton]
    )
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        layoutViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Setup UI
    private func setViews() {
        view.addAnimatedGradientLayer()
        
        view.addSubview(rainbowImage)
        view.addSubview(gameLabel)
        view.addSubviews(buttonsStackView)
        buttonsStackView.addArrangedSubview(customButtonsStackView)
    }
    
    private func layoutViews() {
        rainbowImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
            make.leading.trailing.lessThanOrEqualToSuperview().inset(50)
            make.height.equalTo(rainbowImage.snp.width)
            make.bottom.lessThanOrEqualTo(gameLabel.snp.top).offset(-16)
        }
        
        gameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalTo(rainbowImage.snp.bottom).offset(16)
        }
        
        settingsGameButton.snp.makeConstraints { make in
            make.width.equalTo(settingsGameButton.snp.height)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(gameLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(50)
            make.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide).offset(-8)
        }
    }
}

extension MainViewController: MainViewProtocol {
    
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
