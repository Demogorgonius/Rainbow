
import UIKit

final class RulesViewController: UIViewController {
    
    var mainView = InputViewCustom()
    
    //MARK: - UI
    private lazy var rulesOfTheGame: InputViewCustom = {
        let rules = InputViewCustom()
        rules.style = .newRulesOfTheGame
        rules.layer.cornerRadius = 20
        rules.translatesAutoresizingMaskIntoConstraints = false
        return rules
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupBackButton()
        setConstrains()
    }
    
    
    //MARK: - Set Views
    private func setViews() {
        view.addAnimatedGradientLayer()
        view.addSubviews(rulesOfTheGame)
    }
    
    private func setupBackButton() {
        navigationItem.title = NSLocalizedString("navigationItemTitle", comment: "")
        navigationController?.setupNavigationBar()
    }
}

//MARK: - Set Constrains
extension RulesViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            rulesOfTheGame.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 29),
            rulesOfTheGame.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            rulesOfTheGame.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -37),
            rulesOfTheGame.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -29)
        ])
    }
}


