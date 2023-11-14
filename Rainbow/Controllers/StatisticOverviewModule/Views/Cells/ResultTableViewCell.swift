//
//  ResultTableViewCell.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 13.11.2023.
//

import UIKit
import SnapKit

final class ResultTableViewCell: UITableViewCell {
    
    // MARK: - UI Properties
    
    lazy var resultContentView: ContenableView = {
        return ViewFactory.createShadowView()
    }()
    
    lazy var gameNumberLabel: UILabel = {
        return LabelFactory.createLabel(type: .gamePink)
    }()

    lazy var gameTimeLabel: UILabel = {
        return LabelFactory.createLabel(type: .gameBlack)
    }()

    lazy var gameSpeedLabel: UILabel = {
        return LabelFactory.createLabel(type: .gameBlack)
    }()

    lazy var gameResultLabel: UILabel = {
        return LabelFactory.createLabel(type: .gameLightGreen)
    }()
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        contentView.backgroundColor = UIColor.RainbowGameColor.customBackground
        let resultView = resultContentView.shadowView
        
        contentView.addSubview(resultContentView.shadowView)
        resultView.addSubview(gameTimeLabel)
        resultView.addSubview(gameSpeedLabel)
        resultView.addSubview(gameNumberLabel)
        resultView.addSubview(gameResultLabel)
        
        resultView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(9)
            make.leading.equalTo(contentView).offset(33)
            make.trailing.equalTo(contentView).offset(-33)
            make.bottom.equalTo(contentView).offset(-9)
            make.width.equalTo(308.2)
            make.height.equalTo(80)
        }
        
        gameNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(resultView).offset(8)
            make.leading.equalTo(resultView).offset(8)
        }
        
        gameTimeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(resultView).offset(-8)
            make.leading.equalTo(resultView).offset(8)
        }
        
        gameSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(resultView).offset(8)
            make.trailing.equalTo(resultView).offset(-8)
        }
        
        gameResultLabel.snp.makeConstraints { make in
            make.trailing.equalTo(resultView).offset(-8)
            make.bottom.equalTo(resultView).offset(-8)
        }
        
    }
}
