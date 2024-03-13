
import UIKit
import SnapKit


final class GameViewController: UIViewController {
    
    // MARK: Properties
    var viewModel: ViewModel?
    var gameService: GameServiceProtocol!
    var presenter: GamePresenterProtocol!

    // MARK: - Timer settings
    
    var timer = Timer()
    var colorsAnimator: UIViewPropertyAnimator?
    
    private let gameView: GameView = {
        let view = GameView()
        return view
    }()
    
    
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        configureNavigationBar()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    // MARK: Private Methods
    private func addSubviews() {
        view.addAnimatedGradientLayer()
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

