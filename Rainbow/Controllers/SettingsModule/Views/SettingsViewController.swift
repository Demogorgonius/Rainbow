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
    
    //    var presenter: SettingsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupViews()
        setupLayout()
    }
    
    // MARK: - Main Stack
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [gameTimeShadowView.shadowView, gameSpeedShadowView.shadowView].forEach {
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
        slider.minimumTrackTintColor = UIColor.orange
        return slider
    }()
    
    lazy var gameTimeSliderLabel: UILabel = {
        let label = UILabel()
        label.text = String(Int(gameTimeSlider.value))
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
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
        slider.minimumTrackTintColor = UIColor.orange
        return slider
    }()
    
    lazy var gameSpeedSliderLabel: UILabel = {
        let label = UILabel()
        label.text = String(Int(gameSpeedSlider.value))
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    
    
    @objc func sliderValueChanged(sender: UISlider) {
        var currentValue = Int(sender.value)
        sender == gameTimeSlider ? (gameTimeSliderLabel.text = "\(currentValue)") : (gameSpeedSliderLabel.text = "\(currentValue)")
    }
    
    
    
    
    
    
    
    
    
    func getSettings() {
        //
    }
    
    
    func setupViews() {
        gameTimeShadowView.shadowView.addSubview(gameTimeStack)
        gameSpeedShadowView.shadowView.addSubview(gameSpeedStack)
        view.addSubview(mainStack)
    }
    
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
        
        mainStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(121)
        }
    }
}
    
    
    
    //        let view1 = createGameTimeView()
    //        let view2 = createGameTimeView()
    //        let stack = {
    //            let stack = UIStackView()
    //            stack.axis = .vertical
    //            stack.spacing = 20
    //            stack.distribution = .equalSpacing
    //            stack.alignment = .center
    //            stack.translatesAutoresizingMaskIntoConstraints = false
    //            return stack
    //        }()
    //
    //        stack.addArrangedSubview(view1)
    //        stack.addArrangedSubview(view2)
    //
    //
    //
    //        view.addSubview(stack)
    //
    //        stack.snp.makeConstraints { make in
    //            make.centerX.equalToSuperview()
    //            make.top.equalToSuperview().offset(121)
    //
    //
    //
    //    }
    //
    //
    //    func createGameTimeView() -> UIView {
    //        let gameTimeShadowView = ViewFactory.createShadowView()
    //        let gameTimeStack = SettingsViewService.shared.createStackView()
    //        let gameTimeLabel = SettingsViewService.shared.createSettingTitle(title: "скорость смены заданий, мин")
    //        let gameTimeSlider = SettingsViewService.shared.createSettingSlider(minimum: 1, maximum: 20)
    //        let gameTimeSliderValueLabel = {
    //            let label = UILabel()
    //            label.text = String(gameTimeSlider.)
    //            label.font = UIFont.systemFont(ofSize: 20)
    //            label.textColor = .black
    //            label.numberOfLines = 0
    //            return label
    //        }()
    //
    //        gameTimeStack.addArrangedSubview(gameTimeLabel)
    //        gameTimeStack.addArrangedSubview(gameTimeSlider)
    //        gameTimeStack.addArrangedSubview(gameTimeSliderValueLabel)
    //        gameTimeShadowView.shadowView.addSubview(gameTimeStack)
    //
    //        SettingsViewService.shared.setupConstrains(for: gameTimeStack)
    //
    //        view.addSubview(gameTimeShadowView.shadowView)
    //
    //        gameTimeShadowView.shadowView.snp.makeConstraints { make in
    //            make.centerX.equalToSuperview()
    ////            make.top.equalTo(view.snp.top).offset(121)
    //            make.height.equalTo(66)
    //            make.width.equalTo(298)
    //        }
    //
    //        return gameTimeShadowView.shadowView
    //
    //    }
    //
    //
    //
    //
    //
    //}

