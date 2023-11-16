//
//  MainViewController.swift
//  Rainbow
//
//  Created by Sergey on 12.11.2023.
//

import Foundation
import UIKit

class MainViewController: CustomViewController<MainView>, MainPresenterDelegate {
    
    var presenter: MainPresenterProtocol!
    var mainView = MainView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        mainView.presenter = presenter
        presenter.view = mainView
        view = mainView

    }
}
