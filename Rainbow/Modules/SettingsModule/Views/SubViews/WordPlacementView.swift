//
//  WordPlacementView.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 07.03.2024.
//

import UIKit

final class WordPlacementView: UIView {
    
    lazy var wordPlacementView = ViewFactory.createShadowView()
    
    lazy var wordPlacementStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        [wordPlacementLabel, wordPlacementSC].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var wordPlacementLabel: UILabel = {
        return LabelFactory.createLabel(
            type: .gameBlack,
            text:   NSLocalizedString("wordPlacementLabel",
            comment: "")
        )
    }()
    
    lazy var wordPlacementSC: UISegmentedControl = {
        let sc = UISegmentedControl(items: [NSLocalizedString("wordPlacementSCRandom", comment: ""), NSLocalizedString("wordPlacementSCCentre", comment: "")])
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        sc.setTitleTextAttributes(titleTextAttributes, for: .normal)
        sc.setTitleTextAttributes(titleTextAttributes, for: .selected)
        sc.selectedSegmentTintColor = .white
//        sc.selectedSegmentIndex = isRandomLocation() ? 0 : 1
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
        addSubview(wordPlacementView.shadowView)
        wordPlacementView.shadowView.addSubview(wordPlacementStack)
        
    }
    
    private func setupConstraints() {
        wordPlacementView.shadowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        wordPlacementStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        
        wordPlacementSC.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(298)
        }
        
    }
}
