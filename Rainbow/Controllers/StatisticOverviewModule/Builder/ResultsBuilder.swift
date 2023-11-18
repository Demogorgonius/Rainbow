//
//  ResultsBuilder.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 14.11.2023.
//

import UIKit

final class ResultsBuilder {
    static func build() -> UIViewController {
        let router = ResultsRouter()
        let resultStorage = SettingsManager()
        let presenter = ResultsPresenter(router: router, resultStorage: resultStorage)
        let view = ResultsTableViewController(presenter: presenter)
        
        presenter.view = view
        router.view = view
        
        return view
    }
}
