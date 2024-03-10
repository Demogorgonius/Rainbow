
import UIKit

final class SizeView: UIView {
    lazy var gameSizeView = ViewFactory.createShadowView()
    
    lazy var gameSizeLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text: NSLocalizedString("gameSizeLabel",
            comment: "")
        )
    }()
    
    lazy var gameSizeStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 10.0
        stepper.maximumValue = 30.0
        stepper.stepValue = 1.0
        return stepper
    }()
    
    lazy var gameSizeStepperLabel: UILabel = {
        let label = UILabel()
        label.text = "Aa"
        label.font = UIFont.systemFont(ofSize: gameSizeStepper.value)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var gameSizeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [gameSizeLabel, gameSizeStepper, gameSizeStepperLabel].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
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
        addSubview(gameSizeView.shadowView)
        gameSizeView.shadowView.addSubview(gameSizeStack)
    }
    
    private func setupConstraints() {
        gameSizeView.shadowView.snp.makeConstraints { make in
             make.edges.equalToSuperview()
         }
        
        gameSizeStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
}
