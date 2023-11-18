//
//  SettingsViewController.swift
//  Rainbow
//
//  Created by Igor Guryan on 14.11.2023.
//

import Foundation
import UIKit
import SnapKit


class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocol?
    
    let colorCheckerBrain = ColorCheckerBrain()
    
    override func viewDidLoad() {
        presenter?.view = SettingsViewController()
        super.viewDidLoad()
        view.backgroundColor = .RainbowGameColor.customBackground
        setupButtons()
        setupViews()
        setupLayout()
        navigationItem.title = "Настройки"
        navigationController?.setupNavigationBar()
    }

        
    // MARK: - Main Stack
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [gameTimeShadowView.shadowView,
         gameSpeedShadowView.shadowView,
         gameWithAnswerCheckShadowView.shadowView,
         colorPickerShadowView.shadowView,
         gameSizeShadowView.shadowView,
         backgroundForWordShadowView.shadowView,
         backgroundForGameShadowView.shadowView,
         wordPlacementShadowView.shadowView].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    // MARK: - GameTime UI
    lazy var gameTimeShadowView = ViewFactory.createShadowView()
    lazy var gameTimeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [gameTimeLabel, gameTimeSlider, gameTimeSliderLabel].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var gameTimeLabel = SettingsViewService.shared.createSettingTitle(title: "Время игры, мин")
    
    lazy var gameTimeSlider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(sliderValueChanged), for: UIControl.Event.valueChanged)
        slider.minimumValue = 1.0
        slider.maximumValue = 20.0
        slider.setValue(11, animated: true)
        slider.minimumTrackTintColor = UIColor.RainbowGameColor.customOrange
        return slider
    }()
    
    lazy var gameTimeSliderLabel: UILabel = {
        let label = UILabel()
        label.text = String(Int(gameTimeSlider.value))
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - GameSpeed UI
    lazy var gameSpeedShadowView = ViewFactory.createShadowView()
    
    lazy var gameSpeedStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [gameSpeedLabel, gameSpeedSlider, gameSpeedSliderLabel].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var gameSpeedLabel = SettingsViewService.shared.createSettingTitle(title: "Скорость смены заданий, сек")
    
    lazy var gameSpeedSlider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(sliderValueChanged), for: UIControl.Event.valueChanged)
        slider.minimumValue = 1.0
        slider.maximumValue = 5.0
        slider.setValue(2.0, animated: true)
        slider.minimumTrackTintColor = UIColor.RainbowGameColor.customOrange
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var gameSpeedSliderLabel: UILabel = {
        let label = UILabel()
        label.text = String(Int(gameSpeedSlider.value))
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - GameWithAnswerCheck UI
    lazy var gameWithAnswerCheckShadowView = ViewFactory.createShadowView()
    lazy var gameWithAnswerCheckStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [gameWithAnswerCheckLabel, gameWithAnswerCheckSwitch].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var gameWithAnswerCheckLabel = SettingsViewService.shared.createSettingTitle(title: "Игра с проверкой заданий")
    
    lazy var gameWithAnswerCheckSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false
        switcher.onTintColor = UIColor.RainbowGameColor.customOrange
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()
    
    
    // MARK: - ColorPicker UI
    
    lazy var colorPickerShadowView = ViewFactory.createShadowView()
    
    lazy var colorPickerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [colorPickerLabel, colorPickerButtonStack].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
//    colorPickerButtonStack1, colorPickerButtonStack2
    lazy var colorPickerButtonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fillEqually
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        [colorPickerButtonStack1, colorPickerButtonStack2].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var colorPickerButtonStack1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .equalSpacing
//        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var colorPickerButtonStack2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .equalSpacing
//        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    lazy var colorPickerLabel = SettingsViewService.shared.createSettingTitle(title: "Цвета букв")
    
    // MARK: - gameSize UI
    
    lazy var gameSizeLabel = SettingsViewService.shared.createSettingTitle(title: "Размер букв")
    
    
    lazy var gameSizeShadowView = ViewFactory.createShadowView()
    
    lazy var gameSizeStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        stepper.minimumValue = 10.0
        stepper.maximumValue = 30.0
        stepper.stepValue = 1.0
        stepper.value = 15.0
        return stepper
        
    }()
    
    lazy var gameSizeStepperLabel: UILabel = {
        let label = UILabel()
        label.text = "Aa"
        label.font = UIFont.systemFont(ofSize: gameSizeStepper.value)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var gameSizeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [gameSizeLabel, gameSizeStepper, gameSizeStepperLabel].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    // MARK: - BackgroundForWord UI
    
    lazy var backgroundForWordShadowView = ViewFactory.createShadowView()
    
    lazy var backgroundForWordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [backgroundForWordLabel, backgroundForWordSwitch].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    } ()
    
    lazy var backgroundForWordLabel = SettingsViewService.shared.createSettingTitle(title: "Подложка для букв")
    
    lazy var backgroundForWordSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false
        switcher.onTintColor = UIColor.RainbowGameColor.customOrange
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()
    
    // MARK: - BackgroundForGame UI
    
    lazy var backgroundForGameShadowView = ViewFactory.createShadowView()
    
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
    
    lazy var backgroundForGameLabel = SettingsViewService.shared.createSettingTitle(title: "Цвет фона")
    
    lazy var backgroundForGameSC: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Серый", "Белый", "Черный"])
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        sc.setTitleTextAttributes(titleTextAttributes, for: .normal)
        sc.setTitleTextAttributes(titleTextAttributes, for: .selected)
        sc.setEnabled(true, forSegmentAt: 1)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    // MARK: - wordPlacement UI
    
    lazy var wordPlacementShadowView = ViewFactory.createShadowView()
    
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
    
    lazy var wordPlacementLabel = SettingsViewService.shared.createSettingTitle(title: "Расположение слова на экране")
    
    lazy var wordPlacementSC: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Случайное", "По центру"])
        sc.setEnabled(true, forSegmentAt: 1)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        sc.setTitleTextAttributes(titleTextAttributes, for: .normal)
        sc.setTitleTextAttributes(titleTextAttributes, for: .selected)
        sc.selectedSegmentTintColor = .white
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    // MARK: - Methods UI
    
    var isOn = false
    
    @objc func stepperValueChanged(sender: UIStepper) {
        gameSizeStepperLabel.font = UIFont.systemFont(ofSize: sender.value)
    }
    
    @objc func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        sender == gameTimeSlider ? (gameTimeSliderLabel.text = "\(currentValue)") : (gameSpeedSliderLabel.text = "\(currentValue)")
    }
    
    @objc func checkboxTaped(sender: UIButton) {
        isOn.toggle()
        setBackground(view: sender, onOffStatus: isOn)
        
    }
    
    func setBackground(view: UIButton, onOffStatus: Bool) {
        let whiteCheck = UIImage(named: "checkboxWhire")!
        let blackCheck = UIImage(named: "checkboxBlack")!
        switch onOffStatus {
        case true:
            view.backgroundColor == UIColor.RainbowGameColor.customBlack ? view.setImage(whiteCheck, for: .normal) : view.setImage(blackCheck, for: .normal)
        default:
            view.setImage(nil, for: .normal)
        }
    
        
    }
    
    func setupButtons() {
        var button = UIButton()
        for i in 0...11 {
                button = SettingsViewService.shared.createButton(color: colorCheckerBrain.colorCheckers[i].color)
                button.addTarget(self, action: #selector(checkboxTaped), for: .touchUpInside)
                button.tag = i
                i < 6 ? colorPickerButtonStack1.addArrangedSubview(button) : colorPickerButtonStack2.addArrangedSubview(button)
                
        }
    }
    
    
    
    
    
    func getSettings() {
        //
    }
    
    
    func setupViews() {
        gameTimeShadowView.shadowView.addSubview(gameTimeStack)
        gameSpeedShadowView.shadowView.addSubview(gameSpeedStack)
        gameWithAnswerCheckShadowView.shadowView.addSubview(gameWithAnswerCheckStack)
        colorPickerShadowView.shadowView.addSubview(colorPickerStack)
        gameSizeShadowView.shadowView.addSubview(gameSizeStack)
        backgroundForWordShadowView.shadowView.addSubview(backgroundForWordStack)
        backgroundForGameShadowView.shadowView.addSubview(backgroundForGameStack)
        wordPlacementShadowView.shadowView.addSubview(wordPlacementStack)
        view.addSubview(mainStack)

    }
    
    // MARK: - Layout
    
    func setupLayout() {
        gameTimeStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        
        gameTimeShadowView.shadowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //            make.top.equalToSuperview().offset(121)
            make.height.equalTo(66)
            make.width.equalTo(298)
        }
        gameSpeedStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        
        gameSpeedShadowView.shadowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //            make.top.equalToSuperview().offset(121)
            make.height.equalTo(66)
            make.width.equalTo(298)
        }
        
        gameWithAnswerCheckStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        
        gameWithAnswerCheckShadowView.shadowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //            make.top.equalToSuperview().offset(121)
            make.height.equalTo(66)
            make.width.equalTo(298)
        }
        
        colorPickerStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        
        colorPickerButtonStack1.snp.makeConstraints{ make in
            make.top.equalTo(colorPickerButtonStack)
            make.centerY.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalToSuperview()
        }
        
        colorPickerButtonStack2.snp.makeConstraints{ make in
            make.top.equalTo(colorPickerButtonStack1).offset(29)
//            make.centerY.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalToSuperview()
        }
        
        colorPickerButtonStack.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(54)
        }
        
        
        colorPickerShadowView.shadowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //            make.top.equalToSuperview().offset(121)
            make.height.equalTo(80)
            make.width.equalTo(298)
        }
        
        gameSizeStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        
        gameSizeShadowView.shadowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //            make.top.equalToSuperview().offset(121)
            make.height.equalTo(66)
            make.width.equalTo(298)
        }
        
        backgroundForWordStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        backgroundForWordShadowView.shadowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //            make.top.equalToSuperview().offset(121)
            make.height.equalTo(66)
            make.width.equalTo(298)
        }
        backgroundForGameStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        backgroundForGameShadowView.shadowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //            make.top.equalToSuperview().offset(121)
            make.height.equalTo(80)
            make.width.equalTo(298)
        }
        
        backgroundForGameSC.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //            make.top.equalToSuperview().offset(121)
            make.height.equalTo(20)
            make.width.equalTo(298)
        }
        wordPlacementStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-20)
        }
        
        wordPlacementShadowView.shadowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //            make.top.equalToSuperview().offset(121)
            make.height.equalTo(80)
            make.width.equalTo(298)
        }
        
        wordPlacementSC.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //            make.top.equalToSuperview().offset(121)
            make.height.equalTo(20)
            make.width.equalTo(298)
        }
        
        mainStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(121)
        }
        
    }
}
