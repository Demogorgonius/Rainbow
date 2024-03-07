
import UIKit

final class BackgroundForWordView: UIView {
    
    lazy var backgroundForWordView = ViewFactory.createShadowView()
    
    lazy var backgroundForWordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [backgroundForWordLabel, switchedViewForLabel].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()

    lazy var backgroundForWordLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:  NSLocalizedString("backgroundForWordLabel",
            comment: "")
        )
    }()
    
    lazy var switchedViewForLabel: UISwitch = {
        let switcher = UISwitch()
//        switcher.isOn = presenter.settings?.isViewForText ?? false
        switcher.onTintColor = .customOrange
     //   switcher.addTarget(self, action: #selector(toggledSwitchValue), for: .valueChanged)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
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
        addSubview(backgroundForWordView.shadowView)
        backgroundForWordView.shadowView.addSubview(backgroundForWordStack)
    }
    
    private func setupConstraints() {
        backgroundForWordView.shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundForWordStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
    }
}
