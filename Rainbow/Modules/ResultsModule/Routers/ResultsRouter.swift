
import UIKit

protocol ResultsRouterProtocol {
    func routeToStartScreen()
    init(navigationController: UINavigationController?)
}

final class ResultsRouter: ResultsRouterProtocol {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func routeToStartScreen() {
        guard let navigationController else { return }
        let startScreen = MainBuilder(navigationController: navigationController).build()
        navigationController.setViewControllers([startScreen], animated: true)
    }
}
