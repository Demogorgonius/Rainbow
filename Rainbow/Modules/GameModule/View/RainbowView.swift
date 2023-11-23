//
//  RainbowView.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 21.11.2023.
//

import UIKit

final class RainbowView: UIView {
    
    private let coloredView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .init(width: 0, height: 4)
        view.layer.shadowOpacity = 0.25
        view.isHidden = true
        return view
    }()
    
    private let titleLabel = UILabel()
    private var selectHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        addSubview(coloredView)
        addSubview(titleLabel)
        
        titleLabel.font = UIFont.DisplayFont.Heavy.size(of: 20)
        
        coloredView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
            $0.leading.greaterThanOrEqualToSuperview().inset(6)
            $0.centerX.equalToSuperview().priority(.medium)
        }
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didSelect))
        tapGR.cancelsTouchesInView = false
        addGestureRecognizer(tapGR)
    }
    
    @objc
    private func didSelect() {
        selectHandler?()
        titleLabel.textColor = .customBlack
        titleLabel.text = "верно"
        coloredView.backgroundColor = .customGreenForButton
    }
    
    func update(_ model: GameModel) {
        titleLabel.text = model.text
        titleLabel.textColor = .white
        titleLabel.font = titleLabel.font.withSize(model.fontSize)
        selectHandler = model.didSelectHandler
        coloredView.backgroundColor = model.rainbowViewColor
    }
}


