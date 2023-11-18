//
//  GamePresenter.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//


import UIKit

protocol GameViewProtocol: AnyObject {
    func startTimer(with elapsedTime: TimeInterval?)
}

protocol GamePresenterProtocol {
    var colorViews: [UIView] { get set }
    var colorNames: [String] { get set }
    var isAnswerVerificationEnabled: Bool { get }
    var totalTime: TimeInterval { get set }
    var startTime: Date? { get set }
    var elapsedTime: TimeInterval? { get set }
    
    var numberGame: Int { get set }
    var resultStorage: ResultsStorageProtocol { get set }

    func getSettings()
    func updateStatistics(correctAnswer: Bool)
    func hasBackground() -> Bool
    func addRandomColorView(with settings: GameSettings)
    func startHidingCycle()

}

class GamePresenter: GamePresenterProtocol {

    weak var view: GameViewProtocol?
    
    let settingsManager: SettingManagerProtocol
    private let router: GameRouterProtocol
    private let gameEngine: GameEngineProtocol
    
    
    var timer = Timer()
    var totalTime: TimeInterval = 15.0
    var startTime: Date?
    var elapsedTime: TimeInterval?

    
    var colorViews: [UIView] = []
    var colorNames: [String] = []
    

    var isAnswerVerificationEnabled = true
    var correctAnswersCount: Int = 0
    var numberGame: Int = 0
    
    var settings: GameSettings?
    var settings: GameSettings?
    var resultStorage: ResultsStorageProtocol

    
    init(router: GameRouterProtocol, settingsManager: SettingManagerProtocol, gameEngine: GameEngineProtocol) {
        self.router = router
        self.settingsManager = settingsManager
        self.gameEngine = gameEngine
        self.resultStorage = resultStorage
        getSettings()
    }

  
    func getSettings() {
        settingsManager.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    private func createColorView(with color: UIColor) -> UIView {
           let colorView = UIView()
           colorView.backgroundColor = color
           colorView.layer.cornerRadius = 10

           return colorView
       }

    
    func updateStatistics(correctAnswer: Bool) {
        if correctAnswer {
            correctAnswersCount += 1
        }
    }
    
    func hasBackground() -> Bool {
        return settings?.backgroundForText ?? true
    }
    
    func addRandomColorView(with settings: GameSettings) {
        guard let settings = settings else { return }
        
        let randomColor = gameEngine.generateRandomColor(with: settings)
        let colorName = gameEngine.generateRandomColorName()
        
        let colorView = createColorView(with: randomColor)
        view?.addColorView(colorView)
        
        addLabel(to: colorView, with: colorName)
        
        colorViews.append(colorView)
        
        if isAnswerVerificationEnabled {
            addCheckbox(to: colorView)
        }
    }
    
    func startHidingCycle() {
    
    }
    
    private func addLabel(to colorView: UIView, with text: String) {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.textAlignment = .center
        colorView.addSubview(label)
        label.frame = CGRect(x: 0, y: 0, width: colorView.frame.width, height: colorView.frame.height)
    }
    
    private func addCheckbox(to colorView: UIView) {
        let checkboxButton = UIButton(type: .roundedRect)
        checkboxButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        checkboxButton.tintColor = .black
        colorView.addSubview(checkboxButton)
        checkboxButton.frame = CGRect(x: colorView.frame.width, y: colorView.frame.height / 2 - 12, width: 24, height: 24)
        checkboxButton.addTarget(self, action: #selector(checkboxButtonTapped), for: .touchUpInside)
    }
    
    @objc func checkboxButtonTapped() {
        updateStatistics(correctAnswer: true)
    }
    
}
