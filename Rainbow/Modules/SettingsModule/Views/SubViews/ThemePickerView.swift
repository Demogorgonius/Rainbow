
import UIKit

final class ThemePickerView: UIView {
    lazy var themePickerView = ViewFactory.createShadowView()
    
    lazy var themePickerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        [themePickerLabel, themePickerSegmentedControl].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var themePickerLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:  NSLocalizedString("backgroundForGameLabel",
            comment: "")
        )
    }()
    
    lazy var themePickerSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: [NSLocalizedString("backgroundForGameSCLight", comment: ""), NSLocalizedString("backgroundForGameSCDark", comment: "")])
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "customBlack")!]
        sc.setTitleTextAttributes(titleTextAttributes, for: .normal)
        sc.setTitleTextAttributes(titleTextAttributes, for: .selected)
        sc.selectedSegmentTintColor = .white
        sc.selectedSegmentIndex = 0
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
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
        addSubview(themePickerView.shadowView)
        themePickerView.shadowView.addSubview(themePickerStack)
    }
    
    private func setupConstraints() {
        themePickerView.shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        themePickerStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        themePickerSegmentedControl.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
    }
}
