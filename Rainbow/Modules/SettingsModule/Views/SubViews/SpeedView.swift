
import UIKit

final class SpeedView: UIView {
    
    lazy var gameSpeedView = ViewFactory.createShadowView()
    
    lazy var gameSpeedStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [gameSpeedLabel, gameSpeedSlider, gameSpeedSliderLabel].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var gameSpeedLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:  NSLocalizedString("gameSpeedLabel",
            comment: "")
        )
    }()
    
    lazy var gameSpeedSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1.0
        slider.maximumValue = 5.0
        slider.minimumTrackTintColor = .customOrange
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var gameSpeedSliderLabel: UILabel = {
        let label = UILabel()
        label.text = String(Int(gameSpeedSlider.value))
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init()
    init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupViews()
    private func setupViews() {
        addSubview(gameSpeedView.shadowView)
        gameSpeedView.shadowView.addSubview(gameSpeedStack)
    }
    
    private func setupConstraints() {
        
        gameSpeedView.shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gameSpeedStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
    }
}
