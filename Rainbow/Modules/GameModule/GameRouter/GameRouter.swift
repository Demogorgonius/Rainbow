
import UIKit

protocol GameRouterProtocol: AnyObject {
    func goToStatistics()
    init(navigationController: UINavigationController?)
}

class GameRouter: GameRouterProtocol {
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func goToStatistics() {
        guard let navigationController else { return }
        let resultsViewController = ResultsBuilder(navigationController: navigationController).build()
        navigationController.pushViewController(resultsViewController, animated: true)
    }
}
