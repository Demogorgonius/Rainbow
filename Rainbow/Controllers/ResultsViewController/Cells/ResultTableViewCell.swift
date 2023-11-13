//
//  ResultTableViewCell.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 13.11.2023.
//

import UIKit

final class ResultTableViewCell: UITableViewCell {
    
    // MARK: - UI Properties
    
    lazy var resultContentView: ContenableView = {
        return ViewFactory.createShadowView()
    }()
    
    lazy var gameNumberLabel: UILabel = {
        let lb = UILabel()
        lb.text = "игра №1"
        lb.textColor = .systemPink
        lb.font = UIFont.systemFont(ofSize: 20)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    lazy var gameTimeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "время: 11.0"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 20)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    lazy var gameSpeedLabel: UILabel = {
        let lb = UILabel()
        lb.text = "скорость х2"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 20)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    lazy var gameResultLabel: UILabel = {
        let lb = UILabel()
        lb.text = "угадано 1/1"
        lb.textColor = .green
        lb.font = UIFont.systemFont(ofSize: 20)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
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
        contentView.backgroundColor = .lightGray
        let resultView = resultContentView.shadowView
        
        contentView.addSubview(resultContentView.shadowView)
        resultView.addSubview(gameTimeLabel)
        resultView.addSubview(gameSpeedLabel)
        resultView.addSubview(gameNumberLabel)
        resultView.addSubview(gameResultLabel)
    
    NSLayoutConstraint.activate([
        resultView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
        resultView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33),
        resultView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33),
        resultView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9),
        resultView.widthAnchor.constraint(equalToConstant: 308.2),
        resultView.heightAnchor.constraint(equalToConstant: 80),
        
        gameNumberLabel.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 8),
        gameNumberLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 8),
        
        gameTimeLabel.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -8),
        gameTimeLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 8),
        
        gameSpeedLabel.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 8),
        gameSpeedLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -8),
        
        gameResultLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -8),
        gameResultLabel.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -8),
        
    ])
}
}
