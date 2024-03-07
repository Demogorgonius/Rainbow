
import UIKit

final class TimeView: UIView {
    
    lazy var gameTimeView = ViewFactory.createShadowView()
    
    lazy var gameTimeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [gameTimeLabel, gameTimeSlider, gameTimeSliderLabel].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var gameTimeLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:  NSLocalizedString("gameTimeLabel",
            comment: "")
        )
    }()
    
    lazy var gameTimeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1.0
        slider.maximumValue = 20.0
        slider.minimumTrackTintColor = .customOrange
        return slider
    }()
    
    lazy var gameTimeSliderLabel: UILabel = {
        let label = UILabel()
        label.text = String(Int(gameTimeSlider.value))
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
        addSubview(gameTimeView.shadowView)
        gameTimeView.shadowView.addSubview(gameTimeStack)
    }
    
    private func setupConstraints() {
        gameTimeView.shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gameTimeStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
    }
}
