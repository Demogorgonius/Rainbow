
import Foundation

protocol ResultsPresenterProtocol {
    var resultStorage: ResultsStorageProtocol { get }
    
    func getStatistic()
    func clearStatisticOverview()
    func exitButtonPressed()
}

final class ResultsPresenter: ResultsPresenterProtocol {
    
    weak var view: ResultsViewProtocol?
    internal let resultStorage: ResultsStorageProtocol
    private let router: ResultsRouterProtocol
    
    init(router: ResultsRouterProtocol, resultStorage: ResultsStorageProtocol) {
        self.router = router
        self.resultStorage = resultStorage
    }
    
    func exitButtonPressed() {
        router.routeToStartScreen()
    }
    
    func getStatistic() {
        //
    }
    
    func clearStatisticOverview() {
        resultStorage.clearStatistic()
       
    }
}
