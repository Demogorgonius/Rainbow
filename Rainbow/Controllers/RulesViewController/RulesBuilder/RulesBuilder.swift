//
//  Builder.swift
//  Rainbow
//
//  Created by Danila Bolshakov on 14.11.2023.
//

import UIKit

//MARK: - RulesBuilderProtocol
protocol RulesBuilderProtocol { }

final class RulesBuilder: RulesBuilderProtocol {
    static func build() -> UIViewController {
        let router = RulesRouter()
        let presenter = RulesPresenter(router: router)
        let view = RulesViewController()
        presenter.view = view
        return view
    }
}
