
import UIKit

final class SpeedView: UIView {
    
    lazy var speedView = ViewFactory.createShadowView()
    
    lazy var sliderStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        [speedSlider, speedValueLabel].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        [speedLabel, sliderStack].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var speedLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:  NSLocalizedString("gameSpeedLabel",
            comment: "")
        )
    }()
    
    lazy var speedSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1.0
        slider.maximumValue = 5.0
        slider.minimumTrackTintColor = .customOrange
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var speedValueLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:  String(Int(speedSlider.value))
        )
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
        addSubview(speedView.shadowView)
        speedView.shadowView.addSubview(mainStack)
        mainStack.addArrangedSubview(sliderStack)
    }
    
    private func setupConstraints() {
        speedView.shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }
        
        sliderStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        speedValueLabel.snp.makeConstraints { make in
            make.width.equalTo(20)
        }
    }
}
