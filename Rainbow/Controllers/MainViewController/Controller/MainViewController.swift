//
//  MainViewController.swift
//  Rainbow
//
//  Created by Sergey on 12.11.2023.
//

import Foundation
import UIKit

class MainViewController: CustomViewController<MainView> {
    
    var presenter: MainPresenterProtocol!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackground

    }
    
}
