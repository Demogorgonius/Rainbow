//
//  MainViewController.swift
//  Rainbow
//
//  Created by Sergey on 12.11.2023.
//

import Foundation
import UIKit

class MainViewController: CustomViewController<MainView> {
    
    var presenter: MainPresenterProtocol?
    var mainView = MainView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.presenter = presenter
        presenter?.view = mainView
        view = mainView

    }
}
