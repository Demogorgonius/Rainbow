
import UIKit
import SnapKit

protocol GameViewDelegate: AnyObject {
    func speedButtonPressed()
    func colorButtonPressed()
}

class GameView: UIView {
    
    weak var delegate: GameViewDelegate?
    
    lazy var speedButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customRed,
            title: "X1",
            target: self,
            action: #selector(speedButtonPressed))
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customPurple
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.customBlack.cgColor]
        gradient.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradient, at: 0)
        return view
    }()
    
    lazy var colorButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            greenButton,
            pinkButton,
            blueButton,
            burgundyButton,
            violetButton,
            orangeButton,
            redButton,
            yellowButton
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        return stackView
    } ()
    
    lazy var greenButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customLightGreen,
            title: "",
            target: self,
            action: #selector(colorButtonPressed))
        return button
    }()
    
    lazy var pinkButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customPink,
            title: "",
            target: self,
            action: #selector(colorButtonPressed))
        return button
    }()
    
    lazy var blueButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customLightBlue,
            title: "",
            target: self,
            action: #selector(colorButtonPressed))
        return button
    }()
    
    lazy var burgundyButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customBurgundy,
            title: "",
            target: self,
            action: #selector(colorButtonPressed))
        return button
    }()
    
    lazy var violetButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customViolet,
            title: "",
            target: self,
            action: #selector(colorButtonPressed))
        return button
    }()
    
    lazy var orangeButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customOrange,
            title: "",
            target: self,
            action: #selector(colorButtonPressed))
        return button
    }()
    
    lazy var redButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customRed,
            title: "",
            target: self,
            action: #selector(colorButtonPressed))
        return button
    }()
    
    lazy var yellowButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customYellow,
            title: "",
            target: self,
            action: #selector(colorButtonPressed))
        return button
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(gradientView)
        addSubview(speedButton)
        gradientView.addSubview(colorButtonStackView)
        
        speedButton.snp.makeConstraints { make in
            make.width.equalTo(63)
            make.height.equalTo(43)
            make.trailing.equalTo(-16)
            make.top.equalTo(safeAreaLayoutGuide).offset(34)
        }
        
        gradientView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(snp.height).multipliedBy(0.1)
        }
        
        colorButtonStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-23)
            make.height.equalTo(gradientView.snp.height).multipliedBy(0.8)
        }
    }
    
    // MARK: @objc func
    @objc private func speedButtonPressed() {
        delegate?.speedButtonPressed()
    }
    
    @objc private func colorButtonPressed() {
        delegate?.colorButtonPressed()
    }
}
