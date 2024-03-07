
import UIKit

final class BackgroundForGameView: UIView {
    lazy var backgroundForGameView = ViewFactory.createShadowView()
    
    lazy var backgroundForGameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        [backgroundForGameLabel, backgroundForGameSC].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var backgroundForGameLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:  NSLocalizedString("backgroundForGameLabel",
            comment: "")
        )
    }()
    
    lazy var backgroundForGameSC: UISegmentedControl = {
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
        addSubview(backgroundForGameView.shadowView)
        backgroundForGameView.shadowView.addSubview(backgroundForGameStack)
    }
    
    private func setupConstraints() {
        backgroundForGameView.shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundForGameStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        
        backgroundForGameSC.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(298)
        }
    }
}
