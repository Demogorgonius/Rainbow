
import UIKit
import SnapKit


class GameViewController: UIViewController {
    
    // MARK: Properties
    var viewModel: ViewModel?
    var gameService: GameServiceProtocol!
    var presenter: GamePresenterProtocol!
    
    //MARK: - Timer settings
    
    var timer: Timer?
    var totalTime = 30
    var secondPassed = 0
    var elapsedTime: Int?
    
    //MARK: - Services variables
    
    var isPause: Bool = false
    var exitByTimer: Bool = false
    
    private let gameView: GameView = {
        let view = GameView()
        return view
    }()
    
    lazy var colorView: UIView = {
        
        let view = ColorViewFactory.createShadowView().shadowColorView
        view.backgroundColor = Colors.random.colorRowValue
        return view
        
    }()
    
    lazy var colorLabel: UILabel = {
        
        let label = ColorLabelFactory.createShadowLabel().shadowColorLabel
        label.text = Colors.random.colorDescription
        return label
        
    }()
    
    lazy var pauseLabel: UILabel = {
        
        let label = ColorLabelFactory.createShadowLabel().shadowColorLabel
        label.textColor = UIColor(cgColor: CGColor(red: 65, green: 65, blue: 90, alpha: 100))
        label.text = NSLocalizedString("pauseLabel", comment: "")
        return label
        
    }()
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        configureNavigationBar()
        
        if presenter.resumeGame == true {
            presenter.setView()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setConstraints()
        navigationItem.title = String(totalTime)
        if isPause == false {
            pauseLabel.isHidden = true
        } else {
            pauseLabel.isHidden = false
        }
        if presenter.resumeGame == false {
            timerStart()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    // MARK: Private Methods
    private func addSubviews() {
        view.addAnimatedGradientLayer()
        view.addSubview(gameView)
        view.addSubview(pauseLabel)
        gameView.addSubview(colorView)
        colorView.addSubview(colorLabel)
        
    }
    
    private func setConstraints() {
        
        gameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        pauseLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
    
    private func configureNavigationBar() {
        navigationController?.setupNavigationBar()
        navigationItem.title = String(totalTime)
        

        
        let pauseBarButton = UIBarButtonItem(image: UIImage(systemName: "pause.fill"), style: .plain, target: self, action: #selector(pauseButtonPressed))
        navigationItem.rightBarButtonItem = pauseBarButton
    }
    
    func timerStart() {
        if timer != nil {
            timer!.invalidate()
        }
        secondPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:  self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        if isPause != true && presenter.resumeGame != true {
            gameService.startAnimation(colorView: colorView,
                                       colorLabel: colorLabel,
                                       repeated: gameService.countOfRepeats,
                                       moveViewTime: gameService.viewMoveTime,
                                       durationType: .normal,
                                       startAnimationTime: nil,
                                       viewPosition: nil)
        }
        
    }
    
    @objc func updateTimer() {
        
        if secondPassed < totalTime {
            
            secondPassed += 1
            navigationItem.title = String(totalTime-secondPassed)
            
        } else {
            
            timer!.invalidate()
            timer = nil
            gameService.viewAnimator?.stopAnimation(true)
            gameService.viewAlphaAnimator?.stopAnimation(true)
            exitByTimer = true
            presenter.routeToResultScreen()
            
        }
        
    }
    
}

extension GameViewController {
    
    @objc func pauseButtonPressed() {
        
    }
    
}

extension GameViewController: GameViewProtocol {
    func success(successType: SuccessType) {
        switch successType {
        case .saveOk:
            presenter.routeToResultScreen()
        case .deleteOk:
            print("State deleted")
        case .defaultLoad:
            timerStart()
        case .settingView:
            viewModel = presenter.viewModel
            guard let viewModel = viewModel else { return }
            colorView.frame = viewModel.viewPosition
            colorLabel.frame = viewModel.textPosition
            colorView.backgroundColor = Colors.random.returnColorsByText(viewModel.backgroundColor).colorRowValue
            colorLabel.text = Colors.random.returnColorsByText(viewModel.textColor).colorDescription
            totalTime = viewModel.theRestOfTheCountdown
            gameService.viewMoveTime = viewModel.duration
            colorView.alpha = viewModel.alpha
            colorLabel.alpha = viewModel.alpha
            gameService.isRestoreAnimation = true
            isPause = true
            pauseLabel.isHidden = false
        }
    }
    
    func failure(error: Error) {
        let alert = UIAlertController(title: "Warning!", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            self.presenter.routeToResultScreen()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { action in
            self.presenter.routeToResultScreen()
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)    }
    
    
    func setSettings(totalTime: Int) {
        self.totalTime = totalTime
    }
    
}

