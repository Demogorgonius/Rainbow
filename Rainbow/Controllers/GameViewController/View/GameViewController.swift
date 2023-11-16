//
//  GameViewController.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//

import Foundation
import UIKit

protocol GameView: AnyObject {
    func updateTimerLabel(text: String)
    func updateColorViews(colorInfo: [(text: String, backgroundColor: UIColor)])
}

class GameViewController: UIViewController {
    
    var presenter: GamePresenter?
    
    private var timerLabel = UILabel(text: "00:06", font: UIFont.DisplayFont.Regular.size(of: 30))
    var colorViews: [UIView] = []
    var colorLabels: [UILabel] = []
    
    private var pauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.addTarget(self, action: #selector(pauseButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .RainbowGameColor.customBackground
        navigationItem.title = "Таймер"
        navigationController?.setupNavigationBar()
        addButtons()
    }
    
    func setupUI() {
        
    }
    
    func addButtons() {
    
        view.addSubview(pauseButton)
        
        // увеличение картинок кнопок
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)
        
        pauseButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)

        
        pauseButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-20)
        }

    }

    
//    func updateTimerLabel(text: String) {
//        <#code#>
//    }
//    
//    func updateColorViews(colorInfo: [(text: String, backgroundColor: UIColor)]) {
//        <#code#>
//    }
    
    @objc func pauseButtonPressed() {
        
    }
    
    @objc func arrowButtonPressed() {
        
    }
}
