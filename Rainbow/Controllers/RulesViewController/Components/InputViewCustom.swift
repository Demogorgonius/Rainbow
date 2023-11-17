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

//MARK: - SettingsView
protocol SettingsView {
    func setupConstraints()
    func attributesFirst()
    func attributesSecond()
}

final class InputViewCustom: UIView {
    
    //MARK: - UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .RainbowGameColor.customBurgundy
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textView: UITextView = {
        let view = UITextView()
        view.font = UIFont.systemFont(ofSize: 36)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var substrateFirst: UILabel = {
        let label = UILabel()
        label.text = "подложка включена:"
        label.textColor = .RainbowGameColor.customBlack
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var substrateSecond: UILabel = {
        let label = UILabel()
        label.text = "подложка выключена:"
        label.textColor = .RainbowGameColor.customBlack
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var nameShadow: UILabel = {
        let label = UILabel()
        label.text = "СИНИЙ"
        label.layer.shadowColor = UIColor.RainbowGameColor.customBackground.cgColor
        label.layer.shadowOffset = CGSize(width: 0, height: 5)
        label.layer.shadowOpacity = 0.5
        label.layer.shadowRadius = 1.5
        label.textColor = .RainbowGameColor.customLightGreen
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var buttonView: UIButton = {
        let button = UIButton()
        button.setTitle("СИНИЙ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .RainbowGameColor.customLightGreen
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.shadowColor = UIColor.RainbowGameColor.customBackground.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 2
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var textViewSecond: UITextView = {
        let view = UITextView()
        view.font = .CormorantFont.RegularItalic.size(of: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var style: InputViewStyle = .rulesOfTheGame
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        attributesFirst()
        attributesSecond()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupViews
    private func setupViews() {
        switch style {
        case .rulesOfTheGame:
            titleLabel.text = "ПРАВИЛА ИГРЫ"
        case .newRulesOfTheGame:
            titleLabel.text = " НОВЫЕ ПРАВИЛА ИГРЫ"
        }
        addSubviews(titleLabel, textView, substrateFirst, substrateSecond, nameShadow, buttonView, textViewSecond)
    }
}

//MARK: - InputViewCustom
extension InputViewCustom: SettingsView {
    func attributesFirst() {
        let attributedString = NSMutableAttributedString(string: """
        На экране в случайном
        месте появляется слово,
        обозначающее цвет,
        например: написано
        «синий»:
        """)
        let range = (attributedString.string as NSString).range(of: "«синий»")
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: range)
        textView.attributedText = attributedString
        textView.font = UIFont.systemFont(ofSize: 20)
    }
    
    func attributesSecond() {
        let attributedString = NSMutableAttributedString(string: """
        Нужно произнести вслух
        цвет слова (если опция
        «подложка для букв»
        выключена) или цвет фона,
        на котором написано
        слово (если опция
        «подложка для букв»
        включена):
        говорим «зеленый».
        
        В игре можно изменять
        скорость от 1x до 5x. А так
        же длительность игры.
        """)
        let range = (attributedString.string as NSString).range(of: "говорим «зеленый»")
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: range)
        textViewSecond.attributedText = attributedString
        textViewSecond.font = UIFont.systemFont(ofSize: 20)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -38),
            
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            textView.bottomAnchor.constraint(equalTo: substrateFirst.topAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 143),
            
            substrateFirst.centerXAnchor.constraint(equalTo: nameShadow.centerXAnchor),
            substrateFirst.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            substrateSecond.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20),
            substrateSecond.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            
            nameShadow.topAnchor.constraint(equalTo: substrateFirst.bottomAnchor, constant: 10),
            nameShadow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            
            buttonView.centerYAnchor.constraint(equalTo: nameShadow.centerYAnchor),
            buttonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            
            textViewSecond.topAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 10),
            textViewSecond.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            textViewSecond.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            textViewSecond.heightAnchor.constraint(equalToConstant: 320)
        ])
    }
}
