

import UIKit

final class AppLangView: UIView {
    lazy var appLangView = ViewFactory.createShadowView()
    
    lazy var appLangStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        [appLangLabel, appLangSC].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var appLangLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:   NSLocalizedString("appLangLabel",
            comment: "")
        )
    }()
    
    lazy var appLangSC: UISegmentedControl = {
        let sc = UISegmentedControl(items: [NSLocalizedString("appLangSCRus", comment: ""), NSLocalizedString("appLangSCEn", comment: "")])
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        sc.setTitleTextAttributes(titleTextAttributes, for: .normal)
        sc.setTitleTextAttributes(titleTextAttributes, for: .selected)
        sc.selectedSegmentTintColor = .white
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
        addSubview(appLangView.shadowView)
        appLangView.shadowView.addSubview(appLangStack)
    }
    
    private func setupConstraints() {
        appLangView.shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        appLangStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        
        appLangSC.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(298)
        }
    }
}
