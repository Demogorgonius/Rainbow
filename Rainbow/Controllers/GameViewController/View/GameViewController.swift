//
//  GameViewController.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    private var presenter: GamePresenterProtocol
    
    var timer = Timer()

    lazy var speedButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("X2", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = .RainbowGameColor.customRed
        bt.layer.cornerRadius = 36.5
        bt.layer.shadowOffset = CGSize(width: 0, height: 4)
        bt.layer.shadowOpacity = 0.9
        bt.layer.shadowRadius = 3
        bt.layer.shadowColor = UIColor.black.cgColor
        bt.addTarget(self, action: #selector(speedButtonPressed), for: .touchUpInside)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    //MARK: Init
    init(presenter: GamePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSettings()
        navigationItem.title = formattedTime(from: presenter.totalTime)
        navigationController?.setupNavigationBar()
        addSubviews()
        startTimer(with: presenter.elapsedTime)
        configureNavigationBar()
        
        addRandomColorView()
        startHidingCycle()
    }
    
    // MARK: Private Methods
    
    private func configureNavigationBar() {
        let pauseBarButton = UIBarButtonItem(image: UIImage(systemName: "pause.fill"), style: .plain, target: self, action: #selector(pauseButtonPressed))
        navigationItem.rightBarButtonItem = pauseBarButton
    }
    
    private func addSubviews() {
        view.backgroundColor = .RainbowGameColor.customBackground
        view.addSubview(speedButton)
        speedButton.snp.makeConstraints { make in
            make.width.equalTo(73)
            make.height.equalTo(73)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-34)
        }
    }
    
    private func generateRandomColor() -> UIColor {
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    private func generateRandomColorName() -> String {
        let colorNames = ["Красный", "Зеленый", "Голубой", "Желтый", "Оранжевый", "Фиолетовый", "Коричневый", "Розовый"]
        return colorNames.randomElement() ?? "Unknown"
    }
    
    private func formattedTime(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func generateView() -> UIView {
        let gameView = UIView()
        if presenter.backgroundForText  {
            
        }
        return gameView
    }
    
//    func generateRandomColor(with settings: GameSettings) -> UIColor {
//        guard let colorString = settings.backgroundForView,
//              let gameColor = GameColor(rawValue: colorString) else {
//            return .black
//        }
//        return UIColor.getColor(for: gameColor)
//    }
    
    private func addRandomColorView() {
        let randomColor = generateRandomColor()
        let colorName = generateRandomColorName()

        let colorView = UIView()
        colorView.backgroundColor = randomColor
        colorView.layer.cornerRadius = 10
        view.addSubview(colorView)

        colorView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalTo(view).offset(CGFloat.random(in: -140...140))
            make.centerY.equalTo(view).offset(CGFloat.random(in: -140...140))
        }

        let label = UILabel()
        label.text = colorName
        label.textColor = .white
        label.textAlignment = .center
        colorView.addSubview(label)

        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        presenter.colorViews.append(colorView)
    }
    
    private func startHidingCycle() {
        var index = 0
        var hideInterval = 2.0
        hideInterval = hideInterval * Double(presenter.speedGame)
        Timer.scheduledTimer(withTimeInterval: hideInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            guard index < presenter.colorViews.count else {
                index = 0
                return
            }
            
            presenter.colorViews[index].isHidden = true
            index += 1
        }
    }
}

// MARK: GameViewProtocol
extension GameViewController: GameViewProtocol {
    func getSettings() {
        presenter.getSettings()
    }
    
    internal func startTimer(with elapsedTime: TimeInterval?) {
        timer.invalidate()
        presenter.startTime = Date()
        
        if let elapsedTime = elapsedTime {
            presenter.startTime = presenter.startTime?.addingTimeInterval(-elapsedTime)
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    // MARK: @objc func
    @objc func pauseButtonPressed() {
        if timer.isValid {
            presenter.elapsedTime = Date().timeIntervalSince(presenter.startTime ?? Date())
            timer.invalidate()
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "play.fill")
        } else {
            startTimer(with: presenter.elapsedTime)
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "pause.fill")
        }
    }
    
    @objc func speedButtonPressed() {
        // Handle speed button press if needed
    }
    
    // MARK: @objc func
    @objc func updateTimer() {
        guard let startTime = presenter.startTime else { return }
        let elapsedTime = Date().timeIntervalSince(startTime)
        let remainingTime = max(presenter.totalTime - elapsedTime, 0)
        navigationItem.title = formattedTime(from: remainingTime)
        
        
        if Int(elapsedTime) % 2 == 0 {
            addRandomColorView()
            startHidingCycle()
        }
        
        
        if elapsedTime >= presenter.totalTime {
            timer.invalidate()
            presenter.resultStorage.addStatistic(
                .init(
                    numberGame: presenter.numberGame,
                    durationGame: presenter.totalTime ,
                    speedGame: 4,
                    resultGame: "3/4"
                )
            )
            presenter.numberGame += 1
            let resultScreen = ResultsBuilder.build()
            navigationController?.pushViewController(resultScreen, animated: true)

        }
    }
}
