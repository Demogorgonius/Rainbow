

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    var presenter: MainPresenterProtocol!
    
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
            backgroundColor: .customRed,
            title: "Новая игра",
            target: self,
            action: #selector(startNewGameButtonTapped))
        return button
    }()
    
    private lazy var continueGameButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customLightBlue,
            title: "Продолжить",
            target: self,
            action: #selector(continueGameButtonTapped))
        return button
    }()
    
    private lazy var statisticGameButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customGreenForButton,
            title: "Cтатистика",
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
        spacing: 180,
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
        view.addVerticalGradientLayer()
        
        view.addSubview(rainbowImage)
        view.addSubview(gameLabel)
        view.addSubview(nameGameLabel)
        view.addSubviews(buttonsStackView)
        buttonsStackView.addArrangedSubview(customButtonsStackView)
    }
    
    private func layoutViews() {
        rainbowImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(77)
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-38)
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
            make.leading.equalToSuperview().offset(36)
            make.trailing.equalToSuperview().offset(-36)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.height.equalTo(335)
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
