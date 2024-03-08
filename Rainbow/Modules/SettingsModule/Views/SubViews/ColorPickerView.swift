
import UIKit

final class ColorPickerView: UIView {

    lazy var colorPickerView = ViewFactory.createShadowView()
    
    lazy var colorPickerButton: UIButton = {
        let colorButton = UIButton()
        colorButton.setImage(UIImage(named:"checkboxBlack"), for: .normal)
        colorButton.layer.cornerRadius = 15
        colorButton.clipsToBounds = true
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        return colorButton
    }()
    
    lazy var colorPickerLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text: NSLocalizedString("colorPickerLabel", comment: "")
        )
    }()
    
    lazy var titlePickerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [colorPickerLabel, colorPickerButton].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var mainPickerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [titlePickerStack, colorPickerButtonStack1, colorPickerButtonStack2].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var colorPickerButtonStack1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var colorPickerButtonStack2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - Init()
    init() {
        super.init(frame: .zero)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupViews()
    private func setViews() {
        addSubview(colorPickerView.shadowView)
        colorPickerView.shadowView.addSubview(mainPickerStack)
        
        mainPickerStack.addArrangedSubview(titlePickerStack)
        mainPickerStack.addArrangedSubview(colorPickerButtonStack1)
        mainPickerStack.addArrangedSubview(colorPickerButtonStack2)
    }
    
    private func setupConstraints() {
        colorPickerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        colorPickerView.shadowView.snp.makeConstraints { make in
             make.edges.equalToSuperview()
         }
        
        mainPickerStack.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
