
import UIKit

final class TimeView: UIView {
    
    lazy var timeView = ViewFactory.createShadowView()
    
    lazy var sliderStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        [timeSlider, timerValueLabel].forEach {
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
        [timeLabel, sliderStack].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var timeLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:  NSLocalizedString("gameTimeLabel",
            comment: "")
        )
    }()
    
    lazy var timeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1.0
        slider.maximumValue = 20.0
        slider.minimumTrackTintColor = .customOrange
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var timerValueLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:  String(Int(timeSlider.value))
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
        addSubview(timeView.shadowView)
        timeView.shadowView.addSubview(mainStack)
        mainStack.addArrangedSubview(sliderStack)
    }
    
    private func setupConstraints() {
        timeView.shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainStack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        sliderStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        timerValueLabel.snp.makeConstraints { make in
            make.width.equalTo(20)
        }
    }
}
