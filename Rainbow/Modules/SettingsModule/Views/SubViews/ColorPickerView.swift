
import UIKit

final class ColorPickerView: UIView {
    var presenter: SettingsPresenterProtocol!
    var isExpanded = false
    var buttonsArray: [UIButton] = []
    lazy var colorButtonsArray =  getButtonColors()
    var standartColors = ColorButtons().colorButtons
    
    lazy var colorPickerView = ViewFactory.createShadowView()
    
    lazy var colorPickerButton: UIButton = {
        
        let colorButton = UIButton()
        colorButton.setAttributedTitle(NSAttributedString(
            string: NSLocalizedString("colorPickerLabel",
                                      comment: ""),
            attributes: [:]), for: .normal)
                colorButton.addAction(UIAction { [weak self] _ in
                    self?.colorPickerButtonTap()
                }, for: .touchUpInside)
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
    
    lazy var colorPickerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [colorPickerLabel, colorPickerButtonStack].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var colorPickerButtonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fillEqually
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        [colorPickerButtonStack1, colorPickerButtonStack2].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var colorPickerButtonStack1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var colorPickerButtonStack2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
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
        colorPickerView.shadowView.addSubview(colorPickerStack)
        colorPickerView.shadowView.addSubview(colorPickerButton)
    }
    
    private func setupConstraints() {
        colorPickerView.shadowView.snp.makeConstraints { make in
             make.edges.equalToSuperview()
         }
        
        colorPickerButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(50)
        }
        
        colorPickerStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        
        colorPickerButtonStack1.snp.makeConstraints{ make in
            make.top.equalTo(colorPickerButtonStack)
            make.centerY.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalToSuperview()
        }
        
        colorPickerButtonStack2.snp.makeConstraints{ make in
            make.top.equalTo(colorPickerButtonStack1).offset(29)
            make.bottom.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalToSuperview()
        }
        
        colorPickerButtonStack.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(54)
        }
    }
    
    func setupButtons() {
        var button = UIButton()
        colorButtonsArray = getButtonColors()
        
        for i in 0...11 {
            button = createButton(color: colorButtonsArray[i].color)
            
            setBackground(view: button, onOffStatus: colorButtonsArray[i].isOn)
            button.addTarget(self, action: #selector(checkboxTaped), for: .touchUpInside)
            button.tag = i
            buttonsArray.append(button)
            i < 6 ? colorPickerButtonStack1.addArrangedSubview(button) : colorPickerButtonStack2.addArrangedSubview(button)
        }
    }
    
    func getButtonColors() -> [ColorChecker] {
        guard let settings = presenter.settings else { return [] }
        return settings.gameColors
    }
    
    private func colorPickerButtonTap() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            if self?.isExpanded == false {
                self?.colorPickerView.shadowView.snp.remakeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalTo(300)
                    make.height.equalTo(300)
                }
            } else {
                self?.colorPickerView.shadowView.snp.remakeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.height.equalTo(80)
                    make.width.equalTo(298)
                }
            }
            self?.layoutIfNeeded()
            self?.isExpanded.toggle()
        }
    }
    
    func setBackground(view: UIButton, onOffStatus: Bool) {
        let whiteCheck = UIImage(named: "checkboxWhire")!
        let blackCheck = UIImage(named: "checkboxBlack")!
        switch onOffStatus {
        case true:
            view.backgroundColor == .customBlack ? view.setImage(whiteCheck, for: .normal) : view.setImage(blackCheck, for: .normal)
        default:
            view.setImage(nil, for: .normal)
        }
    }
    
    func createButton(color: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor(named: color)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        return button
    }
    
    @objc func checkboxTaped(sender: UIButton) {
        colorButtonsArray[sender.tag].isOn.toggle()
        setBackground(view: sender, onOffStatus: colorButtonsArray[sender.tag].isOn)
    }
}
