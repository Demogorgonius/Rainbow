//
//  RulesViewController.swift
//  RainbowGame
//
//  Created by Danila Bolshakov on 13.11.2023.
//

import UIKit

final class RulesViewController: UIViewController {
    
    //MARK: - UI
    private lazy var rulesOfTheGame: InputViewCustom = {
        let field = InputViewCustom()
        field.style = .newRulesOfTheGame
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        view.backgroundColor = .RainbowGameColor.customBackground
        setViews()
        setConstrains()
        
    }
    
    //MARK: - Set Views
    private func setViews() {
        view.addSubviews(rulesOfTheGame)
    }
}

//MARK: - Set Constrains
extension RulesViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            rulesOfTheGame.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 82),
            rulesOfTheGame.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            rulesOfTheGame.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -37),
            rulesOfTheGame.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -29)
        ])
    }
}
