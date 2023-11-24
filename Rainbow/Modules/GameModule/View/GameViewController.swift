//
//  GameViewController.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//

import UIKit
import SnapKit

enum Speed: String {
    case x1 = "X1"
    case x2 = "X2"
    case x3 = "X3"
    case x4 = "X4"
    case x5 = "X5"
}

class GameViewController: UIViewController {
    
    var presenter: GamePresenterProtocol!
    
    var timer = Timer()
    var colorsAnimator: UIViewPropertyAnimator?
    
    lazy var speedButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customRed,
            title: presenter.defaultSpeed,
            target: self,
            action: #selector(speedButtonPressed))
        return button
    }()
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSettings()
        getRainbowView()
        
        navigationItem.title = formattedTime(from: TimeInterval(presenter.settings?.durationGame ?? 15))
        navigationController?.setupNavigationBar()
        addSubviews()
        startTimer(with: presenter.elapsedTime)
        addPatterns()
        configureNavigationBar()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    // MARK: Private Methods
    
    private func configureNavigationBar() {
        let pauseBarButton = UIBarButtonItem(image: UIImage(systemName: "pause.fill"), style: .plain, target: self, action: #selector(pauseButtonPressed))
        navigationItem.rightBarButtonItem = pauseBarButton
    }
    
    private func addSubviews() {
        view.backgroundColor = .customBackground
        view.addSubview(speedButton)
        speedButton.frame = CGRect(x: 0, y: 0, width: 73, height: 73)
        speedButton.snp.makeConstraints { make in
            make.width.equalTo(73)
            make.height.equalTo(73)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-34)
            
            speedButton.layer.cornerRadius = speedButton.frame.size.height / 2
        }
    }
    
    private func formattedTime(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}


// MARK: GameViewProtocol
extension GameViewController: GameViewProtocol {
    func getRainbowView() {
        presenter.getRainbowView(count: Int(presenter.countColors))
    }
    
    
    func getSettings() {
        presenter.getSettings()
    }
    
    func startTimer(with elapsedTime: TimeInterval?) {
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
    
    func settingSpeed(_ xSpeed: Speed, _ duration: CGFloat) {
        presenter.defaultSpeed = xSpeed.rawValue
        speedButton.setTitle(xSpeed.rawValue, for: .normal)
        colorsAnimator?.pauseAnimation()
        colorsAnimator?.continueAnimation(withTimingParameters: .none, durationFactor: duration)
    }
    
    private func addPatterns() {
        var sizeBetweenColors = 0.0
        
        for colorView in presenter.colorViews {
            view.addSubview(colorView)
            view.bringSubviewToFront(speedButton)
            colorView.frame = CGRect(
                x: Double.random(in: presenter.settings?.isCenterOnScreen ?? true ? 20...280 : 10...260),
                y: UIScreen.main.bounds.height - sizeBetweenColors,
                width: 100,
                height: 100
            )
            
            sizeBetweenColors -= 250
        }
        
        colorsAnimator = UIViewPropertyAnimator(duration: TimeInterval(presenter.speed), curve: .linear) {
            self.presenter.colorViews.forEach { colorView in
                colorView.frame = CGRect(
                    x: colorView.frame.origin.x,
                    y: self.view.frame.height + sizeBetweenColors,
                    width: 100,
                    height: 100
                )
                colorView.alpha = 0
            }
        }
        colorsAnimator?.startAnimation()
    }
    
    // MARK: @objc func
    @objc func pauseButtonPressed() {
        if timer.isValid {
            presenter.elapsedTime = Date().timeIntervalSince(presenter.startTime ?? Date())
            timer.invalidate()
            colorsAnimator?.pauseAnimation()
            speedButton.isHidden = true
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "play.fill")
        } else {
            startTimer(with: presenter.elapsedTime)
            colorsAnimator?.startAnimation()
            speedButton.isHidden = false
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "pause.fill")
        }
    }
    
    @objc func speedButtonPressed() {
        switch presenter.defaultSpeed {
        case Speed.x1.rawValue:
            settingSpeed(Speed.x2, 1/2)
        case Speed.x2.rawValue:
            settingSpeed(Speed.x3, 1/3)
        case Speed.x3.rawValue:
            settingSpeed(Speed.x4, 1/4)
        case Speed.x4.rawValue:
            settingSpeed(Speed.x5, 1/5)
        default:
            settingSpeed(Speed.x1, 1/1)
        }
    }
    
    // MARK: @objc func
    @objc func updateTimer() {
        guard let startTime = presenter.startTime else { return }
        let elapsedTime = Date().timeIntervalSince(startTime)
        let remainingTime = max(TimeInterval(presenter.settings?.durationGame ?? 15) - elapsedTime, 0)
        navigationItem.title = formattedTime(from: remainingTime)
        
        if elapsedTime >= TimeInterval(presenter.settings?.durationGame ?? 15) {
            timer.invalidate()
            
            presenter.gameManager.addStatistic(.init(
                numberGame: presenter.numberGame,
                durationGame: presenter.settings?.durationGame ?? 0,
                speedGame: presenter.settings?.speedGame ?? 6,
                resultGame: "3/4")
            )
            
            presenter.routeToResultScreen()
        }
    }
}
