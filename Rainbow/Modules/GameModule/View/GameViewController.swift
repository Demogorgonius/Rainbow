
import UIKit
import SnapKit

enum Speed: Int {
    case x1 = 1
    case x2 = 2
    case x3 = 3
    case x4 = 4
    case x5 = 5
}

class GameViewController: UIViewController {
    
    var presenter: GamePresenterProtocol!
    
    var timer = Timer()
    
    var colorsAnimator: UIViewPropertyAnimator?
    
    private let gameView: GameView = {
        let view = GameView()
        //view.delegate = self
        return view
    }()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSettings()
        getRainbowView()
        addSubviews()
        navigationItem.title = formattedTime(from: TimeInterval(presenter.settings?.durationGame ?? 15))
        navigationController?.setupNavigationBar()
        startTimer(with: presenter.elapsedTime)
        addPatterns()
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
        let pauseBarButton = UIBarButtonItem(image: UIImage(systemName: "pause.fill"), style: .plain, target: self, action: #selector(pauseButtonPressed))
        navigationItem.rightBarButtonItem = pauseBarButton
    }
    
    private func formattedTime(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

// MARK: GameViewDelegate
extension GameViewController: GameViewDelegate {
    func colorButtonPressed() {
        //
    }
    
    func speedButtonPressed() {
        let currentSpeed = presenter.defaultSpeed
        let nextSpeed = Speed(rawValue: currentSpeed + 1) ?? .x1
        
        settingSpeed(nextSpeed, 1.0 / CGFloat(nextSpeed.rawValue))
    }
}

// MARK: GameViewProtocol
extension GameViewController: GameViewProtocol {
    func getRainbowView() {
        presenter.getRainbowView(count: Int(presenter.countRainbowView))
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
        gameView.speedButton.setTitle("X \(xSpeed.rawValue)", for: .normal)
        
        if let colorsAnimator = colorsAnimator {
            colorsAnimator.pauseAnimation()
            colorsAnimator.continueAnimation(withTimingParameters: .none, durationFactor: duration)
        }
    }
    
    
    private func addPatterns() {
        var sizeBetweenColors = 0.0
        
        for colorView in presenter.colorViews {
            view.addSubview(colorView)
            view.bringSubviewToFront(gameView.speedButton)
            colorView.frame = CGRect(
                x: Double.random(
                    in: presenter.settings?.isCenterOnScreen ?? true
                    ? 8...300
                    : 149...150
                ),
                y: UIScreen.main.bounds.height - sizeBetweenColors,
                width: 100,
                height: 50
            )
            
            sizeBetweenColors -= 250
        }
        
        colorsAnimator = UIViewPropertyAnimator(duration: TimeInterval(presenter.speed), curve: .linear) {
            self.presenter.colorViews.forEach { colorView in
                colorView.frame = CGRect(
                    x: colorView.frame.origin.x,
                    y: self.view.frame.height + sizeBetweenColors,
                    width: 100,
                    height: 50
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
            gameView.speedButton.isHidden = true
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "play.fill")
        } else {
            startTimer(with: presenter.elapsedTime)
            colorsAnimator?.startAnimation()
            gameView.speedButton.isHidden = false
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "pause.fill")
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
                speedGame: presenter.defaultSpeed,
                resultGame: String(presenter.rainbowViewManager.roundPoints))
            )
            
            presenter.routeToResultScreen()
        }
    }
}
