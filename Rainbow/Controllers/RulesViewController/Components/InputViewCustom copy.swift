//
//  InputViewCustom.swift
//  RainbowGame
//
//  Created by Danila Bolshakov on 13.11.2023.
//

import UIKit

//MARK: - InputViewStyle
enum InputViewStyle {
    case rulesOfTheGame
    case newRulesOfTheGame
}

final class InputViewCustom: UIView {
    
    //MARK: - UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textView: UITextView = {
        let field = UITextView()
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var style: InputViewStyle = .rulesOfTheGame
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        switch style {
        case .rulesOfTheGame:
            titleLabel.text = "ПРАВИЛА ИГРЫ"
            textView.text = """
        На экране в случайном 
        месте появляется слово,
        обозначающее цвет, 
        например: написано
        «синий»:
        """
            textView.textAlignment = .left
        case .newRulesOfTheGame:
            titleLabel.text = " НОВЫЕ ПРАВИЛА ИГРЫ"
            textView.text = """
        На экране в случайном
        месте появляется слово,
        обозначающее цвет,
        например: написано
        «синий»:
        """
        }
        addSubview(titleLabel)
        addSubview(textView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -38),
            
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
