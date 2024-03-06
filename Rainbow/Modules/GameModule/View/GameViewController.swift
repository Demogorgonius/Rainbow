
import UIKit
import SnapKit


final class GameViewController: UIViewController {
    
    // MARK: Properties
    var presenter: GamePresenterProtocol!

    var timer = Timer()
    var colorsAnimator: UIViewPropertyAnimator?
    
    private let gameView: GameView = {
        let view = GameView()
        return view
    }()
    
    
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getSettings()
//        getRainbowView()
        addSubviews()
        
//        startTimer(with: presenter.elapsedTime)
//        startColorsAnimation()
        configureNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    // MARK: Private Methods
    private func addSubviews() {
        view.addVerticalGradientLayer()
        view.addSubview(gameView)
        
        gameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureNavigationBar() {
        navigationController?.setupNavigationBar()
        
        navigationItem.title = formattedTime(from: TimeInterval(presenter.settings?.durationGame ?? 15))
        
        let pauseBarButton = UIBarButtonItem(image: UIImage(systemName: "pause.fill"), style: .plain, target: self, action: #selector(pauseButtonPressed))
        navigationItem.rightBarButtonItem = pauseBarButton
    }
    
    private func formattedTime(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

extension GameViewController {
    
    @objc func pauseButtonPressed() {
    }
    
}

// MARK: GameViewProtocol
//extension GameViewController: GameViewProtocol {
//    func getRainbowView() {
//        presenter.getRainbowView(count: Int(presenter.countRainbowView))
//    }
//    
//    func getSettings() {
//        presenter.getSettings()
//    }
    
//    func startTimer(with elapsedTime: TimeInterval?) {
//        gameView.speedButton.addTarget(self, action: #selector(speedButtonPressed), for: .touchUpInside)
//        timer.invalidate()
//        presenter.startTime = Date()
//        
//        if let elapsedTime = elapsedTime {
//            presenter.startTime = presenter.startTime?.addingTimeInterval(-elapsedTime)
//        }
//        
//        timer = Timer.scheduledTimer(
//            timeInterval: 1.0,
//            target: self,
//            selector: #selector(updateTimer),
//            userInfo: nil,
//            repeats: true
//        )
//    }
    
//    func settingSpeed(_ xSpeed: Int, _ duration: CGFloat) {
//        presenter.defaultSpeed = xSpeed
//        gameView.speedButton.setTitle("X \(xSpeed)", for: .normal)
//        
//        if let colorsAnimator = colorsAnimator {
//            colorsAnimator.pauseAnimation()
//            colorsAnimator.continueAnimation(withTimingParameters: .none, durationFactor: duration)
//        }
//    }
    
//    private func startColorsAnimation() {
//        var sizeBetweenColors = 0.0
//
//        for colorView in presenter.colorViews {
//            view.addSubview(colorView)
//            view.bringSubviewToFront(gameView.speedButton)
//            view.bringSubviewToFront(gameView)
//            setInitialColorViewPosition(colorView, sizeBetweenColors: sizeBetweenColors)
//            sizeBetweenColors -= 250
//        }
//
//        colorsAnimator = UIViewPropertyAnimator(duration: TimeInterval(presenter.speed), curve: .linear) {
//            self.presenter.colorViews.forEach { colorView in
//                self.moveColorViewOffScreen(colorView, sizeBetweenColors: sizeBetweenColors)
//            }
//        }
//        colorsAnimator?.startAnimation()
//    }

//    private func setInitialColorViewPosition(_ colorView: RainbowView, sizeBetweenColors: Double) {
//        let xPosition = Double.random(
//            in: presenter.settings?.isCenterOnScreen ?? true
//            ? 8...300
//            : 149...150
//        )
//        let yPosition = UIScreen.main.bounds.height - sizeBetweenColors
//        colorView.frame = CGRect(
//            x: xPosition,
//            y: yPosition,
//            width: 120,
//            height: 40
//        )
//    }
//
//    private func moveColorViewOffScreen(_ colorView: RainbowView, sizeBetweenColors: Double) {
//        colorView.frame = CGRect(
//            x: colorView.frame.origin.x,
//            y: self.view.frame.height + sizeBetweenColors,
//            width: 120,
//            height: 40
//        )
//        colorView.alpha = 0
//    }
//    

    
    // MARK: @objc func
//    @objc func pauseButtonPressed() {
//        if timer.isValid {
//            presenter.elapsedTime = Date().timeIntervalSince(presenter.startTime ?? Date())
//            timer.invalidate()
//            colorsAnimator?.pauseAnimation()
//            gameView.speedButton.isHidden = true
//            gameView.pauseLabel.isHidden = false
//            gameView.colorButtons.forEach { button in
//                button.isHidden = true
//            }
//            gameView.secondColorButtons.forEach { button in
//                button.isHidden = true
//            }
//            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "play.fill")
//        } else {
//            startTimer(with: presenter.elapsedTime)
//            colorsAnimator?.startAnimation()
//            gameView.speedButton.isHidden = false
//            gameView.colorButtons.forEach { button in
//                button.isHidden = false
//            }
//            gameView.secondColorButtons.forEach { button in
//                button.isHidden = false
//            }
//            gameView.pauseLabel.isHidden = true
//            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "pause.fill")
//        }
//    }
//    
//    @objc func speedButtonPressed() {
//        let currentSpeed = presenter.defaultSpeed
//        let nextSpeed = currentSpeed + 1 > 5 ? 1 : currentSpeed + 1
//        
//        settingSpeed(nextSpeed, 1.0 / CGFloat(nextSpeed))
//    }
    
//    @objc func updateTimer() {
//        guard let startTime = presenter.startTime else { return }
//        let elapsedTime = Date().timeIntervalSince(startTime)
//        let remainingTime = max(TimeInterval(presenter.settings?.durationGame ?? 15) - elapsedTime, 0)
//        navigationItem.title = formattedTime(from: remainingTime)
//        
//        if elapsedTime >= TimeInterval(presenter.settings?.durationGame ?? 15) {
//            timer.invalidate()
//            
//            presenter.gameManager.addStatistic(.init(
//                numberGame: presenter.numberGame,
//                durationGame: presenter.settings?.durationGame ?? 0,
//                speedGame: presenter.defaultSpeed,
//                resultGame: String(presenter.rainbowViewManager.roundPoints))
//            )
//            
//            presenter.routeToResultScreen()
//        }
//    }
//}
